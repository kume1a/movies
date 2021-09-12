import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

import '../../../controllers/statistics/statistics_controller.dart';

class WatchedMovieGenresHeader extends GetView<StatisticsController> {
  const WatchedMovieGenresHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? appLocalizations = AppLocalizations.of(context);

    return Obx(
      () => controller.genreToPercentage.isNotEmpty
          ? Text(
              appLocalizations?.statisticsHeaderMovieGenres ?? '',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            )
          : const SizedBox.shrink(),
    );
  }
}
