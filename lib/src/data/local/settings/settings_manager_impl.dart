import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import '../../model/schemas/movie/movie_data_model.dart';

import '../hive_box_holder.dart';
import 'settings_manager.dart';

enum _Setting {
  nightMode,
  autoPlay,
  doubleTapToSeek,
  watchHistoryRecording,
  searchHistoryRecording,
}

@LazySingleton(as: SettingsManager)
class SettingsManagerImpl implements SettingsManager {
  SettingsManagerImpl(this._boxHolder);

  final HiveBoxHolder _boxHolder;

  // ---- theme ----
  @override
  Future<void> setNightModeEnabled({@required bool enabled}) async {
    _boxHolder.enabledOptions.put(_Setting.nightMode.index, enabled);
  }

  @override
  Future<bool> isNightModeEnabled() async {
    return _boxHolder.enabledOptions.get(_Setting.nightMode.index, defaultValue: true);
  }

  // ---- video player ----
  @override
  Future<void> setAutoPlayEnabled({@required bool enabled}) async {
    await _boxHolder.enabledOptions.put(_Setting.autoPlay.index, enabled);
  }

  @override
  Future<void> setDoubleTapToSeek(int seconds) async {
    await _boxHolder.valueOptions.put(_Setting.doubleTapToSeek.index, seconds);
  }

  @override
  Future<bool> isAutoPlayEnabled() async {
    return _boxHolder.enabledOptions.get(_Setting.autoPlay.index, defaultValue: false);
  }

  @override
  Future<int> getDoubleTapToSeekValue() async {
    return _boxHolder.valueOptions.get(_Setting.doubleTapToSeek.index, defaultValue: 10);
  }

  // ---- history ----
  @override
  Future<void> clearSearchHistory() async {
    await _boxHolder.searchHistory.clear();
  }

  @override
  Future<void> clearSavedMovies() async {
    await _boxHolder.continueWatching.clear();
  }

  @override
  Future<void> clearFavorites() async {
    for (final MovieData element in _boxHolder.movieData.values) {
      _boxHolder.movieData.put(element.movieId, element..favorite = false);
    }
  }

  @override
  Future<void> setRecordingSearchHistoryEnabled({@required bool enabled}) async {
    await _boxHolder.enabledOptions.put(_Setting.searchHistoryRecording.index, enabled);
  }

  @override
  Future<void> setRecordingWatchHistoryEnabled({@required bool enabled}) async {
    await _boxHolder.enabledOptions.put(_Setting.watchHistoryRecording.index, enabled);
  }

  @override
  Future<bool> isRecordSearchHistoryEnabled() async {
    return _boxHolder.enabledOptions.get(_Setting.searchHistoryRecording.index, defaultValue: true);
  }

  @override
  Future<bool> isRecordWatchHistoryEnabled() async {
    return _boxHolder.enabledOptions.get(_Setting.watchHistoryRecording.index, defaultValue: true);
  }
}
