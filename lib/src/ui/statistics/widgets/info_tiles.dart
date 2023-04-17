import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/main/statistics_controller.dart';
import '../../../l10n/translation_keys.dart';
import '../../core/formatters.dart';

class _InfoTile extends StatelessWidget {
  const _InfoTile({
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(title),
          Text(value),
        ],
      ),
    );
  }
}

class TileMoviesWatched extends GetView<StatisticsController> {
  const TileMoviesWatched({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => _InfoTile(
        title: trStatisticsMovieWatched.tr,
        value: controller.moviesWatched.value.toString(),
      ),
    );
  }
}

class TileTvSeriesWatched extends GetView<StatisticsController> {
  const TileTvSeriesWatched({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => _InfoTile(
        title: trStatisticsTVSeriesWatched.tr,
        value: controller.tvSeriesWatched.value.toString(),
      ),
    );
  }
}

class TileEpisodesWatched extends GetView<StatisticsController> {
  const TileEpisodesWatched({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => _InfoTile(
        title: trStatisticsEpisodesWatched.tr,
        value: controller.episodesWatched.value.toString(),
      ),
    );
  }
}

class TileAverageTime extends GetView<StatisticsController> {
  const TileAverageTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => _InfoTile(
        title: trStatisticsAverageTime.tr,
        value: formatDuration(controller.averageTime.value.inMinutes, emptyOnZero: false),
      ),
    );
  }
}
