import 'package:meta/meta.dart';

abstract class ISettingsManager {
  Future<void> setNightModeEnabled({@required bool enabled});
  Future<bool> isNightModeEnabled();

  Future<void> setAutoPlayEnabled({@required bool enabled});
  Future<void> setDoubleTapToSeek(int seconds);
  Future<bool> isAutoPlayEnabled();
  Future<int> getDoubleTapToSeekValue();

  Future<void> clearSearchHistory();
  Future<void> clearSavedMovies();
  Future<void> clearFavorites();
  Future<void> setRecordingSearchHistoryEnabled({@required bool enabled});
  Future<void> setRecordingWatchHistoryEnabled({@required bool enabled});
  Future<bool> isRecordSearchHistoryEnabled();
  Future<bool> isRecordWatchHistoryEnabled();
}