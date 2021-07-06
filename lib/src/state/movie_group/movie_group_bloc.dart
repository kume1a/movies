import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../data/local/favorite_movie/favorite_movie_dao.dart';
import '../../data/local/movie_group/movie_group_dao.dart';
import '../../data/model/models/movie_groups/movie_group.dart';
import '../../data/model/models/movies/movie_data.dart';
import '../../ui/core/routes/screens_navigator.dart';

part 'movie_group_bloc.freezed.dart';
part 'movie_group_event.dart';
part 'movie_group_state.dart';

@injectable
class MovieGroupBloc extends Bloc<MovieGroupEvent, MovieGroupState> {
  MovieGroupBloc(
    this._favoriteMovieDao,
    this._movieGroupDao,
  ) : super(MovieGroupState.initial());

  final FavoriteMovieDao _favoriteMovieDao;
  final MovieGroupDao _movieGroupDao;

  late int groupId;

  @override
  Stream<MovieGroupState> mapEventToState(
    MovieGroupEvent event,
  ) async* {
    yield* event.map(
      init: _init,
      refreshData: _refreshData,
      addMovieClicked: _addMovieClicked,
    );
  }

  Stream<MovieGroupState> _init(_Init event) async* {
    groupId = event.groupId;

    final List<MovieData> movies = await _favoriteMovieDao.getFavoritedMovies(groupId);
    final MovieGroup? movieGroup = await _movieGroupDao.getMovieGroup(groupId);

    yield state.copyWith(
      movies: movies,
      movieGroup: movieGroup,
    );
  }

  Stream<MovieGroupState> _refreshData(_RefreshData event) async* {
    final List<MovieData> movies = await _favoriteMovieDao.getFavoritedMovies(groupId);
    yield state.copyWith(movies: movies);
  }

  Stream<MovieGroupState> _addMovieClicked(_AddMovieClicked event) async* {
    ScreensNavigator.pushAddMoviePage(groupId);
  }
}
