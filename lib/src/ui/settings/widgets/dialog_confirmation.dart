import 'package:flutter/material.dart';

void showConfirmationDialog(
  BuildContext context,
  String title,
  String content,
  String confirmationText,
  void Function() onConfirm,
) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          // ignore: deprecated_member_use
          FlatButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('CANCEL'),
          ),
          // ignore: deprecated_member_use
          FlatButton(
            onPressed: () {
              onConfirm.call();
              Navigator.pop(context);
            },
            child: Text(confirmationText),
          ),
        ],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      );
    },
  );
}
