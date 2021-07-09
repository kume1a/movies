import 'package:flutter/material.dart';
import '../enums/supported_locale.dart';
import '../helpers/supported_locale_helper.dart';

extension BuildContextX on BuildContext {
  SupportedLocale get locale => SupportedLocaleHelper.fromLocale(Localizations.localeOf(this));
}
