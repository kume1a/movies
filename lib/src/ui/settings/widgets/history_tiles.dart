import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/settings/settings_controller.dart';
import '../../../l10n/translation_keys.dart';
import '../../core/dialogs/clear_favorites_dialog.dart';
import '../../core/dialogs/confirmation_dialog.dart';

class TileClearSearchHistory extends GetView<SettingsController> {
  const TileClearSearchHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(trSettingsClearSearchHistory.tr),
      subtitle: Text(trSettingsCommentClearSearchHistory.tr),
      onTap: () async {
        final bool didConfirm = await showConfirmationDialog(
          context,
          title: trSettingsClearSearchHistoryDialogHeader.tr,
          content: trSettingsClearSearchHistoryDialogContent.tr,
          confirmationText: trCommonClear.tr,
        );

        if (didConfirm) {
          controller.onClearSearchHistoryPressed();
        }
      },
    );
  }
}

class TileClearSavedMovies extends GetView<SettingsController> {
  const TileClearSavedMovies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(trSettingsClearSavedMovies.tr),
      subtitle: Text(trSettingsCommentClearSavedMovies.tr),
      onTap: () async {
        final bool didConfirm = await showConfirmationDialog(
          context,
          title: trSettingsClearSavedMoviesDialogHeader.tr,
          content: trSettingsClearSavedMoviesDialogContent.tr,
          confirmationText: trCommonClear.tr,
        );

        if (didConfirm) {
          controller.onClearWatchHistoryPressed();
        }
      },
    );
  }
}

class TileRecordSearchHistory extends GetView<SettingsController> {
  const TileRecordSearchHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SwitchListTile(
        value: controller.recordSearchHistoryEnabled.value,
        title: Text(trSettingsRecordSearchHistory.tr),
        onChanged: (bool value) => controller.onSearchHistoryEnabledSwitched(isEnabled: value),
      );
    });
  }
}

class TileRecordWatchHistory extends GetView<SettingsController> {
  const TileRecordWatchHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SwitchListTile(
        value: controller.recordWatchHistoryEnabled.value,
        title: Text(trSettingsRecordWatchHistory.tr),
        onChanged: (bool value) => controller.onWatchHistoryEnabledSwitched(isEnabled: value),
      ),
    );
  }
}

class TileClearFavorites extends GetView<SettingsController> {
  const TileClearFavorites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(trSettingsClearFavorites.tr),
      subtitle: Text(trSettingsCommentClearFavorites.tr),
      onTap: () async {
        final ClearFavoritesResult? clearFavoritesResult = await showClearFavoritesDialog(context);

        if (clearFavoritesResult != null && clearFavoritesResult.didConfirm) {
          controller.onClearFavoritesPressed(clearGroups: clearFavoritesResult.clearMovieGroups);
        }
      },
    );
  }
}
