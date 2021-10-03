import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../l10n/translation_keys.dart';
import '../../enums/supported_locale.dart';

class SupportedLocaleHelper {
  SupportedLocaleHelper._();

  static Locale getLocale(SupportedLocale supportedLocale) {
    switch (supportedLocale) {
      case SupportedLocale.en:
        return const Locale('en', 'US');
      case SupportedLocale.ka:
        return const Locale('ka', 'GE');
    }
  }

  static SupportedLocale fromLocale(Locale locale) {
    switch (locale.languageCode) {
      case 'en':
        return SupportedLocale.en;
      case 'ka':
        return SupportedLocale.ka;
      default:
        throw Exception('unsupported locale $locale');
    }
  }

  static String convertToString(SupportedLocale supportedLocale) {
    switch (supportedLocale) {
      case SupportedLocale.en:
        return trLanguageEng.tr;
      case SupportedLocale.ka:
        return trLanguageGeo.tr;
    }
  }
}
