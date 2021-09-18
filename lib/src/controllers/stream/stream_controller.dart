import 'package:collection/collection.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

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
import '../../ui/core/routes/route_args.dart';
import '../../ui/core/values/default_settings.dart';

class StreamSettings {
  const StreamSettings({
    required this.autoPlayEnabled,
    required this.recordWatchHistoryEnabled,
    required this.doubleTapToSeekValue,
  });

  factory StreamSettings.initial() {
    return const StreamSettings(
      autoPlayEnabled: DefaultSettings.isAutoPlayEnabled,
      recordWatchHistoryEnabled: DefaultSettings.recordWatchHistoryEnabled,
      doubleTapToSeekValue: DefaultSettings.doubleTapToSeekValue,
    );
  }

  final bool autoPlayEnabled;
  final bool recordWatchHistoryEnabled;
  final int doubleTapToSeekValue;

  @override
  String toString() {
    return 'StreamSettings{autoPlayEnabled: $autoPlayEnabled, recordWatchHistoryEnabled: $recordWatchHistoryEnabled, doubleTapToSeekValue: $doubleTapToSeekValue}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StreamSettings &&
          runtimeType == other.runtimeType &&
          autoPlayEnabled == other.autoPlayEnabled &&
          recordWatchHistoryEnabled == other.recordWatchHistoryEnabled &&
          doubleTapToSeekValue == other.doubleTapToSeekValue;

  @override
  int get hashCode => autoPlayEnabled.hashCode ^ recordWatchHistoryEnabled.hashCode ^ doubleTapToSeekValue.hashCode;
}

class StreamController extends GetxController {
  StreamController(
    this._movieService,
    this._savedMovieDao,
    this._watchedMovieDao,
    this._settingsHelper,
    this._preferencesHelper,
  );

  final MovieService _movieService;
  final SavedMovieDao _savedMovieDao;
  final WatchedMovieDao _watchedMovieDao;
  final SettingsHelper _settingsHelper;
  final PreferencesHelper _preferencesHelper;

  final Rx<StreamSettings> settings = StreamSettings.initial().obs;
  final Rxn<MovieData> movie = Rxn<MovieData>();
  final Rxn<SeasonFiles> seasonFiles = Rxn<SeasonFiles>();
  final Rxn<Movies> related = Rxn<Movies>();
  final RxnString videoSrc = RxnString();
  final Rx<Duration> startPosition = Duration.zero.obs;
  final Rx<Duration> currentPosition = Duration.zero.obs;
  final RxInt season = 1.obs;
  final RxInt episode = 1.obs;
  final RxInt episodeSeason = 1.obs;
  final Rx<Quality> quality = Quality.high.obs;
  final Rx<Language> language = Language.eng.obs;
  final RxList<Language> availableLanguages = <Language>[].obs;
  final RxList<Quality> availableQualities = <Quality>[].obs;

  bool firstEpisodePassed = false;

  MovieData get getMovieOrCrash => movie.value!;

  @override
  Future<void> onInit() async {
    super.onInit();

    SystemChrome.setPreferredOrientations(<DeviceOrientation>[
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    final bool isAutoPlayEnabled = await _settingsHelper.isAutoPlayEnabled();
    final bool recordWatchHistoryEnabled = await _settingsHelper.isRecordWatchHistoryEnabled();
    final int doubleTapToSeekValue = await _settingsHelper.getDoubleTapToSeekValue();

    settings.value = StreamSettings(
      autoPlayEnabled: isAutoPlayEnabled,
      recordWatchHistoryEnabled: recordWatchHistoryEnabled,
      doubleTapToSeekValue: doubleTapToSeekValue,
    );

    final StreamPageArgs args = Get.arguments as StreamPageArgs;

    startPosition.value = args.startAt;
    currentPosition.value = args.startAt;

    await _fetchAndSetMovie(args.movieId);
    await _fetchAndSetSeason(args.season);
    await _fetchAndSetEpisode(args.episode);
    await _fetchAndSetRelated(args.movieId);
  }

  @override
  Future<void> onClose() async {
    await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
      DeviceOrientation.portraitUp,
    ]);
    await SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: <SystemUiOverlay>[
        SystemUiOverlay.top,
        SystemUiOverlay.bottom,
      ],
    );
  }

  Future<void> onRelatedMoviePressed(int movieId) async {
    await _fetchAndSetMovie(movieId);
    await _fetchAndSetSeason(1);
    await _fetchAndSetEpisode(1);
    await _fetchAndSetRelated(movieId);
  }

  Future<void> onSeasonChanged(int season) async => _fetchAndSetSeason(season);

  Future<void> onEpisodeChanged(int episodeNumber) async => _fetchAndSetEpisode(episodeNumber);

  Future<void> onLanguageChanged(Language language) async {
    String? videoSrc;

    if (seasonFiles.value != null) {
      final Episode? episode = seasonFiles.value!.data.isNotEmpty
          ? seasonFiles.value!.data.firstWhere(
              (Episode element) => element.episode == this.episode.value,
              orElse: () => seasonFiles.value!.data.first,
            )
          : null;

      videoSrc = episode?.episodes[language]?.firstWhere((EpisodeFile element) => element.quality == quality.value).src;
    }

    this.videoSrc.value = videoSrc;
    startPosition.value = currentPosition.value;
    this.language.value = language;

    await _preferencesHelper.writePreferredLanguage(language);
  }

