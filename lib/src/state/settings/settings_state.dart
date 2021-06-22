part of 'settings_bloc.dart';

@freezed
abstract class SettingsState with _$SettingsState {
  const factory SettingsState({
    @required bool nightModeEnabled,
    @required bool autoPlayEnabled,
    @required int doubleTapToSeekValue,
    @required bool recordSearchHistoryEnabled,
    @required bool recordWatchHistoryEnabled,
  }) = _SettingsState;

  factory SettingsState.initial() => const SettingsState(
        nightModeEnabled: true,
        autoPlayEnabled: false,
        doubleTapToSeekValue: 10,
        recordSearchHistoryEnabled: true,
        recordWatchHistoryEnabled: true,
      );
}
