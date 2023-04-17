import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/main/statistics_controller.dart';
import '../../../core/enums/time_period.dart';
import '../../../l10n/translation_keys.dart';
import '../../core/values/colors.dart';

class TimePeriodChooser extends GetView<StatisticsController> {
  const TimePeriodChooser({super.key});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle activeButtonStyle = ButtonStyle(
      backgroundColor: MaterialStateProperty.all(colorAccent),
      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
      overlayColor: MaterialStateProperty.all(Colors.white30),
    );
    final ButtonStyle inactiveButtonStyle = activeButtonStyle.copyWith(
      backgroundColor: MaterialStateProperty.all(colorPrimaryLight),
      foregroundColor: MaterialStateProperty.all(colorTextSecondary),
      overlayColor: MaterialStateProperty.all(Colors.white12),
    );

    return Obx(() {
      if (controller.watchedDurations.isEmpty) return const SizedBox.shrink();

      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Obx(
              () => TextButton(
                onPressed: () => controller.onTimePeriodChanged(TimePeriod.year),
                style:
                    controller.timePeriod.value == TimePeriod.year ? activeButtonStyle : inactiveButtonStyle,
                child: Text(trStatisticsOptionYear.tr),
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Obx(
              () => TextButton(
                onPressed: () => controller.onTimePeriodChanged(TimePeriod.month),
                style:
                    controller.timePeriod.value == TimePeriod.month ? activeButtonStyle : inactiveButtonStyle,
                child: Text(trStatisticsOptionMonth.tr),
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Obx(
              () => TextButton(
                onPressed: () => controller.onTimePeriodChanged(TimePeriod.week),
                style:
                    controller.timePeriod.value == TimePeriod.week ? activeButtonStyle : inactiveButtonStyle,
                child: Text(trStatisticsOptionWeek.tr),
              ),
            ),
          ),
        ],
      );
    });
  }
}