  Future<void> onQualityChanged(Quality quality) async {
    String? videoSrc;

    if (seasonFiles.value != null) {
      final Episode? episode = seasonFiles.value!.data.isNotEmpty
          ? seasonFiles.value!.data.firstWhere(
              (Episode element) => element.episode == this.episode.value,
              orElse: () => seasonFiles.value!.data.first,
            )
          : null;

      videoSrc = episode?.episodes[language.value]?.firstWhere((EpisodeFile element) => element.quality == quality).src;
    }

    this.videoSrc.value = videoSrc;
    startPosition.value = currentPosition.value;
    this.quality.value = quality;

    await _preferencesHelper.writePreferredQuality(quality);
  }

  Future<void> onFetchRelatedRequested(int movieId) async => _fetchAndSetRelated(movieId);

  Future<void> onPositionTick(Duration position) async {
    if (settings.value.recordWatchHistoryEnabled && seasonFiles.value != null) {
      final MovieData movie = getMovieOrCrash;
      final int durationInMillis = seasonFiles.value!.data
              .firstWhere(
                (Episode element) => element.episode == episode.value,
                orElse: () => seasonFiles.value!.data.first,
              )
              .episodes
              .values
              .first
              .first
              .duration *
          1000;

      // TODO: 03/07/2021 refactor insert or update logic to SavedMovieDao method
      if (await _savedMovieDao.positionForMovieExists(movie.movieId, episodeSeason.value, episode.value)) {
        await _savedMovieDao.updateMoviePosition(movie.movieId, position.inMilliseconds);
      } else {
        _savedMovieDao.insertMoviePosition(
          MoviePosition(
            movieId: movie.movieId,
            durationInMillis: durationInMillis,
            leftAt: position.inMilliseconds,
            isTvShow: movie.isTvShow,
            season: season.value,
            episode: episode.value,
            timestamp: DateTime.now().millisecondsSinceEpoch,
          ),
        );

        if (movie.genres.isNotEmpty) {
          await _savedMovieDao.saveMovieGenres(movie.movieId, movie.genres);
        }
      }

      await _watchedMovieDao.insertOrUpdateWatchedMovie(
        WatchedMovie(
          movieId: movie.movieId,
          watchedDurationInMillis: position.inMilliseconds,
          durationInMillis: durationInMillis,
          isTvShow: movie.isTvShow,
          season: episodeSeason.value,
          episode: episode.value,
        ),
      );
    }
    currentPosition.value = position;
  }

  Future<void> _fetchAndSetMovie(int movieId) async {
    final Either<FetchFailure, MovieData> movie = await _movieService.getMovie(movieId);
    this.movie.value = movie.get;
  }

  Future<void> _fetchAndSetSeason(int season) async {
    this.season.value = season;

    final Either<FetchFailure, SeasonFiles> seasonFiles =
        await _movieService.getSeasonFiles(getMovieOrCrash.id, season, getMovieOrCrash.seasons.length);

    this.seasonFiles.value = seasonFiles.get;
  }

  Future<void> _fetchAndSetEpisode(int episodeNumber) async {
    String? videoSrc;

    Language selectedLanguage = language.value;
    List<Language> languages = List<Language>.of(availableLanguages);

    Quality selectedQuality = quality.value;
    List<Quality> qualities = List<Quality>.of(availableQualities);

    if (seasonFiles.value != null) {
      final Episode? episode = seasonFiles.value!.data.isNotEmpty
          ? seasonFiles.value!.data.firstWhere(
            (Episode element) => element.episode == episodeNumber,
        orElse: () => seasonFiles.value!.data.first,
      )
          : null;

      final List<Language> episodeLanguages = episode?.episodes.keys.toList() ?? <Language>[];
      if (!const DeepCollectionEquality().equals(languages, episodeLanguages)) {
        languages = episodeLanguages;
        final Language preferredLanguage = await _preferencesHelper.readPreferredLanguage();
        selectedLanguage = languages.firstWhere((Language e) => e == preferredLanguage, orElse: () => languages.first);

        final List<Quality> episodeQualities =
            episode?.episodes[selectedLanguage]?.map((EpisodeFile e) => e.quality).toList() ?? <Quality>[];

        if (!const DeepCollectionEquality().equals(qualities, episodeQualities)) {
          qualities = episodeQualities;
          final Quality preferredQuality = await _preferencesHelper.readPreferredQuality();
          selectedQuality = qualities.firstWhere((Quality e) => e == preferredQuality, orElse: () => qualities.first);
        }
      }

      videoSrc = episode?.episodes[selectedLanguage]?.firstWhere((EpisodeFile e) => e.quality == selectedQuality).src;
    }

    this.videoSrc.value = videoSrc;
    startPosition.value = firstEpisodePassed ? Duration.zero : startPosition.value;
    episode.value = episodeNumber;
    quality.value = selectedQuality;
    episodeSeason.value = season.value;
    language.value = selectedLanguage;
    availableLanguages.value = languages;
    availableQualities.value = qualities;
    firstEpisodePassed = true;
  }

  Future<void> _fetchAndSetRelated(int movieId) async {
    final Either<FetchFailure, Movies> related = await _movieService.getRelatedMovies(movieId, 1);

    this.related.value = related.map((Movies r) {
      r.data.removeWhere((MovieData element) => !element.canBePlayed);
      return r;
    }).get;
  }
}
