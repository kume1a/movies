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

  Future<List<String>> getMovieNamesForGroup(int groupId) => _favoriteMovieDao.getFavoriteMovieNamesForGroup(groupId);

  Future<int?> getFavoriteMovieGroupId(int movieId) => _favoriteMovieDao.getFavoriteMovieGroupId(movieId);

  Future<void> addMovieToGroup({
    required int movieId,
    required String movieNameKa,
    required String movieNameEn,
    required int groupId,
  }) async {
    _favoriteMovieDao.insertFavoriteMovie(DBFavoriteMovie(
      movieId: movieId,
      movieNameKa: movieNameKa,
      movieNameEn: movieNameEn,
      groupId: groupId,
      timestamp: DateTime.now().millisecondsSinceEpoch,
    ));
  }

  Future<void> justFavoriteMovie({
    required int movieId,
    required String movieNameKa,
    required String movieNameEn,
  }) async {
    _favoriteMovieDao.insertFavoriteMovie(DBFavoriteMovie(
      movieId: movieId,
      movieNameKa: movieNameKa,
      movieNameEn: movieNameEn,
      groupId: null,
      timestamp: DateTime.now().millisecondsSinceEpoch,
    ));
  }

  Future<void> deleteFavoriteMovie(int movieId) async => _favoriteMovieDao.deleteFavoriteMovie(movieId);

  Future<void> unfavoriteMovies() async => _favoriteMovieDao.deleteAll();

  Future<List<MovieData>> getFavoritedMovies([int? groupId]) async {
    final List<DBFavoriteMovie> dbFavoriteMovies = await _favoriteMovieDao.getFavoriteMovies(groupId);
    final List<MovieData> favoriteMovies = List<MovieData>.empty(growable: true);

    for (final DBFavoriteMovie favoriteMovie in dbFavoriteMovies) {
      final Either<FetchFailure, MovieData> movieData = await _movieService.getMovie(favoriteMovie.movieId);
      if (movieData.isRight()) {
        favoriteMovies.add(movieData.rightOrCrash);
      }
    }
    return favoriteMovies;
  }

  Future<List<int>> getFavoriteMovieIds(int groupId) async => _favoriteMovieDao.getFavoriteMovieIds(groupId);
}
