import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

import '../../../controllers/settings/settings_controller.dart';
import '../../core/dialogs/clear_favorites_dialog.dart';
import '../../core/dialogs/confirmation_dialog.dart';

class TileClearSearchHistory extends GetView<SettingsController> {
  const TileClearSearchHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? appLocalizations = AppLocalizations.of(context);

    return ListTile(
      title: Text(appLocalizations?.settingsClearSearchHistory ?? ''),
      subtitle: Text(appLocalizations?.settingsCommentClearSearchHistory ?? ''),
      onTap: () async {
        final bool didConfirm = await showConfirmationDialog(
          context,
          title: appLocalizations?.settingsClearSearchHistoryDialogHeader ?? '',
          content: appLocalizations?.settingsClearSearchHistoryDialogContent ?? '',
          confirmationText: appLocalizations?.clear ?? '',
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
    final AppLocalizations? appLocalizations = AppLocalizations.of(context);

    return ListTile(
      title: Text(appLocalizations?.settingsClearSavedMovies ?? ''),
      subtitle: Text(appLocalizations?.settingsCommentClearSavedMovies ?? ''),
      onTap: () async {
        final bool didConfirm = await showConfirmationDialog(
          context,
          title: appLocalizations?.settingsClearSavedMoviesDialogHeader ?? '',
          content: appLocalizations?.settingsClearSavedMoviesDialogContent ?? '',
          confirmationText: appLocalizations?.clear ?? '',
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
    final AppLocalizations? appLocalizations = AppLocalizations.of(context);

    return Obx(() {
      return SwitchListTile(
        value: controller.recordSearchHistoryEnabled.value,
        title: Text(appLocalizations?.settingsRecordSearchHistory ?? ''),
        onChanged: (bool value) => controller.onSearchHistoryEnabledSwitched(isEnabled: value),
      );
    });
  }
}

class TileRecordWatchHistory extends GetView<SettingsController> {
  const TileRecordWatchHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? appLocalizations = AppLocalizations.of(context);

    return Obx(
      () => SwitchListTile(
        value: controller.recordWatchHistoryEnabled.value,
        title: Text(appLocalizations?.settingsRecordWatchHistory ?? ''),
        onChanged: (bool value) => controller.onWatchHistoryEnabledSwitched(isEnabled: value),
      ),
    );
  }
}

class TileClearFavorites extends GetView<SettingsController> {
  const TileClearFavorites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? appLocalizations = AppLocalizations.of(context);

    return ListTile(
      title: Text(appLocalizations?.settingsClearFavorites ?? ''),
      subtitle: Text(appLocalizations?.settingsCommentClearFavorites ?? ''),
      onTap: () async {
        final ClearFavoritesResult? clearFavoritesResult = await showClearFavoritesDialog(context);

        if (clearFavoritesResult != null && clearFavoritesResult.didConfirm) {
          controller.onClearFavoritesPressed(clearGroups: clearFavoritesResult.clearMovieGroups);
        }
      },
    );
  }
}
