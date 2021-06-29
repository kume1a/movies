import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../data/local/favorite_movie/favorite_movie_dao.dart';
import '../../data/local/movie_group/movie_group_dao.dart';
import '../../data/model/models/movie_groups/movie_group.dart';
import '../../data/model/models/movies/movie_data.dart';

part 'favorites_bloc.freezed.dart';
part 'favorites_event.dart';
part 'favorites_state.dart';

@injectable
class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc(
    this._favoriteMovieDao,
    this._movieGroupDao,
  ) : super(FavoritesState.initial());

  final FavoriteMovieDao _favoriteMovieDao;
  final MovieGroupDao _movieGroupDao;

  @override
  Stream<FavoritesState> mapEventToState(
    FavoritesEvent event,
  ) async* {
    yield* event.map(
      init: _init,
      refreshData: _refreshData,
      switchedToFavorites: _switchedToFavorites,
      switchedToMovieGroups: _switchedToMovieGroups,
    );
  }

  Stream<FavoritesState> _init(_Init event) async* {
    add(const FavoritesEvent.switchedToMovieGroups());
  }

  Stream<FavoritesState> _refreshData(_RefreshData event) async* {
    if (state.movies != null) {
      add(const FavoritesEvent.switchedToFavorites());
    } else if (state.movieGroups != null) {
      add(const FavoritesEvent.switchedToMovieGroups());
    }
  }

  Stream<FavoritesState> _switchedToFavorites(_SwitchedToFavorites event) async* {
    final List<MovieData> favoriteMovies = await _favoriteMovieDao.getFavoritedMovies();
    yield state.copyWith(
      movies: favoriteMovies,
      movieGroups: null,
    );
  }

  Stream<FavoritesState> _switchedToMovieGroups(_SwitchedToMovieGroups event) async* {
    final List<MovieGroup> movieGroups = await _movieGroupDao.getMovieGroups();
    yield state.copyWith(
      movies: null,
      movieGroups: movieGroups,
    );
  }
}
