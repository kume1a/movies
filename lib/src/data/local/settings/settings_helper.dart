import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../movies/movie_dao.dart';
import '../saved_movies/saved_movie_dao.dart';
import '../search_result/search_result_dao.dart';

@lazySingleton
class SettingsHelper {
  SettingsHelper(
    this._sharedPreferences,
    this._movieDao,
    this._searchResultDao,
    this._savedMovieDao,
  );

  final SharedPreferences _sharedPreferences;
  final MovieDao _movieDao;
  final SearchResultDao _searchResultDao;
  final SavedMovieDao _savedMovieDao;

  static const String _keyAutoPlay = 'key_auto_play';
  static const String _keyDoubleTapToSeek = 'key_double_tap_to_seek';
  static const String _keyRecordSearchHistory = 'key_record_search_history';
  static const String _keyRecordWatchHistory = 'key_record_watch_history';

  Future<void> setAutoPlayEnabled({required bool enabled}) async => _sharedPreferences.setBool(_keyAutoPlay, enabled);

  Future<void> setDoubleTapToSeek(int seconds) async {
    await _sharedPreferences.setInt(_keyDoubleTapToSeek, seconds);
  }

  Future<bool> isAutoPlayEnabled() async => _sharedPreferences.getBool(_keyAutoPlay) ?? false;

  Future<int> getDoubleTapToSeekValue() async => _sharedPreferences.getInt(_keyDoubleTapToSeek) ?? 10;

  // ---- history ----
  Future<void> clearSearchHistory() async => _searchResultDao.deleteSearchResults();

  Future<void> clearSavedMovies() async => _savedMovieDao.deleteMoviePositions();

  Future<void> clearFavorites() async => _movieDao.unfavoriteMovies();

  Future<void> setRecordingSearchHistoryEnabled({required bool enabled}) async =>
      _sharedPreferences.setBool(_keyRecordSearchHistory, enabled);

  Future<void> setRecordingWatchHistoryEnabled({required bool enabled}) async =>
      _sharedPreferences.setBool(_keyRecordWatchHistory, enabled);

  Future<bool> isRecordSearchHistoryEnabled() async => _sharedPreferences.getBool(_keyRecordSearchHistory) ?? true;

  Future<bool> isRecordWatchHistoryEnabled() async => _sharedPreferences.getBool(_keyRecordWatchHistory) ?? true;
}
