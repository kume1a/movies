import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../controllers/home/authorization_prompt_controller.dart';
import '../../../l10n/translation_keys.dart';
import '../widgets/dialog_buttons.dart';

class AuthorizationPromptDialog extends GetView<AuthorizationPromptDialogController> {
  const AuthorizationPromptDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              trAuthorizationPromptHeader.tr,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 2),
            Text(
              trAuthorizationPromptSubHeader.tr,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 24),
            SvgPicture.asset(
              'assets/hourglass.svg',
              width: 80,
              height: 80,
            ),
            const SizedBox(height: 24),
            Row(
              children: <Widget>[
                Expanded(
                  child: DialogButtonNegative(
                    onPressed: controller.onResendPressed,
                    label: trCommonResend.tr,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: DialogButtonPositve(
                    onPressed: controller.onCheckPressed,
                    label: trCommonCheck.tr,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
