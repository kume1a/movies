import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/settings/settings_controller.dart';
import '../../../l10n/translation_keys.dart';

class TileLanguage extends GetView<SettingsController> {
  const TileLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(trSettingsChangeLanguage.tr),
      onTap: controller.onLanguagePressed,
    );
  }
}
