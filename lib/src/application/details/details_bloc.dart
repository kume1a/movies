import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:movo/src/domain/actors/actors_model.dart';
import 'package:movo/src/domain/i_movie_repository.dart';
import 'package:movo/src/domain/managers/i_favorites_manager.dart';
import 'package:movo/src/domain/managers/i_saved_movies_manager.dart';
import 'package:movo/src/domain/movie/movie_data_model.dart';
import 'package:movo/src/domain/movie_position/movie_position_model.dart';

part 'details_bloc.freezed.dart';

part 'details_event.dart';

part 'details_state.dart';

@injectable
class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  final IMovieRepository _repository;
  final IFavoritesManager _favoritesManager;
  final ISavedMoviesManager _savedMoviesManager;

  final int movieId;

  DetailsBloc(
    this._repository,
    this._favoritesManager,
    this._savedMoviesManager,
    @factoryParam this.movieId,
  ) : super(DetailsState.initial()) {
    _favoritesManager.getMovieFavoriteStatus(movieId).then((bool favorite) {
      if (favorite) add(const DetailsEvent.favoriteToggled());
    });
  }

  int _actorsPage = 1;
  bool _fetchingActors = false;

  @override
  Stream<DetailsState> mapEventToState(
    DetailsEvent event,
  ) async* {
    if (movieId == -1) throw StateError('movieId should be initialized before using bloc');

    yield* event.map(
      movieFetchRequested: (_) async* {
        final Option<MovieData> movieOption = await _repository.fetchMovie(movieId);
        yield state.copyWith(movieOption: movieOption);
      },
      castPageFetchRequested: (_) async* {
        if (!_fetchingActors) {
          _fetchingActors = true;

          final Option<Actors> actorsOption = await _repository.fetchActors(movieId, _actorsPage);
          state.actorsOption.fold(
            () => actorsOption,
            (Actors prev) {
              actorsOption.getOrElse(() => Actors.empty()).actors.insertAll(0, prev.actors);
              return actorsOption;
            },
          );

          _actorsPage++;
          _fetchingActors = false;
          yield state.copyWith(
            actorsOption: actorsOption,
          );
        }
      },
      favoriteToggled: (_FavoriteToggled e) async* {
        final bool toggled = !state.favorite;

        yield state.copyWith(favorite: toggled);
        _favoritesManager.updateMovieFavoriteStatus(movieId, isFavorite: toggled);
      },
      isSavedMovieRequested: (_IsSavedMovieRequested value) async* {
        final Option<MoviePosition> moviePositionOption = await _savedMoviesManager.getSavedMovie(movieId);
        yield state.copyWith(moviePositionOption: moviePositionOption);
      },
    );
  }
}
