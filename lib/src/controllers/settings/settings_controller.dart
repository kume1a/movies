import 'package:get/get.dart';

import '../../core/enums/supported_locale.dart';
import '../../core/helpers/enum_helpers/supported_locale_helper.dart';
import '../../data/local/preferences/settings_helper.dart';
import '../../l10n/translation_keys.dart';
import '../../ui/core/dialogs/clear_favorites_dialog.dart';
import '../../ui/core/dialogs/core/dialog_manager.dart';

class SettingsController extends GetxController {
  SettingsController(
    this._settingsHelper,
    this._dialogManager,
  );

  final SettingsHelper _settingsHelper;
  final DialogManager _dialogManager;

  final RxBool autoPlayEnabled = false.obs;
  final RxInt doubleTapToSeekValue = 10.obs;
  final RxInt saveMovieInterval = 4.obs;
  final RxBool recordSearchHistoryEnabled = true.obs;
  final RxBool recordWatchHistoryEnabled = true.obs;
  final Rx<SupportedLocale> supportedLocale = SupportedLocale.en.obs;

  @override
  Future<void> onInit() async {
    super.onInit();

    autoPlayEnabled.value = await _settingsHelper.isAutoPlayEnabled();
    doubleTapToSeekValue.value = await _settingsHelper.getDoubleTapToSeekValue();
    recordSearchHistoryEnabled.value = await _settingsHelper.isRecordSearchHistoryEnabled();
    recordWatchHistoryEnabled.value = await _settingsHelper.isRecordWatchHistoryEnabled();
    supportedLocale.value = await _settingsHelper.readLocale();
  }

  Future<void> onAutoPlaySwitched({required bool isEnabled}) async {
    autoPlayEnabled.value = isEnabled;
    await _settingsHelper.setAutoPlayEnabled(enabled: isEnabled);
  }

  Future<void> onDoubleTapToSeekPressed() async {
    final int? newValue = await _dialogManager.showDoubleTapToSeekValueChooserDialog(
      currentValue: doubleTapToSeekValue.value,
    );

    if (newValue != null && doubleTapToSeekValue.value != newValue) {
      doubleTapToSeekValue.value = newValue;
      await _settingsHelper.setDoubleTapToSeek(newValue);
    }
  }

  Future<void> onSaveMovieIntervalPressed() async {
    final int? newValue =
    await _dialogManager.showSaveMovieIntervalChooserDialog(currentValue: saveMovieInterval.value);

    if (newValue != null && saveMovieInterval.value != newValue) {
      saveMovieInterval.value = newValue;
      await _settingsHelper.setSaveMovieInteval(newValue);
    }
  }

  Future<void> onClearSearchHistoryPressed() async {
    final bool didConfirm = await _dialogManager.showConfirmationDialog(
      title: trSettingsClearSearchHistoryDialogHeader.tr,
      content: trSettingsClearSearchHistoryDialogContent.tr,
      confirmationText: trCommonClear.tr,
    );

    if (didConfirm) {
      _settingsHelper.clearSearchHistory();
    }
  }

  Future<void> onClearWatchHistoryPressed() async {
    final bool didConfirm = await _dialogManager.showConfirmationDialog(
      title: trSettingsClearSavedMoviesDialogHeader.tr,
      content: trSettingsClearSavedMoviesDialogContent.tr,
      confirmationText: trCommonClear.tr,
    );

    if (didConfirm) {
      _settingsHelper.clearSavedMovies();
    }
  }

  Future<void> onSearchHistoryEnabledSwitched({required bool isEnabled}) async {
    recordSearchHistoryEnabled.value = isEnabled;
    await _settingsHelper.setRecordingSearchHistoryEnabled(enabled: isEnabled);
  }

  Future<void> onWatchHistoryEnabledSwitched({required bool isEnabled}) async {
    recordWatchHistoryEnabled.value = isEnabled;
    await _settingsHelper.setRecordingWatchHistoryEnabled(enabled: isEnabled);
  }

  Future<void> onClearFavoritesPressed() async {
    final ClearFavoritesResult? clearFavoritesResult = await _dialogManager.showClearFavoritesDialog();

    if (clearFavoritesResult != null && clearFavoritesResult.didConfirm) {
      await _settingsHelper.clearFavorites();

      if (clearFavoritesResult.clearMovieGroups) {
        await _settingsHelper.clearGroups();
      }
    }
  }

  Future<void> onClearCachePressed() async {
    final bool didConfirm = await _dialogManager.showConfirmationDialog(
      title: trSettingsClearCacheDialogHeader.tr,
      content: trSettingsClearCacheDialogContent.tr,
      confirmationText: trCommonClear.tr,
    );

    if (didConfirm) {
      _settingsHelper.clearCache();
    }
  }

  Future<void> onLanguagePressed() async {
    final SupportedLocale? selectedLocale =
        await _dialogManager.showLanguageSelectorDialog(selectedLocale: supportedLocale.value);

    if (selectedLocale != null) {
      supportedLocale.value = selectedLocale;
      Get.updateLocale(SupportedLocaleHelper.getLocale(selectedLocale));
      await _settingsHelper.saveLocale(selectedLocale);
    }
  }
}
