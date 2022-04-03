import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/enums/supported_locale.dart';
import '../authorization_prompt_dialog.dart';
import '../clear_favorites_dialog.dart';
import '../confirmation_dialog.dart';
import '../dtap_to_seek_value_chooser_dialog.dart';
import '../field_input_dialog.dart';
import '../language_selector_dialog.dart';
import '../save_movie_interval_dialog.dart';
import '../stream_settings_dialog.dart';

@lazySingleton
class DialogManager {
  Future<String?> showFieldInputDialog({
    required String header,
    required String inputHint,
    String? initialValue,
  }) async =>
      Get.dialog<String>(
        FieldInputDialog(
          inputHint: inputHint,
          header: header,
          initialValue: initialValue,
        ),
      );

  Future<bool> showConfirmationDialog({
    required String title,
    required String content,
    String? confirmationText,
  }) async {
    final bool? didConfirm = await Get.dialog<bool>(
      ConfirmationDialog(
        title: title,
        content: content,
        confirmationText: confirmationText,
      ),
    );

    return didConfirm ?? false;
  }

  Future<void> showStreamSettingsDialog() async =>
      _showSlideInDialog(child: const StreamSettingsDialog());

  Future<ClearFavoritesResult?> showClearFavoritesDialog() async =>
      Get.dialog<ClearFavoritesResult>(const ClearFavoritesDialog());

  Future<int?> showDoubleTapToSeekValueChooserDialog({required int currentValue}) async =>
      Get.dialog(DtapToSeekValueChooserDialog(currentValue: currentValue));

  Future<SupportedLocale?> showLanguageSelectorDialog({
    required SupportedLocale selectedLocale,
  }) async =>
      Get.dialog(LanguageSelectorDialog(selectedLocale: selectedLocale));

  Future<int?> showSaveMovieIntervalChooserDialog({
    required int currentValue,
  }) async =>
      Get.dialog(SaveMovieIntervalChooserDialog(currentValue: currentValue));

  Future<void> showAuthorizationPromptDialog() async => Get.dialog(
        const AuthorizationPromptDialog(),
        barrierDismissible: false,
      );

  Future<T?> _showSlideInDialog<T extends Object?>({
    required Widget child,
  }) async {
    return Get.generalDialog(
      barrierLabel: '',
      barrierDismissible: true,
      transitionDuration: const Duration(milliseconds: 150),
      pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
      ) {
        return child;
      },
      transitionBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
      ) {
        final Offset initialOffset =
            context.orientation == Orientation.portrait ? const Offset(0, 1) : const Offset(1, 0);

        return SlideTransition(
          position: Tween<Offset>(begin: initialOffset, end: Offset.zero).animate(animation),
          child: child,
        );
      },
    );
  }
}
