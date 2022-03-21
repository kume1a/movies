import 'package:injectable/injectable.dart';

import '../../../core/enums/movie_genre.dart';
import '../../model/core/either.dart';
import '../../model/core/fetch_failure.dart';
import '../../model/models/movies/movie_data.dart';
import '../../model/models/movies/movie_position.dart';
import '../../model/models/movies/saved_movie.dart';
import '../../network/services/movie_service.dart';
import 'db_movie_position/db_movie_position.dart';
import 'db_movie_position/db_movie_position_dao.dart';
import 'db_saved_movie_genres/db_saved_movie_genre.dart';
import 'db_saved_movie_genres/db_saved_movie_genre_dao.dart';

@lazySingleton
class SavedMovieDao {
  SavedMovieDao(
    this._movieService,
    this._moviePositionDao,
    this._savedMovieGenreDao,
  );

  final MovieService _movieService;
  final DBMoviePositionDao _moviePositionDao;
  final DBSavedMovieGenreDao _savedMovieGenreDao;

  Future<void> insertMoviePosition(MoviePosition moviePosition) async {
    await _moviePositionDao.insertMoviePosition(
      DBMoviePosition(
        movieId: moviePosition.movieId,
        durationInMillis: moviePosition.durationInMillis,
        leftAt: moviePosition.leftAt,
        isTvShow: moviePosition.isTvShow,
        season: moviePosition.season,
        episode: moviePosition.episode,
        saveTimestamp: moviePosition.timestamp,
      ),
    );
  }

  Future<void> saveMovieGenres(int movieId, List<MovieGenre> genres) async {
    for (final MovieGenre genre in genres) {
      await _savedMovieGenreDao
          .insertSavedMovieGenre(DBSavedMovieGenre(movieId: movieId, genre: genre));
    }
  }

  Future<bool> positionForMovieExists(int movieId, int season, int episode) async =>
      _moviePositionDao.positionExists(movieId, season, episode);

  Future<SavedMovie?> getSavedMovie(int movieId) async {
    final DBMoviePosition? moviePosition = await _moviePositionDao.getMoviePosition(movieId);
    if (moviePosition == null) return null;

    final MoviePosition position = MoviePosition(
      movieId: moviePosition.movieId,
      durationInMillis: moviePosition.durationInMillis,
      leftAt: moviePosition.leftAt,
      isTvShow: moviePosition.isTvShow,
      season: moviePosition.season,
      episode: moviePosition.episode,
      timestamp: moviePosition.saveTimestamp,
    );
    final Either<FetchFailure, MovieData> movieData = await _movieService.getMovie(movieId);
    return movieData.fold(
      (_) => null,
      (MovieData r) => SavedMovie(position: position, data: r),
    );
  }

  Future<void> updateMoviePosition(int movieId, int leftAt) async =>
      _moviePositionDao.updateMoviePosition(movieId, leftAt);

  Future<List<SavedMovie>> getSavedMovies() async {
    final List<DBMoviePosition> moviePositions = await _moviePositionDao.getMoviePositions();
    final List<SavedMovie> savedMovies = List<SavedMovie>.empty(growable: true);
    for (final DBMoviePosition e in moviePositions) {
      final Either<FetchFailure, MovieData> movieData = await _movieService.getMovie(e.movieId);
      final MoviePosition moviePosition = MoviePosition(
        movieId: e.movieId,
        durationInMillis: e.durationInMillis,
        leftAt: e.leftAt,
        isTvShow: e.isTvShow,
        season: e.season,
        episode: e.episode,
        timestamp: e.saveTimestamp,
      );
      if (movieData.isRight()) {
        savedMovies.add(
          SavedMovie(
            position: moviePosition,
            data: movieData.rightOrCrash,
          ),
        );
      }
    }
    return savedMovies;
  }

  Future<List<MovieGenre>> getMovieGenres() async {
    final List<DBSavedMovieGenre> genres = await _savedMovieGenreDao.getAll();

    return genres.map((DBSavedMovieGenre e) => e.genre).toList();
  }

  Future<void> deleteMoviePositions() async {
    await _moviePositionDao.deleteMoviePositions();
    await _savedMovieGenreDao.deleteAll();
  }

  Future<void> deleteMoviePosition(int movieId) async =>
      _moviePositionDao.deleteMoviePosition(movieId);
}
