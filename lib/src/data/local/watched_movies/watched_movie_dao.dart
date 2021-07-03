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
      return WatchedMovie(
        movieId: e.movieId,
        watchedDurationInMillis: e.watchedDurationInMillis,
        durationInMillis: e.durationInMillis,
        isTvShow: e.isTvShow,
        season: e.season,
        episode: e.episode,
        date: DateTime.fromMillisecondsSinceEpoch(e.timestamp!),
      );
    }).toList();
  }
}
