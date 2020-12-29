abstract class ISettingsInteractor {
  Future<void> setNightModeEnabled(bool enabled);
  Future<bool> isNightModeEnabled();

  Future<void> setAutoPlayEnabled(bool enabled);
  Future<void> setDoubleTapToSeek(int seconds);
  Future<bool> isAutoPlayEnabled();
  Future<int> getDoubleTapToSeekValue();

  Future<void> clearSearchHistory();
  Future<void> clearSavedMovies();
  Future<void> clearFavorites();
  Future<void> setRecordingSearchHistoryEnabled(bool enabled);
  Future<void> setRecordingWatchHistoryEnabled(bool enabled);
  Future<bool> isRecordSearchHistoryEnabled();
  Future<bool> isRecordWatchHistoryEnabled();
}