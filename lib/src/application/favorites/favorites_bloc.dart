import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:movo/src/domain/i_movie_repository.dart';
import 'package:movo/src/domain/movie/movie_data_model.dart';

part 'favorites_bloc.freezed.dart';

part 'favorites_event.dart';

part 'favorites_state.dart';

@injectable
class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final IMovieRepository _repository;

  FavoritesBloc(this._repository) : super(FavoritesState.initial());

  @override
  Stream<FavoritesState> mapEventToState(
    FavoritesEvent event,
  ) async* {
    yield* event.map(
      favoriteMoviesRequested: (_FavoriteMoviesRequested e) async* {
        final List<MovieData> movies = await _repository.getMovies();
        movies.removeWhere((MovieData e) => !e.favorite);
        yield state.copyWith(moviesOption: some(movies));
      },
    );
  }
}
