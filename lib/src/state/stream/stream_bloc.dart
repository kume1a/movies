import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:path_provider/path_provider.dart';

import '../../data/i_movie_repository.dart';
import '../../data/models/movie_position/movie_position_model.dart';
import '../../data/schemas/actors/season_files/season_files_model.dart';
import '../../data/schemas/core/enums.dart';
import '../../data/schemas/core/utils.dart';
import '../../data/schemas/movie/movie_data_model.dart';
import '../../data/schemas/movies/movies_model.dart';
import '../../data/services/i_saved_movies_manager.dart';
import '../../data/services/i_settings_manager.dart';
import '../../ui/values/default_settings.dart';
import '../../utils.dart';

part 'stream_bloc.freezed.dart';
part 'stream_event.dart';
part 'stream_state.dart';

@injectable
class StreamBloc extends Bloc<StreamEvent, StreamState> {
  StreamBloc(
    this._repository,
    this._settingsManager,
    this._savedMoviesManager,
  ) : super(StreamState.initial()) {
    _init();
  }

  final IMovieRepository _repository;
  final ISettingsManager _settingsManager;
  final ISavedMoviesManager _savedMoviesManager;

  Future<void> _init() async {
    final bool isAutoPlayEnabled = await _settingsManager.isAutoPlayEnabled();
    final bool recordWatchHistoryEnabled = await _settingsManager.isRecordWatchHistoryEnabled();
    final int doubleTapToSeekValue = await _settingsManager.getDoubleTapToSeekValue();

    final StreamSettings settings = StreamSettings(
      autoPlayEnabled: isAutoPlayEnabled,
      recordWatchHistoryEnabled: recordWatchHistoryEnabled,
      doubleTapToSeekValue: doubleTapToSeekValue,
    );
    add(StreamEvent.settingsFetched(settings));
  }

  bool firstEpisodePassed = false;

  MovieData get getMovieOrCrash => state.movie.getOrElse(() => throw StateError("movie can't be none"));

  @override
  Stream<StreamState> mapEventToState(
    StreamEvent event,
  ) async* {
    yield* event.map(
      settingsFetched: _onSettingsFetched,
      movieChanged: _onMovieChanged,
      seasonChanged: _onSeasonChanged,
      episodeChanged: _onEpisodeChanged,
      languageChanged: _onLanguageChanged,
      qualityChanged: _onQualityChanged,
      fetchRelatedRequested: _onFetchRelatedRequested,
      startPositionChanged: _onStartPositionChanged,
      onPositionTick: _onPositionTick,
      downloadRequested: _downloadRequested,
      permissionDenied: _permissionDenied,
      removeMessages: _removeMessages,
    );
  }

  Stream<StreamState> _onSettingsFetched(_SettingsFetched e) async* {
    yield state.copyWith(settings: e.settings);
  }

  Stream<StreamState> _onMovieChanged(_MovieChanged e) async* {
    final Option<MovieData> movie = await _repository.fetchMovie(e.movieId);
    yield state.copyWith(movie: movie);
  }

  Stream<StreamState> _onSeasonChanged(_SeasonChanged e) async* {
    final Option<SeasonFiles> seasonFilesOption = await _repository.fetchSeasonFiles(getMovieOrCrash.id, e.season);

    yield state.copyWith(seasonFilesOption: seasonFilesOption, season: e.season ?? 1);
  }

  Stream<StreamState> _onEpisodeChanged(_EpisodeChanged e) async* {
    Option<String> srcOption = none();

    Language selectedLanguage = state.language;
    List<Language> languages = state.availableLanguages;

    Quality selectedQuality = state.quality;
    List<Quality> qualities = state.availableQualities;

    state.seasonFilesOption.foldSome(
      (SeasonFiles a) {
        final Episode episode = a.data.isNotEmpty
            ? a.data.firstWhere(
                (Episode element) => element.episode == e.episode,
                orElse: () => a.data.first,
              )
            : null;

        final List<Language> episodeLanguages = episode?.episodes?.keys?.toList() ?? <Language>[];
        if (!listEquals(languages, episodeLanguages)) {
          languages = episodeLanguages;
          selectedLanguage = getPreferredOrElse<Language>(languages, Language.eng);

          final List<Quality> episodeQualities =
              episode?.episodes[selectedLanguage]?.map((EpisodeFile e) => e.quality)?.toList() ?? <Quality>[];

          if (!listEquals(qualities, episodeQualities)) {
            qualities = episodeQualities;
            selectedQuality = getPreferredOrElse<Quality>(qualities, Quality.high);
          }
        }

        srcOption = optionOf(
            episode?.episodes[selectedLanguage]?.firstWhere((EpisodeFile e) => e.quality == selectedQuality)?.src);
      },
    );

    yield state.copyWith(
      videoSrcOption: srcOption,
      startPosition: firstEpisodePassed ? const Duration() : state.startPosition,
      episode: e.episode,
      quality: selectedQuality,
      episodeSeason: state.season,
      language: selectedLanguage,
      availableLanguages: languages,
      availableQualities: qualities,
    );
    firstEpisodePassed = true;
  }

