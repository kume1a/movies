import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../enums/supported_locale.dart';

class SupportedLocaleHelper {
  SupportedLocaleHelper._();

  static Locale getLocale(SupportedLocale supportedLocale) {
    switch (supportedLocale) {
      case SupportedLocale.en:
        return const Locale('en');
      case SupportedLocale.ka:
        return const Locale('ka');
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

  static String convertToString(AppLocalizations? appLocalizations, SupportedLocale supportedLocale) {
    switch (supportedLocale) {
      case SupportedLocale.en:
        return appLocalizations?.languageEng ?? '';
      case SupportedLocale.ka:
        return appLocalizations?.languageGeo ?? '';
    }
  }
}
