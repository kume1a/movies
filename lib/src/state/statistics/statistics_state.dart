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
    // TODO: 03/07/2021 add pie chart data
  }) = _StatisticsState;

  factory StatisticsState.initial() => StatisticsState(
    moviesWatched: 0,
    tvSeriesWatched: 0,
    episodesWatched: 0,
    timePeriod: TimePeriod.week,
    watchedDurations: List<WatchedDuration>.empty(),
    averageTime: Duration.zero,
  );
}
