import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

import '../../../controllers/details/details_controller.dart';
import '../../core/values/text_styles.dart';

class CastHeader extends GetView<DetailsController> {
  const CastHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? appLocalizations = AppLocalizations.of(context);

    return Obx(() {
      return (controller.actors.value?.actors.isNotEmpty ?? true)
          ? Text(appLocalizations?.detailsHeaderCast ?? '', style: prB22)
          : const SizedBox.shrink();
    });
  }
}
