import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../enums/language.dart';

class LanguageHelper {
  LanguageHelper._();

  static String convertToString(AppLocalizations? appLocalizations, Language language) {
    switch (language) {
      case Language.geo:
        return appLocalizations?.languageGeo ?? '';
      case Language.eng:
        return appLocalizations?.languageEng ?? '';
      case Language.rus:
        return appLocalizations?.languageRus ?? '';
      case Language.jpn:
        return appLocalizations?.languageJpn ?? '';
      case Language.fre:
        return appLocalizations?.languageFre ?? '';
      case Language.ger:
        return appLocalizations?.languageGer ?? '';
      case Language.kor:
        return appLocalizations?.languageKor ?? '';
      case Language.spa:
        return appLocalizations?.languageSpa ?? '';
      case Language.por:
        return appLocalizations?.languagePor ?? '';
    }
  }
}