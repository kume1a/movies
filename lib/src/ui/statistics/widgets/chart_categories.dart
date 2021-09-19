import 'package:collection/collection.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/main/statistics_controller.dart';
import '../../../core/enums/movie_genre.dart';
import '../../../core/helpers/movie_genre_helper.dart';
import '../../../l10n/translation_keys.dart';
import '../../core/values/colors.dart';

class ChartCategories extends GetView<StatisticsController> {
  const ChartCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.genreToPercentage.isEmpty) return const SizedBox.shrink();

      final List<PieChartSectionData> sections =
          controller.genreToPercentage.entries.mapIndexed((int index, MapEntry<MovieGenre?, double> e) {
        return PieChartSectionData(
          color: _getSectionColor(index),
          value: e.value,
          showTitle: false,
        );
      }).toList();

      return SizedBox(
        height: 200,
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 175,
              child: PieChart(
                PieChartData(
                  sections: sections,
                  borderData: FlBorderData(show: false),
                  sectionsSpace: 4,
                ),
                swapAnimationDuration: Duration.zero,
              ),
            ),
            const SizedBox(width: 32),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: controller.genreToPercentage.entries.mapIndexed((int index, MapEntry<MovieGenre?, double> e) {
                  return Row(
                    children: <Widget>[
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _getSectionColor(index),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          e.key != null ? MovieGenreHelper.convertToString(e.key!) : trCommonOther.tr,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      );
    });
  }

  Color _getSectionColor(int index) {
    switch (index) {
      case 0:
        return colorAccentVariant1;
      case 1:
        return colorAccentVariant2;
      case 2:
        return colorAccentVariant3;
      case 3:
        return colorAccentVariant4;
      case 4:
        return colorAccentVariant5;
      case 5:
        return colorAccentVariant6;
      default:
        return colorAccent;
    }
  }
}
