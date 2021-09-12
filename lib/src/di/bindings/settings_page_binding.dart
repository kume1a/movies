import 'package:get/get.dart';

import '../../controllers/settings/settings_controller.dart';
import '../injection.dart';

class SettingsPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingsController(getIt()));
  }
}
