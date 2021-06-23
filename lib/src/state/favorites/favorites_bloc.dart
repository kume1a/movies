import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../data/local/favorites/favorites_dao.dart';
import '../../data/model/core/option.dart';
import '../../data/model/models/movies/movie_data.dart';

part 'favorites_bloc.freezed.dart';
part 'favorites_event.dart';
part 'favorites_state.dart';

@injectable
class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc(this._favoritesManager) : super(FavoritesState.initial());

  final FavoritesDao _favoritesManager;

  @override
  Stream<FavoritesState> mapEventToState(
    FavoritesEvent event,
  ) async* {
    yield* event.map(
      favoriteMoviesRequested: (_FavoriteMoviesRequested e) async* {
        final List<MovieData> movies = await _favoritesManager.getFavoriteMovies();
        yield state.copyWith(moviesOption: some(movies));
      },
    );
  }
}
