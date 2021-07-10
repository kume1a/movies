import 'package:collection/collection.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/enums/movie_genre.dart';
import '../../../core/helpers/movie_genre_helper.dart';
import '../../../state/statistics/statistics_bloc.dart';
import '../../core/values/colors.dart';

class ChartCategories extends StatelessWidget {
  const ChartCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? appLocalizations = AppLocalizations.of(context);

    return BlocBuilder<StatisticsBloc, StatisticsState>(
      buildWhen: (StatisticsState previous, StatisticsState current) =>
          !const DeepCollectionEquality().equals(previous.genreToPercentage, current.genreToPercentage),
      builder: (BuildContext context, StatisticsState state) {
        if (state.genreToPercentage.isEmpty) return const SizedBox.shrink();

        final List<PieChartSectionData> sections =
            state.genreToPercentage.entries.mapIndexed((int index, MapEntry<MovieGenre?, double> e) {
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
                  children: state.genreToPercentage.entries.mapIndexed((int index, MapEntry<MovieGenre?, double> e) {
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
                            e.key != null
                                ? MovieGenreHelper.convertToString(appLocalizations, e.key!)
                                : appLocalizations?.other ?? '',
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
      },
    );
  }

  Color _getSectionColor(int index) {
    switch (index) {
      case 0:
        return const Color(0xFF5C272F);
      case 1:
        return const Color(0xFFDB1A37);
      case 2:
        return const Color(0xFF82424B);
      case 3:
        return const Color(0xFFA8142A);
      case 4:
        return const Color(0xFFEC8493);
      case 5:
        return const Color(0xFF42262A);
      default:
        return colorAccent;
    }
  }
}
