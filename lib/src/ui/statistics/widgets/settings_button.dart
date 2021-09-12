import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../controllers/statistics/statistics_controller.dart';

class SettingsButton extends GetView<StatisticsController> {
  const SettingsButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: UniqueKey(),
      onVisibilityChanged: (VisibilityInfo info) {
        if (info.visibleFraction == 1) {
          // button gets visible means that statistics page is visible and refresh is needed
          controller.onRefreshData();
        }
      },
      child: IconButton(
        onPressed: controller.onSettingsPressed,
        icon: const Icon(Icons.settings_outlined),
        splashRadius: 24,
        iconSize: 30,
      ),
    );
  }
}
