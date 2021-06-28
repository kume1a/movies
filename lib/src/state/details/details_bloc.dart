import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../data/local/favorite_movie/favorite_movie_dao.dart';
import '../../data/local/saved_movies/saved_movie_dao.dart';
import '../../data/model/core/either.dart';
import '../../data/model/core/fetch_failure.dart';
import '../../data/model/core/option.dart';
import '../../data/model/models/actors/actors.dart';
import '../../data/model/models/movies/movie_data.dart';
import '../../data/model/models/movies/movie_position.dart';
import '../../data/model/models/movies/saved_movie.dart';
import '../../data/network/services/movie_service.dart';

part 'details_bloc.freezed.dart';
part 'details_event.dart';
part 'details_state.dart';

@injectable
class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  DetailsBloc(
    this._movieService,
    this._favoriteMovieDao,
    this._savedMovieDao,
    @factoryParam this.movieId,
  ) : super(DetailsState.initial());

  final MovieService _movieService;
  final FavoriteMovieDao _favoriteMovieDao;
  final SavedMovieDao _savedMovieDao;

  final int? movieId;

  int _actorsPage = 1;
  bool _fetchingActors = false;

  @override
  Stream<DetailsState> mapEventToState(
    DetailsEvent event,
  ) async* {
    if (movieId == -1) throw StateError('movieId should be initialized before using bloc');

    yield* event.map(
      init: (_Init event) async* {
        final bool isFavorite = await _favoriteMovieDao.isMovieFavorited(movieId!);
        yield state.copyWith(favorite: isFavorite);
      },
      movieFetchRequested: (_) async* {
        final Either<FetchFailure, MovieData> movieOption = await _movieService.getMovie(movieId!);
        yield state.copyWith(movieOption: movieOption.toOption());
      },
      castPageFetchRequested: (_) async* {
        if (!_fetchingActors) {
          _fetchingActors = true;

          final Either<FetchFailure, Actors> actorsOption = await _movieService.getActors(movieId!, _actorsPage);
          state.actorsOption.fold(
            () => actorsOption,
            (Actors prev) {
              actorsOption.getOrElse(() => Actors.empty()).actors.insertAll(0, prev.actors);
              return actorsOption;
            },
          );

          _actorsPage++;
          _fetchingActors = false;
          yield state.copyWith(actorsOption: actorsOption.toOption());
        }
      },
      favoriteToggled: (_FavoriteToggled e) async* {
        final bool toggled = !state.favorite;

        yield state.copyWith(favorite: toggled);
        _favoriteMovieDao.changeMovieFavoriteStatus(movieId!, isFavorite: toggled);
      },
      isSavedMovieRequested: (_IsSavedMovieRequested value) async* {
        final Option<SavedMovie> moviePositionOption = await _savedMovieDao.getSavedMovie(movieId!);
        yield state.copyWith(
          moviePositionOption: moviePositionOption.fold(
            () => none(),
            (SavedMovie a) => some(a.position),
          ),
        );
      },
    );
  }
}
