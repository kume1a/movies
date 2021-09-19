import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/settings/settings_controller.dart';
import '../../../l10n/translation_keys.dart';
import '../../core/dialogs/confirmation_dialog.dart';

class TileClearCache extends GetView<SettingsController> {
  const TileClearCache({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(trSettingsClearCache.tr),
      subtitle: Text(trSettingsCommentClearCache.tr),
      onTap: () async {
        final bool didConfirm = await showConfirmationDialog(
          context,
          title: trSettingsClearCacheDialogHeader.tr,
          content: trSettingsClearCacheDialogContent.tr,
          confirmationText: trCommonClear.tr,
        );

        if (didConfirm) {
          controller.onClearCachePressed();
        }
      },
    );
  }
}
