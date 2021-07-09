part of 'settings_bloc.dart';

@freezed
class SettingsEvent with _$SettingsEvent {
  const factory SettingsEvent.init() = _Init;

  const factory SettingsEvent.autoPlaySwitched({required bool enabled}) = _AutoPlaySwitched;
  const factory SettingsEvent.doubleTapToSeekValueChanged(int value) = _DoubleTapToSeekValueChanged;

  const factory SettingsEvent.clearSearchHistoryRequested() = _ClearSearchHistoryRequested;
  const factory SettingsEvent.clearWatchHistoryRequested() = _ClearWatchHistoryRequested;
  const factory SettingsEvent.searchHistoryEnabledSwitched({required bool enabled}) = _SearchHistoryEnabledSwitched;
  const factory SettingsEvent.watchHistoryEnabledSwitched({required bool enabled}) = _WatchHistoryEnabledSwitched;
  const factory SettingsEvent.clearFavoritesRequested({required bool clearGroups}) = _ClearFavoritesRequested;
  const factory SettingsEvent.clearCacheRequested() = _ClearCacheRequested;
}
