import 'package:flutter/painting.dart';
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
  static const String _keyPreferredSubtitleTextSize = 'key_preferred_subtitle_text_size';
  static const String _keyPreferredSubtitleSpacingFromBottom = 'key_preferred_subtitle_spacing_from_bottom';
  static const String _keyPreferredSubtitleTextColor = 'key_preferred_subtitle_text_color';
  static const String _keyPreferredSubtitleBorderThickness = 'key_preferred_subtitle_border_thickness';
  static const String _keyPreferredSubtitleBorderColor = 'key_preferred_subtitle_border_color';

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

  Future<void> writePreferredSubtitleTextSize(double preferredTextSize) async =>
      _sharedPreferences.setDouble(_keyPreferredSubtitleTextSize, preferredTextSize);

  Future<double?> readPreferredSubtitleTextSize() async => _sharedPreferences.getDouble(_keyPreferredSubtitleTextSize);

  Future<void> writePreferredSubtitleSpacingFromBottom(double preferredSpacingFromBottom) async =>
      _sharedPreferences.setDouble(_keyPreferredSubtitleSpacingFromBottom, preferredSpacingFromBottom);

  Future<double?> readPreferredSubtitleSpacingFromBottom() async =>
      _sharedPreferences.getDouble(_keyPreferredSubtitleSpacingFromBottom);

  Future<void> writePreferredSubtitleTextColor(Color preferredTextColor) async =>
      _sharedPreferences.setInt(_keyPreferredSubtitleTextColor, preferredTextColor.value);

  Future<Color?> readPreferredSubtitleTextColor() async {
    final int? colorValue = _sharedPreferences.getInt(_keyPreferredSubtitleTextColor);
    return colorValue != null ? Color(colorValue) : null;
  }

  Future<void> writePreferredSubtitleBorderThickness(double preferredBorderThickness) async =>
      _sharedPreferences.setDouble(_keyPreferredSubtitleBorderThickness, preferredBorderThickness);

  Future<double?> readPreferredSubtitleBorderThickness() async =>
      _sharedPreferences.getDouble(_keyPreferredSubtitleBorderThickness);

  Future<void> writePreferredSubtitleBorderColor(Color preferredBorderColor) async =>
      _sharedPreferences.setInt(_keyPreferredSubtitleBorderColor, preferredBorderColor.value);

  Future<Color?> readPreferredSubtitleBorderColor() async {
    final int? colorValue = _sharedPreferences.getInt(_keyPreferredSubtitleBorderColor);
    return colorValue != null ? Color(colorValue) : null;
  }
}
