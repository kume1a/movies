import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/enums/supported_locale.dart';
import '../../../core/helpers/supported_locale_helper.dart';
import '../routes/screens_navigator.dart';

Future<SupportedLocale?> showLanguageSelectorDialog(
  BuildContext context, {
  required SupportedLocale selectedLocale,
}) async {
  return showDialog(
    context: context,
    builder: (_) => _LanguageSelectorDialog(selectedLocale: selectedLocale),
  );
}

class _LanguageSelectorDialog extends StatelessWidget {
  const _LanguageSelectorDialog({
    Key? key,
    required this.selectedLocale,
  }) : super(key: key);

  final SupportedLocale selectedLocale;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? appLocalizations = AppLocalizations.of(context);

    return AlertDialog(
      contentPadding: const EdgeInsets.symmetric(vertical: 16),
      title: Text(appLocalizations?.settingsChangeLanguageDialogHeader ?? ''),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: SupportedLocale.values.map((SupportedLocale e) {
            return RadioListTile<SupportedLocale>(
              title: Text(SupportedLocaleHelper.convertToString(appLocalizations, e)),
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
