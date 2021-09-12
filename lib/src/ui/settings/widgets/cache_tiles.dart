import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

import '../../../controllers/settings/settings_controller.dart';
import '../../core/dialogs/confirmation_dialog.dart';

class TileClearCache extends GetView<SettingsController> {
  const TileClearCache({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? appLocalizations = AppLocalizations.of(context);

    return ListTile(
      title: Text(appLocalizations?.settingsClearCache ?? ''),
      subtitle: Text(appLocalizations?.settingsCommentClearCache ?? ''),
      onTap: () async {
        final bool didConfirm = await showConfirmationDialog(
          context,
          title: appLocalizations?.settingsClearCacheDialogHeader ?? '',
          content: appLocalizations?.settingsClearCacheDialogContent ?? '',
          confirmationText: appLocalizations?.clear ?? '',
        );

        if (didConfirm) {
          controller.onClearCachePressed();
        }
      },
    );
  }
}
