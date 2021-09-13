import 'package:get/get.dart';

import '../../controllers/search/search_controller.dart';
import '../injection.dart';

class SearchPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchController(getIt(), getIt(), getIt()));
  }
}
