import 'package:get/get.dart';

import '../../controllers/main/favorites_controller.dart';
import '../../controllers/main/home_controller.dart';
import '../../controllers/main/main_screen_controller.dart';
import '../../controllers/main/statistics_controller.dart';
import '../injection.dart';

class MainPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainScreenController(getIt()));
    Get.lazyPut(() => HomeController(getIt(), getIt()));
    Get.lazyPut(() => FavoritesController(getIt(), getIt(), getIt()));
    Get.lazyPut(() => StatisticsController(getIt(), getIt()));
  }
}
