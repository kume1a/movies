import 'package:get/get.dart';

import '../../controllers/home/authorization_prompt_controller.dart';
import '../../controllers/home/home_controller.dart';
import '../../controllers/main/favorites_controller.dart';
import '../../controllers/main/main_screen_controller.dart';
import '../../controllers/main/statistics_controller.dart';
import '../injection.dart';

class MainPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(getIt<MainScreenController>());
    Get.lazyPut(() => getIt<HomeController>());
    Get.lazyPut(() => getIt<AuthorizationPromptDialogController>(), fenix: true);
    Get.lazyPut(() => getIt<FavoritesController>());
    Get.lazyPut(() => getIt<StatisticsController>());
  }
}
