import 'package:get/get.dart';

import '../../controllers/favorites/favorites_controller.dart';
import '../../controllers/home/home_controller.dart';
import '../../controllers/statistics/statistics_controller.dart';
import '../injection.dart';

class MainPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(getIt(), getIt()));
    Get.lazyPut(() => FavoritesController(getIt(), getIt(), getIt()));
    Get.lazyPut(() => StatisticsController(getIt(), getIt()));
  }
}
