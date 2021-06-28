import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:path_provider/path_provider.dart';

import '../../data/local/saved_movies/saved_movie_dao.dart';
import '../../data/local/settings/settings_helper.dart';
import '../../data/model/core/either.dart';
import '../../data/model/core/fetch_failure.dart';
import '../../data/model/core/option.dart';
import '../../data/model/models/movies/movie_data.dart';
import '../../data/model/models/movies/movie_position.dart';
import '../../data/model/models/movies/movies.dart';
import '../../data/model/models/seasons/episode.dart';
import '../../data/model/models/seasons/episode_file.dart';
import '../../data/model/models/seasons/season_files.dart';
import '../../data/model/schemas/core/enums.dart';
import '../../data/model/schemas/core/utils.dart';
import '../../data/network/services/movie_service.dart';
import '../../ui/core/values/default_settings.dart';

part 'stream_bloc.freezed.dart';
part 'stream_event.dart';
part 'stream_state.dart';

@injectable
class StreamBloc extends Bloc<StreamEvent, StreamState> {
  StreamBloc(
    this._movieService,
    this._savedMovieDao,
    this._settingsHelper,
  ) : super(StreamState.initial());

  final MovieService _movieService;
  final SavedMovieDao _savedMovieDao;
  final SettingsHelper _settingsHelper;

  bool firstEpisodePassed = false;

  MovieData get getMovieOrCrash => state.movie!;

