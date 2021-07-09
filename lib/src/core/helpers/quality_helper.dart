import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../enums/quality.dart';

class QualityHelper {
  QualityHelper._();

  static String convertToString(AppLocalizations? appLocalizations, Quality quality) {
    switch (quality) {
      case Quality.medium:
        return appLocalizations?.qualityMedium ?? '';
      case Quality.high:
        return appLocalizations?.qualityHigh ?? '';
    }
  }
}
