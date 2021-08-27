import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../routes/screens_navigator.dart';

Future<int?> showSaveMovieIntervalChooserDialog(
  BuildContext context, {
  required int currentValue,
}) async {
  return showDialog(
    context: context,
    builder: (_) {
      return _SaveMovieIntervalChooserDialog(currentValue: currentValue);
    },
  );
}

class _SaveMovieIntervalChooserDialog extends StatelessWidget {
  const _SaveMovieIntervalChooserDialog({
    Key? key,
    required this.currentValue,
  }) : super(key: key);

  final int currentValue;

  static const List<int> _values = <int>[2, 3, 4, 5, 6, 7, 8, 9, 10];

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? appLocalizations = AppLocalizations.of(context);

    return AlertDialog(
      contentPadding: const EdgeInsets.only(top: 12),
      title: Text(appLocalizations?.settingsSaveMovieIntervalDialogHeader ?? ''),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: _values.map((int e) {
            return RadioListTile<int>(
              title: Text(appLocalizations?.settingsSaveMovieIntervalDialogItem(e) ?? ''),
              value: e,
              onChanged: (int? value) => ScreensNavigator.pop(value),
              groupValue: currentValue,
              selected: currentValue == e,
            );
          }).toList(),
        ),
      ),
    );
  }
}
