import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../data/local/favorite_movie/favorite_movie_dao.dart';
import '../../data/local/saved_movies/saved_movie_dao.dart';
import '../../data/model/core/either.dart';
import '../../data/model/core/fetch_failure.dart';
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
      init: _init,
      movieFetchRequested: _movieFetchRequested,
      castPageFetchRequested: _castPageFetchRequested,
      favoriteToggled: _favoriteToggled,
      isSavedMovieRequested: _isSavedMovieRequested,
    );
  }

  Stream<DetailsState> _init(_Init event) async* {
    final bool isFavorite = await _favoriteMovieDao.isMovieFavorited(movieId!);
    yield state.copyWith(isFavorite: isFavorite);
  }

  Stream<DetailsState> _movieFetchRequested(_MovieFetchRequested event) async* {
    final Either<FetchFailure, MovieData> movie = await _movieService.getMovie(movieId!);
    yield state.copyWith(movie: movie.get);
  }

  Stream<DetailsState> _castPageFetchRequested(_CastPageFetchRequested event) async* {
    if (!_fetchingActors) {
      _fetchingActors = true;

      final Either<FetchFailure, Actors> actors = await _movieService.getActors(movieId!, _actorsPage);
      if (state.actors != null) {
        actors.getOrElse(() => Actors.empty()).actors.insertAll(0, state.actors!.actors);
      }

      _actorsPage++;
      _fetchingActors = false;
      yield state.copyWith(actors: actors.get);
    }
  }

  Stream<DetailsState> _favoriteToggled(_FavoriteToggled event) async* {
    final bool toggled = !state.isFavorite;

    yield state.copyWith(isFavorite: toggled);
    _favoriteMovieDao.changeMovieFavoriteStatus(movieId!, isFavorite: toggled);
  }

  Stream<DetailsState> _isSavedMovieRequested(_IsSavedMovieRequested event) async* {
    final SavedMovie? moviePosition = await _savedMovieDao.getSavedMovie(movieId!);
    yield state.copyWith(moviePosition: moviePosition?.position);
  }
}
