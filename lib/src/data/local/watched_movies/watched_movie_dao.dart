import 'package:injectable/injectable.dart';

import '../../model/models/watched_movies/watched_movie.dart';
import 'db_watched_movie/db_watched_movie.dart';
import 'db_watched_movie/db_watched_movie_dao.dart';

@lazySingleton
class WatchedMovieDao {
  WatchedMovieDao(this._watchedMovieDao);

  final DBWatchedMovieDao _watchedMovieDao;

  static const double _watchedMovieDurationThreshold = .85;

  Future<void> insertOrUpdateWatchedMovie(WatchedMovie watchedMovie) async {
    final bool exists = await _watchedMovieDao.watchedMovieExists(
      movieId: watchedMovie.movieId,
      season: watchedMovie.season,
      episode: watchedMovie.episode,
    );

    final DBWatchedMovie dbWatchedMovie = DBWatchedMovie(
      movieId: watchedMovie.movieId,
      watchedDurationInMillis: watchedMovie.watchedDurationInMillis,
      durationInMillis: watchedMovie.durationInMillis,
      isTvShow: watchedMovie.isTvShow,
      episode: watchedMovie.episode,
      season: watchedMovie.season,
    );

    if (!exists) {
      await _watchedMovieDao.insertWatchedMovie(dbWatchedMovie);
    } else {
      await _watchedMovieDao.updateWatchedMovieWatchedDuration(dbWatchedMovie);
    }
  }

  Future<List<WatchedMovie>> getAll(int? timestampFrom) async {
    final List<DBWatchedMovie> result = await _watchedMovieDao.getAll(timestampFrom);
    return result.map((DBWatchedMovie e) {
      return _convertToWachedMovie(e);
    }).toList();
  }

  Future<List<WatchedMovie>> getWatchedMovies() async {
    final List<DBWatchedMovie> result = await _watchedMovieDao.getWatchedMovies();
    return _filterMapToWatchedMovies(result);
  }

  Future<List<WatchedMovie>> getWatchedEpisodes() async {
    final List<DBWatchedMovie> result = await _watchedMovieDao.getWatchedEpisodes();
    return _filterMapToWatchedMovies(result);
  }

  List<WatchedMovie> _filterMapToWatchedMovies(List<DBWatchedMovie> watchedMovies) {
    return watchedMovies.where((DBWatchedMovie e) {
      return e.watchedDurationInMillis / e.durationInMillis >= _watchedMovieDurationThreshold;
    }).map((DBWatchedMovie e) {
      return _convertToWachedMovie(e);
    }).toList();
  }

  WatchedMovie _convertToWachedMovie(DBWatchedMovie dbWatchedMovie) {
    return WatchedMovie(
      movieId: dbWatchedMovie.movieId,
      watchedDurationInMillis: dbWatchedMovie.watchedDurationInMillis,
      durationInMillis: dbWatchedMovie.durationInMillis,
      isTvShow: dbWatchedMovie.isTvShow,
      season: dbWatchedMovie.season,
      episode: dbWatchedMovie.episode,
      date: DateTime.fromMillisecondsSinceEpoch(dbWatchedMovie.timestamp!),
    );
  }
}
