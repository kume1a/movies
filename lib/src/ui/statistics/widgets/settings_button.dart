import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/main/statistics_controller.dart';

class SettingsButton extends GetView<StatisticsController> {
  const SettingsButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: controller.onSettingsPressed,
      icon: const Icon(Icons.settings_outlined),
      splashRadius: 24,
      iconSize: 30,
    );
  }
}
