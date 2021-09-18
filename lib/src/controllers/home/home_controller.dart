import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../core/enums/genre.dart';
import '../../data/local/saved_movies/saved_movie_dao.dart';
import '../../data/model/core/either.dart';
import '../../data/model/core/fetch_failure.dart';
import '../../data/model/models/movies/movie_data.dart';
import '../../data/model/models/movies/movies.dart';
import '../../data/model/models/movies/saved_movie.dart';
import '../../data/network/services/movie_service.dart';
import '../../ui/core/routes/screens_navigator.dart';

class HomeController extends GetxController {
  HomeController(
    this._movieService,
    this._savedMovieDao,
  );

  final MovieService _movieService;
  final SavedMovieDao _savedMovieDao;

  final Rxn<Movies> popularMovies = Rxn<Movies>();
  final Rxn<Movies> topMovies = Rxn<Movies>();
  final Rxn<Movies> movies = Rxn<Movies>();
  final RxList<SavedMovie> savedMovies = <SavedMovie>[].obs;
  final Rx<Genre> genre = Genre.all.obs;

  late final ScrollController scrollController;

  int _topMoviesPage = 1;
  int _moviesPage = 1;
  bool _fetchingTopMovies = false;
  bool _fetchingMovies = false;

  @override
  void onInit() {
    super.onInit();

    scrollController = ScrollController();

    _fetchPopularMovies();
    _fetchNextTopMoviesPage();
    _fetchNextMoviesPage();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  Future<void> onTopMoviesScrolledToEnd() async => _fetchNextTopMoviesPage();

  Future<void> onMoviesScrolledToEnd() async => _fetchNextMoviesPage();

  Future<void> onSavedMoviesVisible() async => _fetchSavedMovies();

  Future<void> onGenreChanged(Genre genre) async {
    this.genre.value = genre;

    _moviesPage = 1;
    _fetchingMovies = false;

    _fetchNextMoviesPage();
  }

  Future<void> onRefresh() async {
    popularMovies.value = null;
    topMovies.value = null;
    movies.value = null;
    savedMovies.clear();

    _topMoviesPage = 1;
    _moviesPage = 1;
    _fetchingTopMovies = false;
    _fetchingMovies = false;

    await _fetchPopularMovies();
    await _fetchSavedMovies();
    await _fetchNextTopMoviesPage();
    await _fetchNextMoviesPage();
  }

  void onScrollUpPressed() {
    scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeIn,
    );
  }

  void onSearchPressed() => ScreensNavigator.pushSearchPage();

  void onPopularMoviePressed(MovieData movie) => ScreensNavigator.pushDetailsPage(movie.movieId);

  void onTopMoviePressed(MovieData movie) => ScreensNavigator.pushDetailsPage(movie.movieId);

  void onMoviePressed(MovieData movie) => ScreensNavigator.pushDetailsPage(movie.movieId);

  void onSavedMoviePressed(SavedMovie savedMovie) {
    ScreensNavigator.pushStreamPage(
      movieId: savedMovie.position.movieId,
      season: savedMovie.position.season,
      episode: savedMovie.position.episode,
      leftAt: savedMovie.position.leftAt,
    );
  }

  Future<void> _fetchNextTopMoviesPage() async {
    if (_fetchingTopMovies) {
      return;
    }

    _fetchingTopMovies = true;

    final Either<FetchFailure, Movies> movies = await _movieService.getTopMovies(_topMoviesPage);
    if (topMovies.value != null) {
      movies.getOrElse(() => Movies.empty()).data.insertAll(0, topMovies.value!.data);
    }

    _topMoviesPage++;
    _fetchingTopMovies = false;

    topMovies.value = movies.get;
  }

  Future<void> _fetchPopularMovies() async {
    final Either<FetchFailure, Movies> movies = await _movieService.getPopularMovies();
    popularMovies.value = movies.get;
  }

  Future<void> _fetchSavedMovies() async => savedMovies.value = await _savedMovieDao.getSavedMovies();

  Future<void> _fetchNextMoviesPage() async {
    if (_fetchingMovies) {
      return;
    }

    _fetchingMovies = true;

    final Either<FetchFailure, Movies> movies = await _movieService.getMovies(_moviesPage, genre.value);
    if (_moviesPage != 1 && this.movies.value != null) {
      movies.getOrElse(() => Movies.empty()).data.insertAll(0, this.movies.value!.data);
    }

    _moviesPage++;
    _fetchingMovies = false;

    this.movies.value = movies.get;
  }
}
