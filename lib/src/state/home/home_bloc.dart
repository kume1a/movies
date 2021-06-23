import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../data/local/movies/saved_movie_dao.dart';
import '../../data/model/core/either.dart';
import '../../data/model/core/fetch_failure.dart';
import '../../data/model/core/option.dart';
import '../../data/model/models/movies/movie_position.dart';
import '../../data/model/models/movies/saved_movies.dart';
import '../../data/model/schemas/core/enums.dart';
import '../../data/model/schemas/movie/movie_data_model.dart';
import '../../data/model/schemas/movies/movies_model.dart';
import '../../data/network/services/movie_service.dart';

part 'home_bloc.freezed.dart';
part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(
    this._movieService,
    this._savedMoviesManager,
  ) : super(HomeState.initial());

  final MovieService _movieService;
  final SavedMovieDao _savedMoviesManager;

  int _topMoviesPage = 1;
  int _moviesPage = 1;

  bool _fetchingTopMovies = false;
  bool _fetchingMovies = false;

  void _initFetchStates() {
    _topMoviesPage = 1;
    _moviesPage = 1;

    _fetchingTopMovies = false;
    _fetchingMovies = false;
  }

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    yield* event.map(
      popularMoviesFetchRequested: (_PopularMoviesFetchRequested e) async* {
        final Either<FetchFailure, Movies> movies = await _movieService.getPopularMovies();
        yield state.copyWith(
          popularMoviesOption: movies.toOption(),
        );
      },
      topMoviesPageFetchRequested: (_) async* {
        if (!_fetchingTopMovies) {
          _fetchingTopMovies = true;

          final Either<FetchFailure, Movies> movies = await _movieService.getTopMovies(_topMoviesPage);
          state.topMoviesOption.combineData(movies.toOption());

          _topMoviesPage++;
          _fetchingTopMovies = false;
          yield state.copyWith(
            topMoviesOption: movies.toOption(),
          );
        }
      },
      moviesPageFetchRequested: (_MoviesPageFetchRequested e) async* {
        if (!_fetchingMovies) {
          _fetchingMovies = true;

          final Either<FetchFailure, Movies> movies = await _movieService.getMovies(_moviesPage, state.genre);
          if (_moviesPage != 1) state.moviesOption.combineData(movies.toOption());

          _moviesPage++;
          _fetchingMovies = false;
          yield state.copyWith(
            moviesOption: movies.toOption(),
          );
        }
      },
      clear: (_Clear e) async* {
        _initFetchStates();
        yield HomeState.initial();
      },
      genreChanged: (_GenreChanged e) async* {
        yield state.copyWith(genre: e.genre);

        _moviesPage = 1;
        _fetchingMovies = false;
        add(const HomeEvent.moviesPageFetchRequested());
      },
      savedMoviesRequested: (_SavedMoviesRequested value) async* {
        final List<MoviePosition> savedMoviePositions = await _savedMoviesManager.getSavedMovies();
        final List<SavedMovie> savedMovies = <SavedMovie>[];
        for (final MoviePosition position in savedMoviePositions) {
          final Either<FetchFailure, MovieData> data = await _movieService.getMovie(position.movieId);
          data.fold(
            (_) {},
            (MovieData a) {
              savedMovies.add(SavedMovie(position, a));
            },
          );
        }
        yield state.copyWith(savedMoviesOption: some(savedMovies));
      },
    );
  }
}

extension MoviesOptionX on Option<Movies> {
  Option<Movies> combineData(Option<Movies> other) {
    return fold(
      () => other,
      (Movies a) {
        other.getOrElse(() => Movies.empty()).data.insertAll(0, a.data);
        return other;
      },
    );
  }
}
