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
  SettingsBloc(this._settingsHelper) : super(SettingsState.initial()) {
    _init();
  }

  final SettingsHelper _settingsHelper;

  Future<void> _init() async {
    final bool isAutoPlatEnabled = await _settingsHelper.isAutoPlayEnabled();
    final int seekValue = await _settingsHelper.getDoubleTapToSeekValue();
    final bool isRecordSearchHistoryEnabled =
        await _settingsHelper.isRecordSearchHistoryEnabled();
    final bool isRecordWatchHistoryEnabled =
        await _settingsHelper.isRecordWatchHistoryEnabled();

    add(SettingsEvent.initial(
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
          autoPlayEnabled: e.isAutoPlatEnabled,
          doubleTapToSeekValue: e.seekValue,
          recordSearchHistoryEnabled: e.isRecordSearchHistoryEnabled,
          recordWatchHistoryEnabled: e.isRecordWatchHistoryEnabled,
        );
      },
      autoPlaySwitched: (_AutoPlaySwitched e) async* {
        yield state.copyWith(autoPlayEnabled: e.enabled);
        await _settingsHelper.setAutoPlayEnabled(enabled: e.enabled);
      },
      doubleTapToSeekValueChanged: (_DoubleTapToSeekValueChanged e) async* {
        yield state.copyWith(doubleTapToSeekValue: e.value);
        await _settingsHelper.setDoubleTapToSeek(e.value);
      },
      clearSearchHistoryRequested: (_ClearSearchHistoryRequested e) async* {
        await _settingsHelper.clearSearchHistory();
      },
      clearWatchHistoryRequested: (_ClearWatchHistoryRequested e) async* {
        await _settingsHelper.clearSavedMovies();
      },
      searchHistoryEnabledSwitched: (_SearchHistoryEnabledSwitched e) async* {
        yield state.copyWith(recordSearchHistoryEnabled: e.enabled);
        await _settingsHelper.setRecordingSearchHistoryEnabled(enabled: e.enabled);
      },
      watchHistoryEnabledSwitched: (_WatchHistoryEnabledSwitched e) async* {
        yield state.copyWith(recordWatchHistoryEnabled: e.enabled);
        await _settingsHelper.setRecordingWatchHistoryEnabled(enabled: e.enabled);
      },
      clearFavoritesRequested: (_ClearFavoritesRequested e) async* {
        await _settingsHelper.clearFavorites();
      },
      clearCacheRequested: (_ClearCacheRequested e) async* {
        await _settingsHelper.clearCache();
      },
    );
  }
}
