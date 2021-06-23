part of 'settings_bloc.dart';

@freezed
abstract class SettingsEvent with _$SettingsEvent {
  const factory SettingsEvent.initial({
    required bool isNightModeEnabled,
    required bool isAutoPlatEnabled,
    required int seekValue,
    required bool isRecordSearchHistoryEnabled,
    required bool isRecordWatchHistoryEnabled,
  }) = _Initial;

  const factory SettingsEvent.nightModeSwitched({required bool enabled}) = _NightModeSwitched;

  const factory SettingsEvent.autoPlaySwitched({required bool enabled}) = _AutoPlaySwitched;
  const factory SettingsEvent.doubleTapToSeekValueChanged(int value) = _DoubleTapToSeekValueChanged;

  const factory SettingsEvent.clearSearchHistoryRequested() = _ClearSearchHistoryRequested;
  const factory SettingsEvent.clearWatchHistoryRequested() = _ClearWatchHistoryRequested;
  const factory SettingsEvent.searchHistoryEnabledSwitched({required bool enabled}) = _SearchHistoryEnabledSwitched;
  const factory SettingsEvent.watchHistoryEnabledSwitched({required bool enabled}) = _WatchHistoryEnabledSwitched;
  const factory SettingsEvent.clearFavoritesRequested() = _ClearFavoritesRequested;
}
