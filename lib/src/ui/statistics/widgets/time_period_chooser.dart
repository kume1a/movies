import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

import '../../../controllers/statistics/statistics_controller.dart';
import '../../../core/enums/time_period.dart';
import '../../../state/statistics/statistics_bloc.dart';
import '../../core/values/colors.dart';

class TimePeriodChooser extends GetView<StatisticsController> {
  const TimePeriodChooser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? appLocalizations = AppLocalizations.of(context);

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
                onPressed: () =>
                    context.read<StatisticsBloc>().add(const StatisticsEvent.timePeriodChanged(TimePeriod.year)),
                style: controller.timePeriod.value == TimePeriod.year ? activeButtonStyle : inactiveButtonStyle,
                child: Text(appLocalizations?.statisticsOptionYear ?? ''),
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Obx(
              () => TextButton(
                onPressed: () =>
                    context.read<StatisticsBloc>().add(const StatisticsEvent.timePeriodChanged(TimePeriod.month)),
                style: controller.timePeriod.value == TimePeriod.month ? activeButtonStyle : inactiveButtonStyle,
                child: Text(appLocalizations?.statisticsOptionMonth ?? ''),
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Obx(
              () => TextButton(
                onPressed: () =>
                    context.read<StatisticsBloc>().add(const StatisticsEvent.timePeriodChanged(TimePeriod.week)),
                style: controller.timePeriod.value == TimePeriod.week ? activeButtonStyle : inactiveButtonStyle,
                child: Text(appLocalizations?.statisticsOptionWeek ?? ''),
              ),
            ),
          ),
        ],
      );
    });
  }
}
