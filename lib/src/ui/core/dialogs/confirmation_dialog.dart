import 'package:flutter/material.dart';

import '../routes/screens_navigator.dart';

Future<bool> showConfirmationDialog(
  BuildContext context, {
  required String title,
  required String content,
  String? confirmationText,
}) async {
  final bool? didConfirm = await showDialog<bool>(
    context: context,
    builder: (_) {
      return _ConfirmationDialog(
        title: title,
        content: content,
        confirmationText: confirmationText,
      );
    },
  );

  return didConfirm ?? false;
}

class _ConfirmationDialog extends StatelessWidget {
  const _ConfirmationDialog({
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
          onPressed: () => ScreensNavigator.pop(false),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => ScreensNavigator.pop(true),
          child: Text(confirmationText ?? 'OK'),
        ),
      ],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    );
  }
}
