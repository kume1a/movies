import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../data/local/movies/movie_dao.dart';
import '../../data/model/core/option.dart';
import '../../data/model/models/movies/movie_data.dart';

part 'favorites_bloc.freezed.dart';
part 'favorites_event.dart';
part 'favorites_state.dart';

@injectable
class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc(
    this._movieDao,
  ) : super(FavoritesState.initial());

  final MovieDao _movieDao;

  @override
  Stream<FavoritesState> mapEventToState(
    FavoritesEvent event,
  ) async* {
    yield* event.map(
      favoriteMoviesRequested: (_FavoriteMoviesRequested e) async* {
        final List<MovieData> movies = await _movieDao.getFavoritedMovies();
        yield state.copyWith(moviesOption: some(movies));
      },
    );
  }
}
