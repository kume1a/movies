import 'package:get/get.dart';

import '../../../l10n/translation_keys.dart';
import '../../enums/language.dart';

class LanguageHelper {
  LanguageHelper._();

  static String convertToString(Language language) {
    switch (language) {
      case Language.geo:
        return trLanguageGeo.tr;
      case Language.eng:
        return trLanguageEng.tr;
      case Language.rus:
        return trLanguageRus.tr;
      case Language.jpn:
        return trLanguageJpn.tr;
      case Language.fre:
        return trLanguageFre.tr;
      case Language.ger:
        return trLanguageGer.tr;
      case Language.kor:
        return trLanguageKor.tr;
      case Language.spa:
        return trLanguageSpa.tr;
      case Language.por:
        return trLanguagePor.tr;
    }
  }
}
