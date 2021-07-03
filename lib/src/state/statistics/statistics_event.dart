part of 'statistics_bloc.dart';

@freezed
class StatisticsEvent with _$StatisticsEvent {
  const factory StatisticsEvent.init() = _Init;

  const factory StatisticsEvent.timePeriodChanged(TimePeriod timePeriod) = _TimePeriodChanged;

  const factory StatisticsEvent.refreshData() = _RefreshData;
}
