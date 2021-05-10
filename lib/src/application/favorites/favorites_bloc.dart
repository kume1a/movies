import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:movo/src/domain/managers/i_favorites_manager.dart';
import 'package:movo/src/domain/movie/movie_data_model.dart';

part 'favorites_bloc.freezed.dart';

part 'favorites_event.dart';

part 'favorites_state.dart';

@injectable
class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final IFavoritesManager _favoritesManager;

  FavoritesBloc(this._favoritesManager) : super(FavoritesState.initial());

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
