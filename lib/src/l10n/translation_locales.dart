import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

abstract class TranslationLocales {
  static const Locale localeEn = Locale('en', 'US');
  static const Locale localeKa = Locale('ka', 'GE');

  static const Locale fallbackLocale = localeEn;

  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];
}
