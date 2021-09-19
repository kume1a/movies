import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/settings/settings_controller.dart';
import '../../../l10n/translation_keys.dart';

class TileClearCache extends GetView<SettingsController> {
  const TileClearCache({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(trSettingsClearCache.tr),
      subtitle: Text(trSettingsCommentClearCache.tr),
      onTap: controller.onClearCachePressed,
    );
  }
}
