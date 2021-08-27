import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/enums/supported_locale.dart';
import '../../../core/helpers/enum_to_string.dart';
import '../cache_dumper.dart';
import '../favorite_movie/favorite_movie_dao.dart';
import '../movie_group/movie_group_dao.dart';
import '../saved_movies/saved_movie_dao.dart';
import '../search_result/search_result_dao.dart';

@lazySingleton
class SettingsHelper {
  SettingsHelper(
    this._sharedPreferences,
    this._searchResultDao,
    this._savedMovieDao,
    this._favoriteMovieDao,
    this._movieGroupDao,
    this._cacheDumper,
  );

  final SharedPreferences _sharedPreferences;
  final SearchResultDao _searchResultDao;
  final SavedMovieDao _savedMovieDao;
  final FavoriteMovieDao _favoriteMovieDao;
  final MovieGroupDao _movieGroupDao;
  final CacheDumper _cacheDumper;

  static const String _keyAutoPlay = 'key_auto_play';
  static const String _keyDoubleTapToSeek = 'key_double_tap_to_seek';
  static const String _keySaveMovieInterval = 'key_save_movie_interval';
  static const String _keyRecordSearchHistory = 'key_record_search_history';
  static const String _keyRecordWatchHistory = 'key_record_watch_history';
  static const String _keyLocale = 'key_locale';

  Future<void> setAutoPlayEnabled({required bool enabled}) async => _sharedPreferences.setBool(_keyAutoPlay, enabled);

  Future<void> setDoubleTapToSeek(int seconds) async => _sharedPreferences.setInt(_keyDoubleTapToSeek, seconds);

  Future<void> setSaveMovieInteval(int seconds) async => _sharedPreferences.setInt(_keySaveMovieInterval, seconds);

  Future<bool> isAutoPlayEnabled() async => _sharedPreferences.getBool(_keyAutoPlay) ?? false;

  Future<int> getDoubleTapToSeekValue() async => _sharedPreferences.getInt(_keyDoubleTapToSeek) ?? 10;

  Future<int> getSaveMovieInterval() async => _sharedPreferences.getInt(_keySaveMovieInterval) ?? 4;

  // ---- history ----
  Future<void> clearSearchHistory() async => _searchResultDao.deleteSearchResults();

  Future<void> clearSavedMovies() async => _savedMovieDao.deleteMoviePositions();

  Future<void> clearFavorites() async => _favoriteMovieDao.unfavoriteMovies();

  Future<void> clearGroups() async => _movieGroupDao.deleteMovieGroups();

  Future<void> setRecordingSearchHistoryEnabled({required bool enabled}) async =>
      _sharedPreferences.setBool(_keyRecordSearchHistory, enabled);

  Future<void> setRecordingWatchHistoryEnabled({required bool enabled}) async =>
      _sharedPreferences.setBool(_keyRecordWatchHistory, enabled);

  Future<bool> isRecordSearchHistoryEnabled() async => _sharedPreferences.getBool(_keyRecordSearchHistory) ?? true;

  Future<bool> isRecordWatchHistoryEnabled() async => _sharedPreferences.getBool(_keyRecordWatchHistory) ?? true;

  Future<void> clearCache() async => _cacheDumper.dumpCache();

  Future<void> saveLocale(SupportedLocale locale) async =>
      _sharedPreferences.setString(_keyLocale, EnumToString.convertToString(locale));

  Future<SupportedLocale> readLocale() async {
    final String? locale = _sharedPreferences.getString(_keyLocale);
    return locale != null ? EnumToString.fromString(SupportedLocale.values, locale)! : SupportedLocale.en;
  }
}
