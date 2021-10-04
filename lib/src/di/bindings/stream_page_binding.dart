import 'package:get/get.dart';

import '../../controllers/stream/player_controls_controller.dart';
import '../../controllers/stream/stream_controller.dart';
import '../../controllers/stream/subtitle_controller.dart';
import '../injection.dart';

class StreamPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StreamController(getIt(), getIt(), getIt(), getIt(), getIt(), getIt()));
    Get.lazyPut(() => PlayerControlsController(getIt(), getIt(), getIt()));

    Get.put(SubtitlesController(getIt(), getIt(), getIt(), getIt()));
  }
}
