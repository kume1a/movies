import 'package:get/get.dart';

import '../../../enums/supported_locale.dart';
import '../../../helpers/supported_locale_helper.dart';

class SupportedLocaleProvider {
  SupportedLocaleProvider._();

  static SupportedLocale get locale =>
      Get.locale != null ? SupportedLocaleHelper.fromLocale(Get.locale!) : SupportedLocale.en;
}
