import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';

import '../../../l10n/translation_keys.dart';
import '../routes/screens_navigator.dart';

class ClearFavoritesResult {
  ClearFavoritesResult({
    required this.didConfirm,
    this.clearMovieGroups = false,
  });

  final bool didConfirm;
  final bool clearMovieGroups;

  @override
  String toString() {
    return 'ClearFavoritesResult{didConfirm: $didConfirm, clearMovieGroups: $clearMovieGroups}';
  }
}

Future<ClearFavoritesResult?> showClearFavoritesDialog(BuildContext context) async {
  return showDialog<ClearFavoritesResult>(
    context: context,
    builder: (_) => const _ClearFavoritesDialog(),
  );
}

class _ClearFavoritesDialog extends HookWidget {
  const _ClearFavoritesDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> isChecked = useState(false);

    return AlertDialog(
      title: Text(trSettingsClearFavoritesDialogHeader.tr),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(trSettingsClearFavoritesDialogContent.tr),
          const SizedBox(height: 16),
          Row(
            children: <Widget>[
              SizedBox(
                width: 24,
                height: 24,
                child: Checkbox(
                  value: isChecked.value,
                  onChanged: (bool? value) => isChecked.value = value ?? false,
                ),
              ),
              const SizedBox(width: 12),
              Text(trSettingsClearFavoritesDialogClearGroups.tr),
            ],
          )
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => ScreensNavigator.pop(result: ClearFavoritesResult(didConfirm: false)),
          child: Text(trCommonCancel.tr),
        ),
        TextButton(
          onPressed: () =>
              ScreensNavigator.pop(result: ClearFavoritesResult(didConfirm: true, clearMovieGroups: isChecked.value)),
          child: Text(trCommonClear.tr),
        ),
      ],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    );
  }
}
