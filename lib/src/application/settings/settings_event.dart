part of 'settings_bloc.dart';

@freezed
abstract class SettingsEvent with _$SettingsEvent {
  const factory SettingsEvent.initial(
    bool isNightModeEnabled,
    bool isAutoPlatEnabled,
    int seekValue,
    bool isRecordSearchHistoryEnabled,
    bool isRecordWatchHistoryEnabled,
  ) = _Initial;

  const factory SettingsEvent.nightModeSwitched(bool enabled) = _NightModeSwitched;

  const factory SettingsEvent.autoPlaySwitched(bool enabled) = _AutoPlaySwitched;
  const factory SettingsEvent.doubleTapToSeekValueChanged(int value) = _DoubleTapToSeekValueChanged;

  const factory SettingsEvent.clearSearchHistoryRequested() = _ClearSearchHistoryRequested;
  const factory SettingsEvent.clearWatchHistoryRequested() = _ClearWatchHistoryRequested;
  const factory SettingsEvent.searchHistoryEnabledSwitched(bool enabled) = _SearchHistoryEnabledSwitched;
  const factory SettingsEvent.watchHistoryEnabledSwitched(bool enabled) = _WatchHistoryEnabledSwitched;
  const factory SettingsEvent.clearFavoritesRequested() = _ClearFavoritesRequested;
}
