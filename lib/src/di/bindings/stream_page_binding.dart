import 'package:get/get.dart';

import '../../controllers/stream/stream_controller.dart';
import '../injection.dart';

class StreamPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StreamController(getIt(), getIt(), getIt(), getIt(), getIt()));
  }
}
