import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/main/statistics_controller.dart';
import '../../../l10n/translation_keys.dart';

class WatchedMovieGenresHeader extends GetView<StatisticsController> {
  const WatchedMovieGenresHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.genreToPercentage.isNotEmpty
          ? Text(
              trStatisticsHeaderMovieGenres.tr,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            )
          : const SizedBox.shrink(),
    );
  }
}
