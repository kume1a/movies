import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

import '../../../controllers/statistics/statistics_controller.dart';
import '../../core/formatters.dart';

class _InfoTile extends StatelessWidget {
  const _InfoTile({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

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
  const TileMoviesWatched({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? appLocalizations = AppLocalizations.of(context);

    return Obx(
      () => _InfoTile(
        title: appLocalizations?.statisticsMovieWatched ?? '',
        value: controller.moviesWatched.value.toString(),
      ),
    );
  }
}

class TileTvSeriesWatched extends GetView<StatisticsController> {
  const TileTvSeriesWatched({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? appLocalizations = AppLocalizations.of(context);

    return Obx(
      () => _InfoTile(
        title: appLocalizations?.statisticsTVSeriesWatched ?? '',
        value: controller.tvSeriesWatched.value.toString(),
      ),
    );
  }
}

class TileEpisodesWatched extends GetView<StatisticsController> {
  const TileEpisodesWatched({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? appLocalizations = AppLocalizations.of(context);

    return Obx(
      () => _InfoTile(
        title: appLocalizations?.statisticsEpisodesWatched ?? '',
        value: controller.episodesWatched.value.toString(),
      ),
    );
  }
}

class TileAverageTime extends GetView<StatisticsController> {
  const TileAverageTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? appLocalizations = AppLocalizations.of(context);

    return Obx(
      () => _InfoTile(
        title: appLocalizations?.statisticsAverageTime ?? '',
        value: formatDuration(context, controller.averageTime.value.inMinutes, emptyOnZero: false),
      ),
    );
  }
}
