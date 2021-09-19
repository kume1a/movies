import 'package:get/get.dart';

import '../../core/enums/supported_locale.dart';
import '../../core/helpers/supported_locale_helper.dart';
import '../../data/local/preferences/settings_helper.dart';

class MainScreenController extends GetxController {
  MainScreenController(
    this._settingsHelper,
  );

  final SettingsHelper _settingsHelper;

  @override
  Future<void> onInit() async {
    super.onInit();

    final SupportedLocale supportedLocale = await _settingsHelper.readLocale();
    Get.updateLocale(SupportedLocaleHelper.getLocale(supportedLocale));
  }
}
