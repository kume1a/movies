import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../state/statistics/statistics_bloc.dart';

class WatchedMovieGenresHeader extends StatelessWidget {
  const WatchedMovieGenresHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StatisticsBloc, StatisticsState>(
      buildWhen: (StatisticsState previous, StatisticsState current) =>
          previous.genreToPercentage.length != current.genreToPercentage.length,
      builder: (BuildContext context, StatisticsState state) {
        return state.genreToPercentage.isNotEmpty
            ? const Text(
                'Watched Movie Genres',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              )
            : const SizedBox.shrink();
      },
    );
  }
}
