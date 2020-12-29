import 'package:injectable/injectable.dart';
import 'package:movo/src/domain/movie/movie_data_model.dart';
import 'package:movo/src/domain/settings/i_settings_interactor.dart';
import 'package:movo/src/infrastructure/hive_box_holder.dart';

enum _Setting {
  nightMode,
  autoPlay,
  doubleTapToSeek,
  watchHistoryRecording,
  searchHistoryRecording,
}

@LazySingleton(as: ISettingsInteractor)
class SettingsInteractor implements ISettingsInteractor {
  final HiveBoxHolder _boxHolder;

  SettingsInteractor(this._boxHolder);

  // ---- theme ----
  @override
  Future<void> setNightModeEnabled(bool enabled) async {
    _boxHolder.enabledOptions.put(_Setting.nightMode.index, enabled);
  }

  @override
  Future<bool> isNightModeEnabled() async {
    return _boxHolder.enabledOptions.get(_Setting.nightMode.index, defaultValue: true);
  }

  // ---- video player ----
  @override
  Future<void> setAutoPlayEnabled(bool enabled) async {
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
    _boxHolder.movieData.values.forEach((MovieData element) {
      _boxHolder.movieData.put(element.movieId, element..favorite = false);
    });
  }

  @override
  Future<void> setRecordingSearchHistoryEnabled(bool enabled) async {
    await _boxHolder.enabledOptions.put(_Setting.searchHistoryRecording.index, enabled);
  }

  @override
  Future<void> setRecordingWatchHistoryEnabled(bool enabled) async {
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
