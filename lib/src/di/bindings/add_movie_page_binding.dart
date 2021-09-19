import 'package:get/get.dart';

import '../../controllers/add_movie/add_movie_controller.dart';
import '../injection.dart';

class AddMoviePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddMovieController(getIt(), getIt(), getIt(), getIt()));
  }
}
