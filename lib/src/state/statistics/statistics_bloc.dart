import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../core/enums/time_period.dart';
import '../../data/local/saved_movies/saved_movie_dao.dart';
import '../../data/local/watched_movies/watched_movie_dao.dart';
import '../../data/model/models/watched_movies/watched_duration.dart';
import '../../data/model/models/watched_movies/watched_movie.dart';

part 'statistics_bloc.freezed.dart';
part 'statistics_event.dart';
part 'statistics_state.dart';

@injectable
class StatisticsBloc extends Bloc<StatisticsEvent, StatisticsState> {
  StatisticsBloc(
    this._watchedMovieDao,
    this._savedMovieDao,
  ) : super(StatisticsState.initial());

  final WatchedMovieDao _watchedMovieDao;
  final SavedMovieDao _savedMovieDao;

  @override
  Stream<StatisticsState> mapEventToState(
    StatisticsEvent event,
  ) async* {
    yield* event.map(
      init: _init,
      timePeriodChanged: _timePeriodChanged,
      refreshData: _refreshData,
    );
  }

  Stream<StatisticsState> _init(_Init event) async* {
    add(const StatisticsEvent.refreshData());
  }

  Stream<StatisticsState> _timePeriodChanged(_TimePeriodChanged event) async* {
    yield state.copyWith(timePeriod: event.timePeriod);

    final List<WatchedDuration> watchedDurations = await _calculateWatchedDurations();
    final Duration averageTime = await _calculateAverageTime(watchedDurations);

    yield state.copyWith(
      watchedDurations: watchedDurations,
      averageTime: averageTime,
    );
  }

  Stream<StatisticsState> _refreshData(_RefreshData event) async* {
    final List<WatchedMovie> moviesWatched = await _watchedMovieDao.getWatchedMovies();
    final List<WatchedMovie> episodesWatched = await _watchedMovieDao.getWatchedEpisodes();
    final int tvSeriesWatched = episodesWatched.map((WatchedMovie e) => e.movieId).toSet().length;

    yield state.copyWith(
      moviesWatched: moviesWatched.length,
      episodesWatched: episodesWatched.length,
      tvSeriesWatched: tvSeriesWatched,
    );

    final List<WatchedDuration> watchedDurations = await _calculateWatchedDurations();
    final Duration averageTime = await _calculateAverageTime(watchedDurations);

    yield state.copyWith(
      watchedDurations: watchedDurations,
      averageTime: averageTime,
    );

    final List<String> savedMovieGenres = await _savedMovieDao.getMovieGenres();
    final Map<String, int> genreToCount = <String, int>{};
    for (final String genre in savedMovieGenres) {
      if (genreToCount.containsKey(genre)) {
        genreToCount[genre] = genreToCount[genre]! + 1;
      } else {
        genreToCount[genre] = 1;
      }
    }
    const int maxLength = 6;
    List<MapEntry<String, int>> modified = genreToCount.entries
        .sorted((MapEntry<String, int> a, MapEntry<String, int> b) => b.value.compareTo(a.value))
        .toList();
    modified = modified.length <= maxLength - 1 ? modified : modified.take(maxLength - 1).toList();
    if (genreToCount.length > maxLength - 1) {
      int otherCount = 0;
      for (final MapEntry<String, int> e in genreToCount.entries) {
        if (!modified.any((MapEntry<String, int> entry) => entry.key == e.key)) {
          otherCount += e.value;
        }
      }
      if (otherCount > 0) {
        modified.add(MapEntry<String, int>('Other', otherCount));
      }
    }

    final Map<String, double> genreToPercentage = <String, double>{
      for (MapEntry<String, int> entry in modified) entry.key: entry.value.toDouble() / savedMovieGenres.length
    };
    yield state.copyWith(genreToPercentage: genreToPercentage);
  }

  Future<List<WatchedDuration>> _calculateWatchedDurations() async {
    late final int? timestampFrom;
    final DateTime now = DateTime.now();
    switch (state.timePeriod) {
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
      switch (state.timePeriod) {
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
