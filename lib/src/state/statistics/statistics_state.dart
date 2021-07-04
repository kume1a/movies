part of 'statistics_bloc.dart';

@freezed
class StatisticsState with _$StatisticsState {
  const factory StatisticsState({
    required int moviesWatched,
    required int tvSeriesWatched,
    required int episodesWatched,
    required TimePeriod timePeriod,
    required List<WatchedDuration> watchedDurations,
    required Duration averageTime,
    required Map<String, double> genreToPercentage,
  }) = _StatisticsState;

  factory StatisticsState.initial() => StatisticsState(
    moviesWatched: 0,
    tvSeriesWatched: 0,
    episodesWatched: 0,
    timePeriod: TimePeriod.week,
    watchedDurations: List<WatchedDuration>.empty(),
    averageTime: Duration.zero,
    genreToPercentage: <String, double>{},
  );
}
