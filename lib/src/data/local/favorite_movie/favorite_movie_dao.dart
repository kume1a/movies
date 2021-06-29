import 'dart:math';

import 'package:injectable/injectable.dart';

import '../../model/core/either.dart';
import '../../model/core/fetch_failure.dart';
import '../../model/models/movies/movie_data.dart';
import '../../network/services/movie_service.dart';
import 'db_favorite_movie/db_favorite_movie.dart';
import 'db_favorite_movie/db_favorite_movie_dao.dart';

@lazySingleton
class FavoriteMovieDao {
  FavoriteMovieDao(
    this._movieService,
    this._favoriteMovieDao,
  );

  final MovieService _movieService;
  final DBFavoriteMovieDao _favoriteMovieDao;

  Future<bool> isMovieFavorited(int movieId) async => _favoriteMovieDao.isMovieFavorited(movieId);

  Future<void> changeMovieFavoriteStatus(int movieId, {required bool isFavorite}) async {
    final DBFavoriteMovie favoriteMovie = DBFavoriteMovie(
      movieId: movieId,
      timestamp: DateTime.now().millisecondsSinceEpoch,
    );

    if (isFavorite) {
      _favoriteMovieDao.insertFavoriteMovie(favoriteMovie);
    } else {
      _favoriteMovieDao.deleteFavoriteMovie(favoriteMovie);
    }
  }

  Future<void> unfavoriteMovies() async => _favoriteMovieDao.deleteAll();

  Stream<MovieData> getFavoritedMovies() async* {
    final List<DBFavoriteMovie> dbFavoriteMovies = await _favoriteMovieDao.getFavoriteMovies();

    final Random random = Random();
    for (final DBFavoriteMovie favoriteMovie in dbFavoriteMovies) {
      final Either<FetchFailure, MovieData> movieData = await _movieService.getMovie(favoriteMovie.movieId);
      await Future<void>.delayed(Duration(milliseconds: 150 + random.nextInt(50)));
      if (movieData.isRight()) {
        yield movieData.rightOrCrash;
      }
    }
  }
}