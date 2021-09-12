import 'package:get/get.dart';

import '../../core/enums/supported_locale.dart';
import '../../data/local/preferences/settings_helper.dart';

class SettingsController extends GetxController {
  SettingsController(
    this._settingsHelper,
  );

  final SettingsHelper _settingsHelper;

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
  }

  Future<void> onAutoPlaySwitched({required bool isEnabled}) async {
    autoPlayEnabled.value = isEnabled;
    await _settingsHelper.setAutoPlayEnabled(enabled: isEnabled);
  }

  Future<void> onDoubleTapToSeekValueChanged(int doubleTapToSeekValue) async {
    if (this.doubleTapToSeekValue.value != doubleTapToSeekValue) {
      this.doubleTapToSeekValue.value = doubleTapToSeekValue;
      await _settingsHelper.setDoubleTapToSeek(doubleTapToSeekValue);
    }
  }

  Future<void> onSaveMovieIntervalChanged(int saveMovieInterval) async {
    if (this.saveMovieInterval.value != saveMovieInterval) {
      this.saveMovieInterval.value = saveMovieInterval;
      await _settingsHelper.setSaveMovieInteval(saveMovieInterval);
    }
  }

  Future<void> onClearSearchHistoryPressed() async => _settingsHelper.clearSearchHistory();

  Future<void> onClearWatchHistoryPressed() async => _settingsHelper.clearSavedMovies();

  Future<void> onSearchHistoryEnabledSwitched({required bool isEnabled}) async {
    recordSearchHistoryEnabled.value = isEnabled;
    await _settingsHelper.setRecordingSearchHistoryEnabled(enabled: isEnabled);
  }

  Future<void> onWatchHistoryEnabledSwitched({required bool isEnabled}) async {
    recordWatchHistoryEnabled.value = isEnabled;
    await _settingsHelper.setRecordingWatchHistoryEnabled(enabled: isEnabled);
  }

  Future<void> onClearFavoritesPressed({required bool clearGroups}) async {
    await _settingsHelper.clearFavorites();
    if (clearGroups) {
      await _settingsHelper.clearGroups();
    }
  }

  Future<void> onClearCachePressed() async => _settingsHelper.clearCache();

  void onLocaleChanged(SupportedLocale selectedLocale) {
    // TODO: 12/09/2021 finish method when l10n is implemented
  }
}
