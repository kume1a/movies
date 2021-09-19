import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/settings/settings_controller.dart';
import '../../../l10n/translation_keys.dart';

class TileClearSearchHistory extends GetView<SettingsController> {
  const TileClearSearchHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(trSettingsClearSearchHistory.tr),
      subtitle: Text(trSettingsCommentClearSearchHistory.tr),
      onTap: controller.onClearSearchHistoryPressed,
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
      onTap: controller.onClearWatchHistoryPressed,
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
      onTap: controller.onClearFavoritesPressed,
    );
  }
}
