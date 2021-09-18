import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class BaseControllerMiddleMan<T extends GetxController> {
  T get _controller => Get.find<T>();

  @protected
  void runIfRegistered(FutureOr<void> Function(T controller) runnable) {
    if (Get.isRegistered<T>()) {
      runnable(_controller);
    }
  }
}
