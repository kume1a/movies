import 'package:flutter/material.dart';

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
}
