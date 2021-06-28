import 'package:injectable/injectable.dart';

import '../../model/core/either.dart';
import '../../model/core/fetch_failure.dart';
import '../../model/core/option.dart';
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

  Future<Option<List<MovieData>>> getFavoritedMovies() async {
    final List<DBFavoriteMovie> dbFavoriteMovies = await _favoriteMovieDao.getFavoriteMovies();
    final List<Option<MovieData>> favoriteMovies =
        await Future.wait(dbFavoriteMovies.map((DBFavoriteMovie favoriteMovie) async {
      final Either<FetchFailure, MovieData> movieData = await _movieService.getMovie(favoriteMovie.movieId);
      return movieData.fold((_) => none(), (MovieData r) => some(r));
    }));

    if (favoriteMovies.every((Option<MovieData> e) => e.isSome())) {
      return some(favoriteMovies.map((Option<MovieData> e) => e.getOrElse(() => throw Exception())).toList());
    }
    return none();
  }
}
