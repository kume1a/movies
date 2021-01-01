import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:movo/src/domain/settings/i_settings_interactor.dart';

part 'settings_bloc.freezed.dart';

part 'settings_event.dart';

part 'settings_state.dart';

@injectable
class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final ISettingsInteractor _settingsInteractor;

  SettingsBloc(this._settingsInteractor) : super(SettingsState.initial()) {
    _init();
  }

  Future<void> _init() async {
    final bool isNightModeEnabled = await _settingsInteractor.isNightModeEnabled();
    final bool isAutoPlatEnabled = await _settingsInteractor.isAutoPlayEnabled();
    final int seekValue = await _settingsInteractor.getDoubleTapToSeekValue();
    final bool isRecordSearchHistoryEnabled =
        await _settingsInteractor.isRecordSearchHistoryEnabled();
    final bool isRecordWatchHistoryEnabled =
        await _settingsInteractor.isRecordWatchHistoryEnabled();

    add(SettingsEvent.initial(
      isNightModeEnabled: isNightModeEnabled,
      isAutoPlatEnabled: isAutoPlatEnabled,
      seekValue: seekValue,
      isRecordSearchHistoryEnabled: isRecordSearchHistoryEnabled,
      isRecordWatchHistoryEnabled: isRecordWatchHistoryEnabled,
    ));
  }

  @override
  Stream<SettingsState> mapEventToState(
    SettingsEvent event,
  ) async* {
    yield* event.map(
      initial: (_Initial e) async* {
        yield state.copyWith(
          nightModeEnabled: e.isNightModeEnabled,
          autoPlayEnabled: e.isAutoPlatEnabled,
          doubleTapToSeekValue: e.seekValue,
          recordSearchHistoryEnabled: e.isRecordSearchHistoryEnabled,
          recordWatchHistoryEnabled: e.isRecordWatchHistoryEnabled,
        );
      },
      nightModeSwitched: (_NightModeSwitched e) async* {
        yield state.copyWith(nightModeEnabled: e.enabled);
        await _settingsInteractor.setNightModeEnabled(enabled: e.enabled);
      },
      autoPlaySwitched: (_AutoPlaySwitched e) async* {
        yield state.copyWith(autoPlayEnabled: e.enabled);
        await _settingsInteractor.setAutoPlayEnabled(enabled: e.enabled);
      },
      doubleTapToSeekValueChanged: (_DoubleTapToSeekValueChanged e) async* {
        yield state.copyWith(doubleTapToSeekValue: e.value);
        await _settingsInteractor.setDoubleTapToSeek(e.value);
      },
      clearSearchHistoryRequested: (_ClearSearchHistoryRequested e) async* {
        await _settingsInteractor.clearSearchHistory();
      },
      clearWatchHistoryRequested: (_ClearWatchHistoryRequested e) async* {
        await _settingsInteractor.clearSavedMovies();
      },
      searchHistoryEnabledSwitched: (_SearchHistoryEnabledSwitched e) async* {
        yield state.copyWith(recordSearchHistoryEnabled: e.enabled);
        await _settingsInteractor.setRecordingSearchHistoryEnabled(enabled: e.enabled);
      },
      watchHistoryEnabledSwitched: (_WatchHistoryEnabledSwitched e) async* {
        yield state.copyWith(recordWatchHistoryEnabled: e.enabled);
        await _settingsInteractor.setRecordingWatchHistoryEnabled(enabled: e.enabled);
      },
      clearFavoritesRequested: (_ClearFavoritesRequested e) async* {
        await _settingsInteractor.clearFavorites();
      },
    );
  }
}
