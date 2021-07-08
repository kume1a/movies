import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../data/local/favorite_movie/favorite_movie_dao.dart';
import '../../../data/local/movie_group/movie_group_dao.dart';
import '../../../data/model/models/movie_groups/movie_group.dart';

part 'movie_group_selector_bloc.freezed.dart';
part 'movie_group_selector_event.dart';
part 'movie_group_selector_state.dart';

@injectable
class MovieGroupSelectorBloc extends Bloc<MovieGroupSelectorEvent, MovieGroupSelectorState> {
  MovieGroupSelectorBloc(
    this._movieGroupDao,
      this._favoriteMovieDao,
  ) : super(MovieGroupSelectorState.initial());

  final MovieGroupDao _movieGroupDao;
  final FavoriteMovieDao _favoriteMovieDao;

  @override
  Stream<MovieGroupSelectorState> mapEventToState(
    MovieGroupSelectorEvent event,
  ) async* {
    yield* event.map(
      init: _init,
    );
  }

  Stream<MovieGroupSelectorState> _init(_Init event) async* {
    const MovieGroup optionNoGroup = MovieGroup(groupId: null, name: '', movieNames: <String>[]);

    MovieGroup? movieGroup = await _movieGroupDao.getMovieGroupWithMovieId(event.movieId);
    final List<MovieGroup> movieGroups = await _movieGroupDao.getMovieGroups();
    movieGroups.insert(0, optionNoGroup);
    if (movieGroup == null) {
      final bool isFavorited = await _favoriteMovieDao.isMovieFavorited(event.movieId);
      if (isFavorited) {
        movieGroup = optionNoGroup;
      }
    }

    yield state.copyWith(
      movieGroups: movieGroups,
      selectedMovieGroup: movieGroup,
    );
  }
}