  Stream<StreamState> _onLanguageChanged(_LanguageChanged e) async* {
    Option<String> srcOption = none();

    state.seasonFilesOption.foldSome(
      (SeasonFiles a) {
        final Episode episode = a.data.isNotEmpty
            ? a.data.firstWhere(
                (Episode element) => element.episode == state.episode,
                orElse: () => a.data.first,
              )
            : null;

        srcOption = optionOf(
            episode?.episodes[e.language]?.firstWhere((EpisodeFile element) => element.quality == state.quality)?.src);
      },
    );

    yield state.copyWith(
      videoSrcOption: srcOption,
      startPosition: state.currentPosition,
      language: e.language,
    );
  }

  Stream<StreamState> _onQualityChanged(_QualityChanged e) async* {
    Option<String> srcOption = none();

    state.seasonFilesOption.foldSome(
      (SeasonFiles a) {
        final Episode episode = a.data.isNotEmpty
            ? a.data.firstWhere(
                (Episode element) => element.episode == state.episode,
                orElse: () => a.data.first,
              )
            : null;

        srcOption = optionOf(
            episode?.episodes[state.language]?.firstWhere((EpisodeFile element) => element.quality == e.quality)?.src);
      },
    );

    yield state.copyWith(
      videoSrcOption: srcOption,
      startPosition: state.currentPosition,
      quality: e.quality,
    );
  }

  Stream<StreamState> _onFetchRelatedRequested(_FetchRelatedRequested e) async* {
    final Option<Movies> related = await _repository.fetchRelated(getMovieOrCrash.movieId, 1);
    related.foldSome((Movies a) {
      a.data.removeWhere((MovieData element) => !element.canBePlayed);
    });
    yield state.copyWith(relatedOption: related);
  }

  Stream<StreamState> _onStartPositionChanged(_StartPositionChanged e) async* {
    yield state.copyWith(
      startPosition: e.position,
      currentPosition: e.position,
    );
  }

  Stream<StreamState> _onPositionTick(_OnPositionTick e) async* {
    if (state.settings.recordWatchHistoryEnabled) {
      state.seasonFilesOption.foldSome(
        (SeasonFiles a) {
          final MovieData movie = getMovieOrCrash;
          final int durationInSeconds = a.data
              .firstWhere(
                (Episode element) => element.episode == state.episode,
                orElse: () => a.data.first,
              )
              .episodes
              .values
              .first
              .first
              .duration;

          final MoviePosition position = MoviePosition(
            movie.movieId,
            durationInSeconds * 1000,
            e.position.inMilliseconds,
            movie.isTvShow,
            state.season,
            state.episode,
            DateTime.now().millisecondsSinceEpoch,
          );
          _savedMoviesManager.saveMoviePosition(position);
        },
      );
    }
    yield state.copyWith(currentPosition: e.position);
  }

  Stream<StreamState> _downloadRequested(_DownloadRequested e) async* {
    if (state.videoSrcOption.isSome() && state.movie.isSome()) {
      final String videoSrcUrl = state.videoSrcOption.getOrElse(() => throw Exception()); // ignored
      final MovieData movieData = state.movie.getOrElse(() => throw Exception()); // ignored
      final String fileName = '${movieData.name}__${DateTime.now().millisecondsSinceEpoch}.mp4';

      final Directory externalDir = await getExternalStorageDirectory();

      yield state.copyWith(shouldShowDownloadStartedMessage: true);

      await FlutterDownloader.enqueue(
        url: videoSrcUrl,
        savedDir: externalDir.path,
        fileName: fileName,
      );
    }
  }

  Stream<StreamState> _permissionDenied(_PermissionDenied e) async* {
    yield state.copyWith(shouldShowPermissionDeniedMessage: true);
  }

  Stream<StreamState> _removeMessages(_RemoveMessages e) async* {
    yield state.copyWith(
      shouldShowPermissionDeniedMessage: false,
      shouldShowDownloadStartedMessage: false,
    );
  }
}