  @override
  Stream<StreamState> mapEventToState(
    StreamEvent event,
  ) async* {
    yield* event.map(
      init: _init,
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

  Stream<StreamState> _init(_Init e) async* {
    final bool isAutoPlayEnabled = await _settingsHelper.isAutoPlayEnabled();
    final bool recordWatchHistoryEnabled = await _settingsHelper.isRecordWatchHistoryEnabled();
    final int doubleTapToSeekValue = await _settingsHelper.getDoubleTapToSeekValue();

    final StreamSettings settings = StreamSettings(
      autoPlayEnabled: isAutoPlayEnabled,
      recordWatchHistoryEnabled: recordWatchHistoryEnabled,
      doubleTapToSeekValue: doubleTapToSeekValue,
    );
    yield state.copyWith(settings: settings);
  }

  Stream<StreamState> _onMovieChanged(_MovieChanged e) async* {
    final Either<FetchFailure, MovieData> movie = await _movieService.getMovie(e.movieId);
    yield state.copyWith(movie: movie.get);
  }

  Stream<StreamState> _onSeasonChanged(_SeasonChanged e) async* {
    final Either<FetchFailure, SeasonFiles> seasonFiles =
        await _movieService.getSeasonFiles(getMovieOrCrash.id, e.season);

    yield state.copyWith(seasonFiles: seasonFiles.get, season: e.season);
  }

  Stream<StreamState> _onEpisodeChanged(_EpisodeChanged e) async* {
    Option<String> srcOption = none();

    Language selectedLanguage = state.language;
    List<Language> languages = state.availableLanguages;

    Quality selectedQuality = state.quality;
    List<Quality> qualities = state.availableQualities;

    if (state.seasonFiles != null) {
      final Episode? episode = state.seasonFiles!.data.isNotEmpty
          ? state.seasonFiles!.data.firstWhere(
              (Episode element) => element.episode == e.episode,
              orElse: () => state.seasonFiles!.data.first,
            )
          : null;

      final List<Language> episodeLanguages = episode?.episodes.keys.toList() ?? <Language>[];
      if (!listEquals(languages, episodeLanguages)) {
        languages = episodeLanguages;
        selectedLanguage = getPreferredOrElse<Language>(languages, Language.eng) ?? Language.eng;

        final List<Quality> episodeQualities =
            episode?.episodes[selectedLanguage]?.map((EpisodeFile e) => e.quality).toList() ?? <Quality>[];

        if (!listEquals(qualities, episodeQualities)) {
          qualities = episodeQualities;
          selectedQuality = getPreferredOrElse<Quality>(qualities, Quality.high) ?? Quality.high;
        }
      }

      srcOption = optionOf(
          episode?.episodes[selectedLanguage]?.firstWhere((EpisodeFile e) => e.quality == selectedQuality).src);
    }

    yield state.copyWith(
      videoSrc: srcOption.get,
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

    if (state.seasonFiles != null) {
      final Episode? episode = state.seasonFiles!.data.isNotEmpty
          ? state.seasonFiles!.data.firstWhere(
              (Episode element) => element.episode == state.episode,
              orElse: () => state.seasonFiles!.data.first,
            )
          : null;

      srcOption = optionOf(
          episode?.episodes[e.language]?.firstWhere((EpisodeFile element) => element.quality == state.quality).src);
    }

    yield state.copyWith(
      videoSrc: srcOption.get,
      startPosition: state.currentPosition,
      language: e.language,
    );
  }

  Stream<StreamState> _onQualityChanged(_QualityChanged e) async* {
    Option<String> srcOption = none();

    if (state.seasonFiles != null) {
      final Episode? episode = state.seasonFiles!.data.isNotEmpty
          ? state.seasonFiles!.data.firstWhere(
              (Episode element) => element.episode == state.episode,
              orElse: () => state.seasonFiles!.data.first,
            )
          : null;

      srcOption = optionOf(
          episode?.episodes[state.language]?.firstWhere((EpisodeFile element) => element.quality == e.quality).src);
    }

    yield state.copyWith(
      videoSrc: srcOption.get,
      startPosition: state.currentPosition,
      quality: e.quality,
    );
  }

  Stream<StreamState> _onFetchRelatedRequested(_FetchRelatedRequested e) async* {
    final Either<FetchFailure, Movies> related = await _movieService.getRelatedMovies(getMovieOrCrash.movieId, 1);
    yield state.copyWith(
      related: related.map((Movies r) {
        r.data.removeWhere((MovieData element) => !element.canBePlayed);
        return r;
      }).get,
    );
  }

  Stream<StreamState> _onStartPositionChanged(_StartPositionChanged e) async* {
    yield state.copyWith(
      startPosition: e.position,
      currentPosition: e.position,
    );
  }

  Stream<StreamState> _onPositionTick(_OnPositionTick e) async* {
    if (state.settings.recordWatchHistoryEnabled && state.seasonFiles != null) {
      final MovieData movie = getMovieOrCrash;
      if (await _savedMovieDao.positionForMovieExists(movie.movieId)) {
        await _savedMovieDao.updateMoviePosition(movie.movieId, e.position.inMilliseconds);
      } else {
        final int durationInSeconds = state.seasonFiles!.data
            .firstWhere(
              (Episode element) => element.episode == state.episode,
              orElse: () => state.seasonFiles!.data.first,
            )
            .episodes
            .values
            .first
            .first
            .duration;

        final MoviePosition position = MoviePosition(
          movieId: movie.movieId,
          durationInMillis: durationInSeconds * 1000,
          leftAt: e.position.inMilliseconds,
          isTvShow: movie.isTvShow,
          season: state.season,
          episode: state.episode,
          timestamp: DateTime.now().millisecondsSinceEpoch,
        );
        _savedMovieDao.insertMoviePosition(position);
      }
    }
    yield state.copyWith(currentPosition: e.position);
  }

  Stream<StreamState> _downloadRequested(_DownloadRequested e) async* {
    if (state.videoSrc != null && state.movie != null) {
      final String videoSrcUrl = state.videoSrc!;
      final MovieData movieData = state.movie!;
      final String fileName = '${movieData.name}__${DateTime.now().millisecondsSinceEpoch}.mp4';

      final Directory? externalDir = await getExternalStorageDirectory();

      if (externalDir != null) {
        yield state.copyWith(shouldShowDownloadStartedMessage: true);

        await FlutterDownloader.enqueue(
          url: videoSrcUrl,
          savedDir: externalDir.path,
          fileName: fileName,
        );
      }
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
