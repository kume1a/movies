import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../data/local/saved_movies/saved_movie_dao.dart';
import '../../data/model/core/either.dart';
import '../../data/model/core/fetch_failure.dart';
import '../../data/model/models/movies/movies.dart';
import '../../data/model/models/movies/saved_movie.dart';
import '../../data/model/schemas/core/enums.dart';
import '../../data/network/services/movie_service.dart';

part 'home_bloc.freezed.dart';
part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(
    this._movieService,
    this._savedMovieDao,
  ) : super(HomeState.initial());

  final MovieService _movieService;
  final SavedMovieDao _savedMovieDao;

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
      popularMoviesFetchRequested: _popularMoviesFetchRequested,
      topMoviesPageFetchRequested: _topMoviesPageFetchRequested,
      moviesPageFetchRequested: _moviesPageFetchRequested,
      clear: _clear,
      genreChanged: _genreChanged,
      savedMoviesRequested: _savedMoviesRequested,
    );
  }

  Stream<HomeState> _popularMoviesFetchRequested(_PopularMoviesFetchRequested event) async* {
    final Either<FetchFailure, Movies> movies = await _movieService.getPopularMovies();
    yield state.copyWith(popularMovies: movies.get);
  }

  Stream<HomeState> _topMoviesPageFetchRequested(_TopMoviesPageFetchRequested event) async* {
    if (!_fetchingTopMovies) {
      _fetchingTopMovies = true;

      final Either<FetchFailure, Movies> movies = await _movieService.getTopMovies(_topMoviesPage);
      if (state.topMovies != null) {
        movies.getOrElse(() => Movies.empty()).data.insertAll(0, state.topMovies!.data);
      }

      _topMoviesPage++;
      _fetchingTopMovies = false;
      yield state.copyWith(
        topMovies: movies.get,
      );
    }
  }

  Stream<HomeState> _moviesPageFetchRequested(_MoviesPageFetchRequested event) async* {
    if (!_fetchingMovies) {
      _fetchingMovies = true;

      final Either<FetchFailure, Movies> movies = await _movieService.getMovies(_moviesPage, state.genre);
      if (_moviesPage != 1 && state.movies != null) {
        movies.getOrElse(() => Movies.empty()).data.insertAll(0, state.movies!.data);
      }

      _moviesPage++;
      _fetchingMovies = false;
      yield state.copyWith(movies: movies.get);
    }
  }

  Stream<HomeState> _clear(_Clear event) async* {
    _initFetchStates();
    yield HomeState.initial();
  }

  Stream<HomeState> _genreChanged(_GenreChanged event) async* {
    yield state.copyWith(genre: event.genre);

    _moviesPage = 1;
    _fetchingMovies = false;
    add(const HomeEvent.moviesPageFetchRequested());
  }

  Stream<HomeState> _savedMoviesRequested(_SavedMoviesRequested event) async* {
    final List<SavedMovie> savedMovies = await _savedMovieDao.getSavedMovies();
    yield state.copyWith(savedMovies: savedMovies);
  }
}
