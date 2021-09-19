import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/enums/supported_locale.dart';
import '../add_movie_group_dialog.dart';
import '../clear_favorites_dialog.dart';
import '../confirmation_dialog.dart';
import '../dtap_to_seek_value_chooser_dialog.dart';
import '../language_selector_dialog.dart';
import '../save_movie_interval_dialog.dart';

@lazySingleton
class DialogManager {
  Future<String?> showAddMovieGroupDialog() async => Get.dialog<String>(const AddMovieGroupDialog());

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
}
