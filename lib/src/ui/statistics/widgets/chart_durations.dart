import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../controllers/main/statistics_controller.dart';
import '../../../core/enums/time_period.dart';
import '../../../data/model/models/watched_movies/watched_duration.dart';
import '../../../l10n/parameterized_translations.dart';
import '../../core/values/colors.dart';

class ChartDurations extends GetView<StatisticsController> {
  const ChartDurations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.watchedDurations.isEmpty) return const SizedBox.shrink();

      double minY = double.maxFinite;
      double maxY = double.minPositive;
      double _minX = 0;
      double _maxX = 0;
      double _minY = 0;
      double _maxY = 0;
      const int divider = 25;

      final int bottomTitlesCount = controller.timePeriod.value == TimePeriod.year ? 5 : 6;
      final List<FlSpot> values = controller.watchedDurations.map((WatchedDuration e) {
        if (e.durationInMillis.compareTo(BigInt.from(minY)) < 0) minY = e.durationInMillis.toDouble();
        if (e.durationInMillis.compareTo(BigInt.from(maxY)) > 0) maxY = e.durationInMillis.toDouble();

        return FlSpot(
          e.date.millisecondsSinceEpoch.toDouble(),
          e.durationInMillis.toDouble(),
        );
      }).toList();

      _minX = values.first.x;
      _maxX = values.last.x;
      _minY = (minY / divider).floorToDouble() * divider;
      _maxY = (maxY / divider).ceilToDouble() * divider;

      final double leftTitlesInterval = maxY - minY != 0 ? ((_maxY - _minY) / 5).floorToDouble() : 100;
      final double bottomTitlesInterval = (_maxX - _minX) / bottomTitlesCount + .01;

      final DateFormat dateFormat = controller.timePeriod.value == TimePeriod.year
          ? DateFormat('MMM d yy', Localizations.localeOf(context).languageCode)
          : DateFormat.MMMd(Localizations.localeOf(context).languageCode);

      return AspectRatio(
        aspectRatio: 16 / 9,
        child: LineChart(
          LineChartData(
            lineTouchData: LineTouchData(enabled: false),
            gridData: FlGridData(show: false),
            titlesData: FlTitlesData(
              bottomTitles: SideTitles(
                showTitles: true,
                getTextStyles: (_, __) => const TextStyle(color: Colors.white54, fontSize: 12),
                getTitles: (double value) => dateFormat.format(DateTime.fromMillisecondsSinceEpoch(value.toInt())),
                margin: 8,
                interval: bottomTitlesInterval,
              ),
              leftTitles: SideTitles(
                showTitles: true,
                getTextStyles: (_, __) => const TextStyle(color: Colors.white54, fontSize: 12),
                getTitles: (double value) {
                  final Duration duration = Duration(milliseconds: value.floor());
                  final String minutesFraction = (duration.inMinutes / 60).toStringAsFixed(1).split('.').last;
                  return ParameterizedTranslations.commonHours('${duration.inHours}.$minutesFraction');
                },
                reservedSize: 42,
                margin: 8,
                interval: leftTitlesInterval,
              ),
              rightTitles: SideTitles(showTitles: false),
              topTitles: SideTitles(showTitles: false),
            ),
            borderData: FlBorderData(
              border: const Border(
                left: BorderSide(color: Colors.white12),
                bottom: BorderSide(color: Colors.white12),
              ),
            ),
            minX: _minX,
            maxX: _maxX,
            minY: _minY,
            maxY: _maxY,
            lineBarsData: <LineChartBarData>[
              LineChartBarData(
                spots: values,
                colors: <Color>[colorAccent, colorPrimary],
                colorStops: const <double>[.6, .9],
                gradientFrom: const Offset(.1, 0),
                gradientTo: const Offset(.1, 1),
                isStrokeCapRound: true,
                dotData: FlDotData(show: false),
                belowBarData: BarAreaData(
                  show: true,
                  colors: <Color>[colorAccent, colorPrimary],
                  gradientColorStops: const <double>[0, 1],
                  gradientFrom: const Offset(.1, 0),
                  gradientTo: const Offset(.1, 1),
                ),
              )
            ],
          ),
          swapAnimationDuration: Duration.zero,
        ),
      );
    });
  }
}
