import 'package:get/get.dart';

import '../../controllers/details/details_controller.dart';
import '../../controllers/details/movie_group_selector_controller.dart';
import '../injection.dart';

class DetailsPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailsController(getIt(), getIt(), getIt(), getIt()));

    Get.create(() => MovieGroupSelectorController(getIt(), getIt()));
  }
}
