import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/stream/stream_controller.dart';
import '../../../data/model/models/seasons/season.dart';
import '../../../l10n/parameterized_translations.dart';
import '../../core/values/colors.dart';

class SeasonList extends GetView<StreamController> {
  const SeasonList({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return SizedBox(
      height: 50,
      child: Obx(
        () {
          if (controller.movie.value == null) {
            return const SizedBox.shrink();
          }

          final List<int> seasonNumbers =
              controller.movie.value!.seasons.map((Season e) => e.number).toList();

          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: seasonNumbers.length,
            itemBuilder: (BuildContext context, int index) {
              return Obx(
                () => _buildItem(
                  context,
                  theme,
                  seasonNumber: seasonNumbers[index],
                  isActive: controller.season.value == seasonNumbers[index],
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildItem(
    BuildContext context,
    ThemeData theme, {
    required int seasonNumber,
    required bool isActive,
  }) {
    return GestureDetector(
      onTap: () => controller.onSeasonChanged(seasonNumber),
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(left: 12, right: 8),
        child: AnimatedDefaultTextStyle(
          style:
              theme.textTheme.subtitle1?.copyWith(color: isActive ? colorTextPrimary : colorTextSecondary) ??
                  const TextStyle(),
          duration: const Duration(milliseconds: 300),
          child: Text(ParamTranslations.streamSeason(seasonNumber)),
        ),
      ),
    );
  }
}
