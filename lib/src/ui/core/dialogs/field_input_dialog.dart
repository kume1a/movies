import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';

import '../../../l10n/translation_keys.dart';
import '../../core/routes/screens_navigator.dart';
import '../../core/widgets/tap_outside_to_clear_focus.dart';
import '../widgets/dialog_buttons.dart';

class FieldInputDialog extends HookWidget {
  const FieldInputDialog({
    Key? key,
    required this.header,
    required this.inputHint,
    this.initialValue,
  }) : super(key: key);

  final String header;
  final String inputHint;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<String> text = useState('');
    final TextEditingController editingController = useTextEditingController();

    useEffect(
      () {
        editingController.text = initialValue ?? '';
        return null;
      },
      <Object?>[initialValue],
    );

    return TapOutsideToClearFocus(
      child: Dialog(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                header,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 32),
              TextField(
                controller: editingController,
                decoration: InputDecoration(
                  enabledBorder:
                      const UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                  hintText: inputHint,
                ),
                onChanged: (String value) => text.value = value,
              ),
              const SizedBox(height: 64),
              Row(
                children: <Widget>[
                  Expanded(
                    child: DialogButtonNegative(
                      onPressed: () => ScreensNavigator.pop(),
                      label: trCommonCancel.tr,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: DialogButtonPositve(
                      onPressed: text.value.isNotEmpty
                          ? () => ScreensNavigator.pop(result: text.value)
                          : null,
                      label: trCommonSave.tr,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
