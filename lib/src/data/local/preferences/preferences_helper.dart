import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/enums/favorites_page_state.dart';
import '../../../core/enums/language.dart';
import '../../../core/enums/quality.dart';
import '../../../core/helpers/enum_to_string.dart';

@lazySingleton
class PreferencesHelper {
  PreferencesHelper(this._sharedPreferences);

  final SharedPreferences _sharedPreferences;

  static const String _keyFavoritesPageState = 'key_favorites_page_state';
  static const String _keyPreferredLanguage = 'key_preferred_language';
  static const String _keyPreferredQuality = 'key_preferred_quality';

  Future<void> writeFavoritesPageState(FavoritesPageState favoritesPageState) async =>
      _sharedPreferences.setString(_keyFavoritesPageState, EnumToString.convertToString(favoritesPageState));

  Future<FavoritesPageState> readFavoritesPageState() async {
    final String? favoritesPageState = _sharedPreferences.getString(_keyFavoritesPageState);
    return favoritesPageState != null
        ? EnumToString.fromString(FavoritesPageState.values, favoritesPageState)!
        : FavoritesPageState.groups;
  }

  Future<void> writePreferredLanguage(Language language) async =>
      _sharedPreferences.setString(_keyPreferredLanguage, EnumToString.convertToString(language));

  Future<Language> readPreferredLanguage() async {
    final String? preferredLanguage = _sharedPreferences.getString(_keyPreferredLanguage);
    return preferredLanguage != null ? EnumToString.fromString(Language.values, preferredLanguage)! : Language.eng;
  }

  Future<void> writePreferredQuality(Quality quality) async =>
      _sharedPreferences.setString(_keyPreferredQuality, EnumToString.convertToString(quality));

  Future<Quality> readPreferredQuality() async {
    final String? preferredQuality = _sharedPreferences.getString(_keyPreferredQuality);
    return preferredQuality != null ? EnumToString.fromString(Quality.values, preferredQuality)! : Quality.high;
  }
}
