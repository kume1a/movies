import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../core/enums/time_period.dart';
import '../../data/local/watched_movies/watched_movie_dao.dart';
import '../../data/model/models/watched_movies/watched_movie.dart';

part 'statistics_bloc.freezed.dart';
part 'statistics_event.dart';
part 'statistics_state.dart';

@injectable
class StatisticsBloc extends Bloc<StatisticsEvent, StatisticsState> {
  StatisticsBloc(
    this._watchedMovieDao,
  ) : super(StatisticsState.initial());

  final WatchedMovieDao _watchedMovieDao;

  @override
  Stream<StatisticsState> mapEventToState(
    StatisticsEvent event,
  ) async* {
    yield* event.map(
      init: _init,
      timePeriodChanged: _timePeriodChanged,
      refreshData: _refreshData,
    );
  }

  Stream<StatisticsState> _init(_Init event) async* {
    final List<WatchedMovie> moviesWatched = await _watchedMovieDao.getWatchedMovies();
    final List<WatchedMovie> episodesWatched = await _watchedMovieDao.getWatchedEpisodes();
    final int tvSeriesWatched = episodesWatched.map((WatchedMovie e) => e.movieId).toSet().length;

    yield state.copyWith(
      moviesWatched: moviesWatched.length,
      episodesWatched: episodesWatched.length,
      tvSeriesWatched: tvSeriesWatched,
    );
  }

  Stream<StatisticsState> _timePeriodChanged(_TimePeriodChanged event) async* {
    yield state.copyWith(timePeriod: event.timePeriod);
  }

  Stream<StatisticsState> _refreshData(_RefreshData event) async* {}
}
