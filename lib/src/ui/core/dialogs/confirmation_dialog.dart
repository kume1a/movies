import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../l10n/translation_keys.dart';
import '../routes/screens_navigator.dart';

class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog({
    Key? key,
    required this.title,
    required this.content,
    this.confirmationText,
  }) : super(key: key);

  final String title;
  final String content;
  final String? confirmationText;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        TextButton(
          onPressed: () => ScreensNavigator.pop(result: false),
          child: Text(trCommonCancel.tr),
        ),
        TextButton(
          onPressed: () => ScreensNavigator.pop(result: true),
          child: Text(confirmationText ?? trCommonOk.tr),
        ),
      ],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    );
  }
}
