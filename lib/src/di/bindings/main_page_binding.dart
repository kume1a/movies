import 'package:get/get.dart';

import '../../controllers/home/home_controller.dart';
import '../injection.dart';

class MainPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(getIt(), getIt()));
  }
}
