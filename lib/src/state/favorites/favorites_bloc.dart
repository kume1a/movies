import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../data/local/favorite_movie/favorite_movie_dao.dart';
import '../../data/model/models/movies/movie_data.dart';

part 'favorites_bloc.freezed.dart';
part 'favorites_event.dart';
part 'favorites_state.dart';

@injectable
class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc(
    this._favoriteMovieDao,
  ) : super(FavoritesState.initial());

  final FavoriteMovieDao _favoriteMovieDao;

  @override
  Stream<FavoritesState> mapEventToState(
    FavoritesEvent event,
  ) async* {
    yield* event.map(
      favoriteMoviesRequested: _favoriteMoviesRequested,
    );
  }

  Stream<FavoritesState> _favoriteMoviesRequested(_FavoriteMoviesRequested event) async* {
    final List<MovieData> favoriteMovies = await _favoriteMovieDao.getFavoritedMovies();
    yield state.copyWith(movies: favoriteMovies);
  }
}
