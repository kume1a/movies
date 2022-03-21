import 'package:collection/collection.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

import '../../core/enums/movie_genre.dart';
import '../../core/enums/time_period.dart';
import '../../data/local/saved_movies/saved_movie_dao.dart';
import '../../data/local/watched_movies/watched_movie_dao.dart';
import '../../data/model/models/watched_movies/watched_duration.dart';
import '../../data/model/models/watched_movies/watched_movie.dart';
import '../../ui/core/routes/screens_navigator.dart';

@injectable
class StatisticsController extends GetxController {
  StatisticsController(
    this._watchedMovieDao,
    this._savedMovieDao,
  );

  final WatchedMovieDao _watchedMovieDao;
  final SavedMovieDao _savedMovieDao;

  final RxInt moviesWatched = 0.obs;
  final RxInt tvSeriesWatched = 0.obs;
  final RxInt episodesWatched = 0.obs;
  final Rx<TimePeriod> timePeriod = TimePeriod.week.obs;
  final RxList<WatchedDuration> watchedDurations = <WatchedDuration>[].obs;
  final Rx<Duration> averageTime = Duration.zero.obs;
  final RxMap<MovieGenre?, double> genreToPercentage = <MovieGenre?, double>{}.obs;

  @override
  void onInit() {
    super.onInit();

    _refreshData();
  }

  Future<void> onTimePeriodChanged(TimePeriod timePeriod) async {
    final List<WatchedDuration> watchedDurations = await _calculateWatchedDurations(timePeriod);
    final Duration averageTime = await _calculateAverageTime(watchedDurations);

    this.watchedDurations.value = watchedDurations;
    this.averageTime.value = averageTime;
    this.timePeriod.value = timePeriod;
  }

  Future<void> onScreenVisible() async => _refreshData();

  void onSettingsPressed() => ScreensNavigator.pushSettingsPage();

  Future<void> _refreshData() async {
    final List<WatchedMovie> moviesWatched = await _watchedMovieDao.getWatchedMovies();
    final List<WatchedMovie> episodesWatched = await _watchedMovieDao.getWatchedEpisodes();
    final int tvSeriesWatched = episodesWatched.map((WatchedMovie e) => e.movieId).toSet().length;

    final List<WatchedDuration> watchedDurations = await _calculateWatchedDurations(timePeriod.value);
    final Duration averageTime = await _calculateAverageTime(watchedDurations);

    final List<MovieGenre> savedMovieGenres = await _savedMovieDao.getMovieGenres();
    final Map<MovieGenre?, int> genreToCount = <MovieGenre?, int>{};
    for (final MovieGenre? genre in savedMovieGenres) {
      if (genreToCount.containsKey(genre)) {
        genreToCount[genre] = genreToCount[genre]! + 1;
      } else {
        genreToCount[genre] = 1;
      }
    }
    const int maxLength = 6;
    List<MapEntry<MovieGenre?, int>> modified = genreToCount.entries
        .sorted((MapEntry<MovieGenre?, int> a, MapEntry<MovieGenre?, int> b) => b.value.compareTo(a.value))
        .toList();
    modified = modified.length <= maxLength - 1 ? modified : modified.take(maxLength - 1).toList();
    if (genreToCount.length > maxLength - 1) {
      int otherCount = 0;
      for (final MapEntry<MovieGenre?, int> e in genreToCount.entries) {
        if (!modified.any((MapEntry<MovieGenre?, int> entry) => entry.key == e.key)) {
          otherCount += e.value;
        }
      }
      if (otherCount > 0) {
        modified.add(MapEntry<MovieGenre?, int>(null, otherCount));
      }
    }

    final Map<MovieGenre?, double> genreToPercentage = <MovieGenre?, double>{
      for (MapEntry<MovieGenre?, int> entry in modified) entry.key: entry.value.toDouble() / savedMovieGenres.length
    };

    this.watchedDurations.value = watchedDurations;
    this.averageTime.value = averageTime;
    this.moviesWatched.value = moviesWatched.length;
    this.episodesWatched.value = episodesWatched.length;
    this.tvSeriesWatched.value = tvSeriesWatched;
    this.genreToPercentage.value = genreToPercentage;
  }

  Future<List<WatchedDuration>> _calculateWatchedDurations(TimePeriod timePeriod) async {
    late final int? timestampFrom;
    final DateTime now = DateTime.now();
    switch (timePeriod) {
      case TimePeriod.year:
        timestampFrom = DateTime(now.year - 1, now.month, now.day).millisecondsSinceEpoch;
        break;
      case TimePeriod.month:
        timestampFrom = DateTime(now.year, now.month - 1, now.day).millisecondsSinceEpoch;
        break;
      case TimePeriod.week:
        timestampFrom = DateTime(now.year, now.month, now.day - 7).millisecondsSinceEpoch;
        break;
    }
    final List<WatchedMovie> watchedMovies = await _watchedMovieDao.getAll(timestampFrom);
    final List<WatchedDuration> watchedDurations = watchedMovies
        .groupListsBy((WatchedMovie e) => DateTime(e.date!.year, e.date!.month, e.date!.day))
        .map((DateTime date, List<WatchedMovie> watchedMovies) {
          final BigInt watchedDurationInMillis = watchedMovies.fold(
            BigInt.zero,
            (BigInt previousValue, WatchedMovie element) =>
                previousValue + BigInt.from(element.watchedDurationInMillis),
          );

          return MapEntry<DateTime, BigInt>(date, watchedDurationInMillis);
        })
        .entries
        .map((MapEntry<DateTime, BigInt> e) => WatchedDuration(durationInMillis: e.value, date: e.key))
        .toList();

    if (watchedDurations.isNotEmpty) {
      final Duration diff = watchedDurations.last.date.difference(watchedDurations.first.date);
      switch (timePeriod) {
        case TimePeriod.year:
          if (diff.inDays < 365) {
            final WatchedDuration lastYear =
                WatchedDuration(durationInMillis: BigInt.zero, date: DateTime(now.year - 1, now.month, now.day));
            final WatchedDuration last0 =
                WatchedDuration(durationInMillis: BigInt.zero, date: watchedDurations.first.date);

            watchedDurations.insert(0, last0);
            watchedDurations.insert(0, lastYear);
          }
          break;
        case TimePeriod.month:
          if (diff.inDays < 30) {
            final WatchedDuration lastMonth =
                WatchedDuration(durationInMillis: BigInt.zero, date: DateTime(now.year, now.month - 1, now.day));
            final WatchedDuration last0 =
                WatchedDuration(durationInMillis: BigInt.zero, date: watchedDurations.first.date);

            watchedDurations.insert(0, last0);
            watchedDurations.insert(0, lastMonth);
          }
          break;
        case TimePeriod.week:
          if (diff.inDays < 7) {
            final WatchedDuration lastWeek =
                WatchedDuration(durationInMillis: BigInt.zero, date: DateTime(now.year, now.month, now.day - 7));
            final WatchedDuration last0 =
                WatchedDuration(durationInMillis: BigInt.zero, date: watchedDurations.first.date);

            watchedDurations.insert(0, last0);
            watchedDurations.insert(0, lastWeek);
          }
          break;
      }
    }
    return watchedDurations;
  }

  Future<Duration> _calculateAverageTime(List<WatchedDuration> watchedDurations) async {
    if (watchedDurations.isEmpty) return Duration.zero;

    final double average = watchedDurations.map((WatchedDuration e) {
          return e.durationInMillis;
        }).reduce((BigInt a, BigInt b) => a + b) /
        BigInt.from(watchedDurations.length);

    return Duration(milliseconds: average.round());
  }
}
