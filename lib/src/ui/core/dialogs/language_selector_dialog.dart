import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/enums/supported_locale.dart';
import '../../../core/helpers/enum_helpers/supported_locale_helper.dart';
import '../../../l10n/translation_keys.dart';
import '../routes/screens_navigator.dart';

class LanguageSelectorDialog extends StatelessWidget {
  const LanguageSelectorDialog({
    Key? key,
    required this.selectedLocale,
  }) : super(key: key);

  final SupportedLocale selectedLocale;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.symmetric(vertical: 16),
      title: Text(trSettingsChangeLanguageDialogHeader.tr),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: SupportedLocale.values.map((SupportedLocale e) {
            return RadioListTile<SupportedLocale>(
              title: Text(SupportedLocaleHelper.convertToString(e)),
              value: e,
              onChanged: (SupportedLocale? value) => ScreensNavigator.pop(result: value),
              groupValue: selectedLocale,
              selected: selectedLocale == e,
            );
          }).toList(),
        ),
      ),
    );
  }
}
