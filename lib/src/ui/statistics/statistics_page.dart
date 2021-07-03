import 'package:flutter/material.dart';

import 'widgets/widgets.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _StatisticsPageContent();
  }
}

class _StatisticsPageContent extends StatelessWidget {
  const _StatisticsPageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const EdgeInsets padding = EdgeInsets.symmetric(horizontal: 12);

    return ListView(
      children: const <Widget>[
        Align(
          alignment: Alignment.centerRight,
          child: SettingsButton(),
        ),
        SizedBox(height: 32),
        Padding(padding: padding, child: TileMoviesWatched()),
        SizedBox(height: 16),
        Padding(padding: padding, child: TileEpisodesWatched()),
        SizedBox(height: 32),
        Padding(padding: padding, child: TimePeriodChooser()),
        SizedBox(height: 32),
        Padding(padding: padding, child: ChartDurations()),
        SizedBox(height: 32),
        Padding(padding: padding, child: TileAverageTime()),
        SizedBox(height: 32),
        Padding(
          padding: padding,
          child: Text(
            'Watched Movie Categories',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(height: 18),
        Padding(padding: padding, child: ChartCategories()),
        SizedBox(height: 12),
      ],
    );
  }
}
