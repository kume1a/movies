import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/enums/time_period.dart';
import '../../../state/statistics/statistics_bloc.dart';
import '../../core/values/colors.dart';

class TimePeriodChooser extends StatelessWidget {
  const TimePeriodChooser({Key? key}) : super(key: key);

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

    return BlocBuilder<StatisticsBloc, StatisticsState>(
      buildWhen: (StatisticsState previous, StatisticsState current) => previous.timePeriod != current.timePeriod,
      builder: (BuildContext context, StatisticsState state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: TextButton(
                onPressed: () =>
                    context.read<StatisticsBloc>().add(const StatisticsEvent.timePeriodChanged(TimePeriod.year)),
                style: state.timePeriod == TimePeriod.year ? activeButtonStyle : inactiveButtonStyle,
                child: const Text('This Year'),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: TextButton(
                onPressed: () =>
                    context.read<StatisticsBloc>().add(const StatisticsEvent.timePeriodChanged(TimePeriod.month)),
                style: state.timePeriod == TimePeriod.month ? activeButtonStyle : inactiveButtonStyle,
                child: const Text('This Month'),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: TextButton(
                onPressed: () =>
                    context.read<StatisticsBloc>().add(const StatisticsEvent.timePeriodChanged(TimePeriod.week)),
                style: state.timePeriod == TimePeriod.week ? activeButtonStyle : inactiveButtonStyle,
                child: const Text('This Week'),
              ),
            ),
          ],
        );
      },
    );
  }
}
