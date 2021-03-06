import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../state/statistics/statistics_bloc.dart';
import '../../core/routes/screens_navigator.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: UniqueKey(),
      onVisibilityChanged: (VisibilityInfo info) {
        if (info.visibleFraction == 1) {
          // button gets visible means that statistics page is visible and refresh is needed
          context.read<StatisticsBloc>().add(const StatisticsEvent.refreshData());
        }
      },
      child: IconButton(
        onPressed: () => ScreensNavigator.pushSettingsPage(),
        icon: const Icon(Icons.settings_outlined),
        splashRadius: 24,
        iconSize: 30,
      ),
    );
  }
}
