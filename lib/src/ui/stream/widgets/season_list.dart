import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

import '../../../controllers/stream/stream_controller.dart';
import '../../core/values/colors.dart';

class SeasonList extends GetView<StreamController> {
  const SeasonList({required this.seasonNumbers});

  final List<int> seasonNumbers;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? appLocalizations = AppLocalizations.of(context);
    final ThemeData theme = Theme.of(context);

    return SizedBox(
      height: 50,
      child: Obx(
        () => ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: seasonNumbers.length,
          itemBuilder: (BuildContext context, int index) {
            return _buildItem(
              context,
              theme,
              appLocalizations,
              seasonNumber: seasonNumbers[index],
              isActive: controller.season.value == seasonNumbers[index],
            );
          },
        ),
      ),
    );
  }

  Widget _buildItem(
    BuildContext context,
    ThemeData theme,
    AppLocalizations? appLocalizations, {
    required int seasonNumber,
    required bool isActive,
  }) {
    return GestureDetector(
      onTap: () => controller.onSeasonChanged(seasonNumber),
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(left: 12, right: 8),
        child: AnimatedDefaultTextStyle(
          style: theme.textTheme.subtitle1?.copyWith(color: isActive ? colorTextPrimary : colorTextSecondary) ??
              const TextStyle(),
          duration: const Duration(milliseconds: 300),
          child: Text(appLocalizations?.streamSeason(seasonNumber) ?? ''),
        ),
      ),
    );
  }
}
