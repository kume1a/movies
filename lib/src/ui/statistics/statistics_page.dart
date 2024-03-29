import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../controllers/main/statistics_controller.dart';
import 'widgets/widgets.dart';

class StatisticsPage extends GetView<StatisticsController> {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    const EdgeInsets padding = EdgeInsets.symmetric(horizontal: 12);

    return VisibilityDetector(
      key: UniqueKey(),
      onVisibilityChanged: (VisibilityInfo info) {
        if (info.visibleFraction == 1) {
          controller.onScreenVisible();
        }
      },
      child: ListView(
        children: const <Widget>[
          Align(
            alignment: Alignment.centerRight,
            child: SettingsButton(),
          ),
          SizedBox(height: 32),
          Padding(padding: padding, child: TileMoviesWatched()),
          SizedBox(height: 16),
          Padding(padding: padding, child: TileTvSeriesWatched()),
          SizedBox(height: 16),
          Padding(padding: padding, child: TileEpisodesWatched()),
          SizedBox(height: 32),
          Padding(padding: padding, child: TimePeriodChooser()),
          SizedBox(height: 32),
          Padding(padding: padding, child: ChartDurations()),
          SizedBox(height: 32),
          Padding(padding: padding, child: TileAverageTime()),
          SizedBox(height: 32),
          Padding(padding: padding, child: WatchedMovieGenresHeader()),
          SizedBox(height: 18),
          Padding(padding: padding, child: ChartCategories()),
          SizedBox(height: 12),
        ],
      ),
    );
  }
}
