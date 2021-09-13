import 'package:get/get.dart';

import '../../controllers/movie_group/movie_group_controller.dart';
import '../injection.dart';

class MovieGroupPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MovieGroupController(getIt(), getIt()));
  }
}
