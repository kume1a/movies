import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/settings/settings_controller.dart';
import '../../../l10n/parameterized_translations.dart';
import '../../../l10n/translation_keys.dart';
import '../../core/dialogs/dtap_to_seek_value_chooser_dialog.dart';
import '../../core/dialogs/save_movie_interval_dialog.dart';

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
        subtitle: Text(ParameterizedTranslations.settingsCommentDoubleTapToSeek(controller.doubleTapToSeekValue.value)),
        onTap: () async {
          final int? newValue = await showDoubleTapToSeekValueChooserDialog(
            context,
            currentValue: controller.doubleTapToSeekValue.value,
          );

          if (newValue != null) {
            controller.onDoubleTapToSeekValueChanged(newValue);
          }
        },
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
        subtitle: Text(ParameterizedTranslations.settingsCommentSaveMovieInterval(controller.saveMovieInterval.value)),
        onTap: () async {
          final int? newValue = await showSaveMovieIntervalChooserDialog(
            context,
            currentValue: controller.saveMovieInterval.value,
          );

          if (newValue != null) {
            controller.onSaveMovieIntervalChanged(newValue);
          }
        },
      ),
    );
  }
}
