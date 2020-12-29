part of 'settings_bloc.dart';

@freezed
abstract class SettingsState with _$SettingsState {
  const factory SettingsState(
    bool nightModeEnabled,
    bool autoPlayEnabled,
    int doubleTapToSeekValue,
    bool recordSearchHistoryEnabled,
    bool recordWatchHistoryEnabled,
  ) = _SettingsState;

  factory SettingsState.initial() => SettingsState(true, false, 10, true, true);
}
