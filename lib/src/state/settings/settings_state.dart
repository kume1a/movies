part of 'settings_bloc.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState({
    required bool autoPlayEnabled,
    required int doubleTapToSeekValue,
    required int saveMovieInterval,
    required bool recordSearchHistoryEnabled,
    required bool recordWatchHistoryEnabled,
  }) = _SettingsState;

  factory SettingsState.initial() => const SettingsState(
        autoPlayEnabled: false,
        doubleTapToSeekValue: 10,
        saveMovieInterval: 4,
        recordSearchHistoryEnabled: true,
        recordWatchHistoryEnabled: true,
      );
}
