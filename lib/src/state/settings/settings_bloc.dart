import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../data/local/settings/settings_helper.dart';

part 'settings_bloc.freezed.dart';
part 'settings_event.dart';
part 'settings_state.dart';

@injectable
class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc(this._settingsHelper) : super(SettingsState.initial());

  final SettingsHelper _settingsHelper;

  @override
  Stream<SettingsState> mapEventToState(
    SettingsEvent event,
  ) async* {
    yield* event.map(
      init: _init,
      autoPlaySwitched: _autoPlaySwitched,
      doubleTapToSeekValueChanged: _doubleTapToSeekValueChanged,
      clearSearchHistoryRequested: _clearSearchHistoryRequested,
      clearWatchHistoryRequested: _clearWatchHistoryRequested,
      searchHistoryEnabledSwitched: _searchHistoryEnabledSwitched,
      watchHistoryEnabledSwitched: _watchHistoryEnabledSwitched,
      clearFavoritesRequested: _clearFavoritesRequested,
      clearCacheRequested: _clearCacheRequested,
    );
  }

  Stream<SettingsState> _init(_Init event) async* {
    final bool isAutoPlatEnabled = await _settingsHelper.isAutoPlayEnabled();
    final int seekValue = await _settingsHelper.getDoubleTapToSeekValue();
    final bool isRecordSearchHistoryEnabled = await _settingsHelper.isRecordSearchHistoryEnabled();
    final bool isRecordWatchHistoryEnabled = await _settingsHelper.isRecordWatchHistoryEnabled();

    yield state.copyWith(
      autoPlayEnabled: isAutoPlatEnabled,
      doubleTapToSeekValue: seekValue,
      recordSearchHistoryEnabled: isRecordSearchHistoryEnabled,
      recordWatchHistoryEnabled: isRecordWatchHistoryEnabled,
    );
  }

  Stream<SettingsState> _autoPlaySwitched(_AutoPlaySwitched event) async* {
    yield state.copyWith(autoPlayEnabled: event.enabled);
    await _settingsHelper.setAutoPlayEnabled(enabled: event.enabled);
  }

  Stream<SettingsState> _doubleTapToSeekValueChanged(_DoubleTapToSeekValueChanged event) async* {
    if (event.value != state.doubleTapToSeekValue) {
      yield state.copyWith(doubleTapToSeekValue: event.value);
      await _settingsHelper.setDoubleTapToSeek(event.value);
    }
  }

  Stream<SettingsState> _clearSearchHistoryRequested(_ClearSearchHistoryRequested event) async* {
    await _settingsHelper.clearSearchHistory();
  }

  Stream<SettingsState> _clearWatchHistoryRequested(_ClearWatchHistoryRequested event) async* {
    await _settingsHelper.clearSavedMovies();
  }

  Stream<SettingsState> _searchHistoryEnabledSwitched(_SearchHistoryEnabledSwitched event) async* {
    yield state.copyWith(recordSearchHistoryEnabled: event.enabled);
    await _settingsHelper.setRecordingSearchHistoryEnabled(enabled: event.enabled);
  }

  Stream<SettingsState> _watchHistoryEnabledSwitched(_WatchHistoryEnabledSwitched event) async* {
    yield state.copyWith(recordWatchHistoryEnabled: event.enabled);
    await _settingsHelper.setRecordingWatchHistoryEnabled(enabled: event.enabled);
  }

  Stream<SettingsState> _clearFavoritesRequested(_ClearFavoritesRequested event) async* {
    await _settingsHelper.clearFavorites();
  }

  Stream<SettingsState> _clearCacheRequested(_ClearCacheRequested event) async* {
    await _settingsHelper.clearCache();
  }
}
