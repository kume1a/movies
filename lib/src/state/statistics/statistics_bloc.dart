import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../core/enums/time_period.dart';
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
  ) : super(StatisticsState.initial());

  final WatchedMovieDao _watchedMovieDao;

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
    final double average = watchedDurations.map((WatchedDuration e) {
          return e.durationInMillis;
        }).reduce((BigInt a, BigInt b) => a + b) /
        BigInt.from(watchedDurations.length);

    yield state.copyWith(
      watchedDurations: watchedDurations,
      averageTime: Duration(milliseconds: average.round()),
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
    final double average = watchedDurations.map((WatchedDuration e) {
          return e.durationInMillis;
        }).reduce((BigInt a, BigInt b) => a + b) /
        BigInt.from(watchedDurations.length);

    yield state.copyWith(
      watchedDurations: watchedDurations,
      averageTime: Duration(milliseconds: average.round()),
    );
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
}
