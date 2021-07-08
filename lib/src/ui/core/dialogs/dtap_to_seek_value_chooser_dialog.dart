import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../routes/screens_navigator.dart';

Future<int?> showDoubleTapToSeekValueChooserDialog(
  BuildContext context, {
  required int currentValue,
}) async {
  return showDialog(
    context: context,
    builder: (_) {
      return _DtapToSeekValueChooserDialog(currentValue: currentValue);
    },
  );
}

class _DtapToSeekValueChooserDialog extends StatelessWidget {
  const _DtapToSeekValueChooserDialog({
    Key? key,
    required this.currentValue,
  }) : super(key: key);

  final int currentValue;

  static const List<int> _values = <int>[5, 10, 15, 30, 60, 120];

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? appLocalizations = AppLocalizations.of(context);

    return AlertDialog(
      contentPadding: const EdgeInsets.only(top: 12),
      title: Text(appLocalizations?.settingsDoubleTapToSeekDialogHeader ?? ''),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: _values.map((int e) {
            return RadioListTile<int>(
              title: Text(appLocalizations?.settingsDoubleTapToSeekDialogItem(e) ?? ''),
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
