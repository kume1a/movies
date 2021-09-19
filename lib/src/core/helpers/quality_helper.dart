import 'package:get/get.dart';

import '../../l10n/translation_keys.dart';
import '../enums/quality.dart';

class QualityHelper {
  QualityHelper._();

  static String convertToString(Quality quality) {
    switch (quality) {
      case Quality.medium:
        return trQualityMedium.tr;
      case Quality.high:
        return trQualityHigh.tr;
    }
  }
}
