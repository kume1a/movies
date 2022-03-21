import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/settings/settings_controller.dart';
import '../../../l10n/parameterized_translations.dart';
import '../../../l10n/translation_keys.dart';

class TileAutoPlay extends GetView<SettingsController> {
  const TileAutoPlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SwitchListTile(
        value: controller.autoPlayEnabled.value,
        title: Text(trSettingsAutoplay.tr),
        subtitle: Text(trSettingsCommentAutoplay.tr),
        onChanged: (bool value) => controller.onAutoPlaySwitched(isEnabled: value),
      ),
    );
  }
}

class TileDoubleTapToSeek extends GetView<SettingsController> {
  const TileDoubleTapToSeek({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListTile(
        title: Text(trSettingsDoubleTapToSeek.tr),
        subtitle: Text(ParamTranslations.settingsCommentDoubleTapToSeek(controller.doubleTapToSeekValue.value)),
        onTap: controller.onDoubleTapToSeekPressed,
      ),
    );
  }
}

class TileSaveMovieInterval extends GetView<SettingsController> {
  const TileSaveMovieInterval({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListTile(
        title: Text(trSettingsSaveMovieInterval.tr),
        subtitle: Text(ParamTranslations.settingsCommentSaveMovieInterval(controller.saveMovieInterval.value)),
        onTap: controller.onSaveMovieIntervalPressed,
      ),
    );
  }
}
