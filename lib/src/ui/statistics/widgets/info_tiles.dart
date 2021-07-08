import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../state/statistics/statistics_bloc.dart';
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

class TileMoviesWatched extends StatelessWidget {
  const TileMoviesWatched({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? appLocalizations = AppLocalizations.of(context);

    return BlocBuilder<StatisticsBloc, StatisticsState>(
      buildWhen: (StatisticsState previous, StatisticsState current) => previous.moviesWatched != current.moviesWatched,
      builder: (BuildContext context, StatisticsState state) {
        return _InfoTile(
          title: appLocalizations?.statisticsMovieWatched ?? '',
          value: state.moviesWatched.toString(),
        );
      },
    );
  }
}

class TileTvSeriesWatched extends StatelessWidget {
  const TileTvSeriesWatched({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? appLocalizations = AppLocalizations.of(context);

    return BlocBuilder<StatisticsBloc, StatisticsState>(
      buildWhen: (StatisticsState previous, StatisticsState current) =>
          previous.tvSeriesWatched != current.tvSeriesWatched,
      builder: (BuildContext context, StatisticsState state) {
        return _InfoTile(
          title: appLocalizations?.statisticsTVSeriesWatched ?? '',
          value: state.tvSeriesWatched.toString(),
        );
      },
    );
  }
}

class TileEpisodesWatched extends StatelessWidget {
  const TileEpisodesWatched({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? appLocalizations = AppLocalizations.of(context);

    return BlocBuilder<StatisticsBloc, StatisticsState>(
      buildWhen: (StatisticsState previous, StatisticsState current) =>
          previous.episodesWatched != current.episodesWatched,
      builder: (BuildContext context, StatisticsState state) {
        return _InfoTile(
          title: appLocalizations?.statisticsEpisodesWatched ?? '',
          value: state.episodesWatched.toString(),
        );
      },
    );
  }
}

class TileAverageTime extends StatelessWidget {
  const TileAverageTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? appLocalizations = AppLocalizations.of(context);

    return BlocBuilder<StatisticsBloc, StatisticsState>(
      buildWhen: (StatisticsState previous, StatisticsState current) => previous.averageTime != current.averageTime,
      builder: (BuildContext context, StatisticsState state) {
        return _InfoTile(
          title: appLocalizations?.statisticsAverageTime ?? '',
          value: formatDuration(context, state.averageTime.inMinutes, emptyOnZero: false),
        );
      },
    );
  }
}
