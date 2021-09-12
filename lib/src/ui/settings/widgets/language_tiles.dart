import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

import '../../../controllers/settings/settings_controller.dart';
import '../../../core/enums/supported_locale.dart';
import '../../core/dialogs/language_selector_dilaog.dart';

class TileLanguage extends GetView<SettingsController> {
  const TileLanguage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? appLocalizations = AppLocalizations.of(context);

    return ListTile(
      title: Text(appLocalizations?.settingsChangeLanguage ?? ''),
      onTap: () async {
        final SupportedLocale? selectedLocale = await showLanguageSelectorDialog(
          context,
          selectedLocale: controller.supportedLocale.value,
        );

        if (selectedLocale != null) {
          controller.onLocaleChanged(selectedLocale);
        }
      },
    );
  }
}
