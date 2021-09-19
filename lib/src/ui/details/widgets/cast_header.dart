import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/details/details_controller.dart';
import '../../../l10n/translation_keys.dart';
import '../../core/values/text_styles.dart';

class CastHeader extends GetView<DetailsController> {
  const CastHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (controller.actors.value?.actors.isNotEmpty ?? true)
          ? Text(trDetailsHeaderCast.tr, style: prB22)
          : const SizedBox.shrink();
    });
  }
}
