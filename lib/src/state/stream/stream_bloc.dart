import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../core/enums/language.dart';
import '../../core/enums/quality.dart';
import '../../data/local/preferences/preferences_helper.dart';
import '../../data/local/preferences/settings_helper.dart';
import '../../data/local/saved_movies/saved_movie_dao.dart';
import '../../data/local/watched_movies/watched_movie_dao.dart';
import '../../data/model/core/either.dart';
import '../../data/model/core/fetch_failure.dart';
import '../../data/model/models/movies/movie_data.dart';
import '../../data/model/models/movies/movie_position.dart';
import '../../data/model/models/movies/movies.dart';
import '../../data/model/models/seasons/episode.dart';
import '../../data/model/models/seasons/episode_file.dart';
import '../../data/model/models/seasons/season_files.dart';
import '../../data/model/models/watched_movies/watched_movie.dart';
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
    this._watchedMovieDao,
    this._settingsHelper,
    this._preferencesHelper,
  ) : super(StreamState.initial());

  final MovieService _movieService;
  final SavedMovieDao _savedMovieDao;
  final WatchedMovieDao _watchedMovieDao;
  final SettingsHelper _settingsHelper;
  final PreferencesHelper _preferencesHelper;

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
        await _movieService.getSeasonFiles(getMovieOrCrash.id, e.season, getMovieOrCrash.seasons.length);

    yield state.copyWith(seasonFiles: seasonFiles.get, season: e.season);
  }

  Stream<StreamState> _onEpisodeChanged(_EpisodeChanged event) async* {
    String? videoSrc;

    Language selectedLanguage = state.language;
    List<Language> languages = state.availableLanguages;

    Quality selectedQuality = state.quality;
    List<Quality> qualities = state.availableQualities;

    if (state.seasonFiles != null) {
      final Episode? episode = state.seasonFiles!.data.isNotEmpty
          ? state.seasonFiles!.data.firstWhere(
              (Episode element) => element.episode == event.episode,
              orElse: () => state.seasonFiles!.data.first,
            )
          : null;

      final List<Language> episodeLanguages = episode?.episodes.keys.toList() ?? <Language>[];
      if (!listEquals(languages, episodeLanguages)) {
        languages = episodeLanguages;
        final Language preferredLanguage = await _preferencesHelper.readPreferredLanguage();
        selectedLanguage = languages.firstWhere((Language e) => e == preferredLanguage, orElse: () => languages.first);

        final List<Quality> episodeQualities =
            episode?.episodes[selectedLanguage]?.map((EpisodeFile e) => e.quality).toList() ?? <Quality>[];

        if (!listEquals(qualities, episodeQualities)) {
          qualities = episodeQualities;
          final Quality preferredQuality = await _preferencesHelper.readPreferredQuality();
          selectedQuality = qualities.firstWhere((Quality e) => e == preferredQuality, orElse: () => qualities.first);
        }
      }

      videoSrc = episode?.episodes[selectedLanguage]?.firstWhere((EpisodeFile e) => e.quality == selectedQuality).src;
    }

    yield state.copyWith(
      videoSrc: videoSrc,
      startPosition: firstEpisodePassed ? const Duration() : state.startPosition,
      episode: event.episode,
      quality: selectedQuality,
      episodeSeason: state.season,
      language: selectedLanguage,
      availableLanguages: languages,
      availableQualities: qualities,
    );
    firstEpisodePassed = true;
  }

  Stream<StreamState> _onLanguageChanged(_LanguageChanged e) async* {
    String? videoSrc;

    if (state.seasonFiles != null) {
      final Episode? episode = state.seasonFiles!.data.isNotEmpty
          ? state.seasonFiles!.data.firstWhere(
              (Episode element) => element.episode == state.episode,
              orElse: () => state.seasonFiles!.data.first,
            )
          : null;

      videoSrc =
          episode?.episodes[e.language]?.firstWhere((EpisodeFile element) => element.quality == state.quality).src;
    }

    yield state.copyWith(
      videoSrc: videoSrc,
      startPosition: state.currentPosition,
      language: e.language,
    );
    await _preferencesHelper.writePreferredLanguage(e.language);
  }

  Stream<StreamState> _onQualityChanged(_QualityChanged e) async* {
    String? videoSrc;

    if (state.seasonFiles != null) {
      final Episode? episode = state.seasonFiles!.data.isNotEmpty
          ? state.seasonFiles!.data.firstWhere(
              (Episode element) => element.episode == state.episode,
              orElse: () => state.seasonFiles!.data.first,
            )
          : null;

      videoSrc =
          episode?.episodes[state.language]?.firstWhere((EpisodeFile element) => element.quality == e.quality).src;
    }

    yield state.copyWith(
      videoSrc: videoSrc,
      startPosition: state.currentPosition,
      quality: e.quality,
    );
    await _preferencesHelper.writePreferredQuality(e.quality);
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
      final int durationInMillis = state.seasonFiles!.data
              .firstWhere(
                (Episode element) => element.episode == state.episode,
                orElse: () => state.seasonFiles!.data.first,
              )
              .episodes
              .values
              .first
              .first
              .duration *
          1000;

      // TODO: 03/07/2021 refactor insert or update logic to SavedMovieDao method
      if (await _savedMovieDao.positionForMovieExists(movie.movieId, state.episodeSeason, state.episode)) {
        await _savedMovieDao.updateMoviePosition(movie.movieId, e.position.inMilliseconds);
      } else {
        _savedMovieDao.insertMoviePosition(MoviePosition(
          movieId: movie.movieId,
          durationInMillis: durationInMillis,
          leftAt: e.position.inMilliseconds,
          isTvShow: movie.isTvShow,
          season: state.season,
          episode: state.episode,
          timestamp: DateTime.now().millisecondsSinceEpoch,
        ));

        if (movie.genres.isNotEmpty) {
          await _savedMovieDao.saveMovieGenres(movie.movieId, movie.genres);
        }
      }

      await _watchedMovieDao.insertOrUpdateWatchedMovie(WatchedMovie(
        movieId: movie.movieId,
        watchedDurationInMillis: e.position.inMilliseconds,
        durationInMillis: durationInMillis,
        isTvShow: movie.isTvShow,
        season: state.episodeSeason,
        episode: state.episode,
      ));
    }
    yield state.copyWith(currentPosition: e.position);
  }
}
