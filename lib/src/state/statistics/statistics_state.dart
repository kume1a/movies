part of 'statistics_bloc.dart';

@freezed
class StatisticsState with _$StatisticsState {
  const factory StatisticsState({
    required int moviesWatched,
    required int episodesWatched,
    required TimePeriod timePeriod,
    // TODO: 03/07/2021 add watch time line chart data
    required Duration averageTime,
    // TODO: 03/07/2021 add pie chart data
  }) = _StatisticsState;

  factory StatisticsState.initial() => const StatisticsState(
    moviesWatched: 0,
    episodesWatched: 0,
    timePeriod: TimePeriod.week,
    averageTime: Duration.zero,
  );
}
