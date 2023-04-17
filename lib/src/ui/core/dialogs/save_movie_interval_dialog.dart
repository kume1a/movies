import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../l10n/parameterized_translations.dart';
import '../../../l10n/translation_keys.dart';
import '../routes/screens_navigator.dart';

class SaveMovieIntervalChooserDialog extends StatelessWidget {
  const SaveMovieIntervalChooserDialog({
    super.key,
    required this.currentValue,
  });

  final int currentValue;

  static const List<int> _values = <int>[2, 3, 4, 5, 6, 7, 8, 9, 10];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.only(top: 12),
      title: Text(trSettingsSaveMovieIntervalDialogHeader.tr),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: _values.map((int e) {
            return RadioListTile<int>(
              title: Text(ParamTranslations.settingsSaveMovieIntervalDialogItem(e)),
              value: e,
              onChanged: (int? value) => ScreensNavigator.pop(result: value),
              groupValue: currentValue,
              selected: currentValue == e,
            );
          }).toList(),
        ),
      ),
    );
  }
}
