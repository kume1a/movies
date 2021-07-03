import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

import '../../tables.dart';
import 'db_watched_movie.dart';

@lazySingleton
class DBWatchedMovieDao {
  DBWatchedMovieDao(this._db);

  final Database _db;

  Future<void> insertWatchedMovie(DBWatchedMovie watchedMovie) async {
    await _db.rawInsert('''
      INSERT INTO ${TableWatchedMovies.name}
      (
        ${TableWatchedMovies.columnMovieId},
        ${TableWatchedMovies.columnWatchedDurationInMillis},
        ${TableWatchedMovies.columnDurationInMillis},
        ${TableWatchedMovies.columnIsTvShow},
        ${TableWatchedMovies.columnSeason},
        ${TableWatchedMovies.columnEpisode}
      ) VALUES (?, ?, ?, ?, ?, ?);
    ''', <Object?>[
      watchedMovie.movieId,
      watchedMovie.watchedDurationInMillis,
      watchedMovie.durationInMillis,
      if (watchedMovie.isTvShow) 1 else 0,
      watchedMovie.season,
      watchedMovie.episode,
    ]);
  }

  Future<bool> watchedMovieExists({
    required int movieId,
    required int season,
    required int episode,
  }) async {
    final List<Map<String, Object?>> result = await _db.rawQuery('''
      SELECT COUNT(${TableWatchedMovies.columnId})
        FROM ${TableWatchedMovies.name}
      WHERE ${TableWatchedMovies.columnMovieId} = ? 
        AND ${TableWatchedMovies.columnSeason} = ? 
        AND ${TableWatchedMovies.columnEpisode} = ?;
    ''', <Object?>[
      movieId,
      season,
      episode,
    ]);

    return (Sqflite.firstIntValue(result) ?? -1) > 0;
  }

  Future<void> updateWatchedMovieWatchedDuration(DBWatchedMovie watchedMovie) async {
    await _db.rawUpdate('''
      UPDATE ${TableWatchedMovies.name}
        SET ${TableWatchedMovies.columnWatchedDurationInMillis} = ?
      WHERE ${TableWatchedMovies.columnMovieId} = ? 
        AND ${TableWatchedMovies.columnSeason} = ?
        AND ${TableWatchedMovies.columnEpisode} = ?;
    ''', <Object?>[
      watchedMovie.watchedDurationInMillis,
      watchedMovie.movieId,
      watchedMovie.season,
      watchedMovie.episode,
    ]);
  }

  Future<List<DBWatchedMovie>> getWatchedMovies() async {
    final List<Map<String, Object?>> result = await _db.rawQuery('''
      SELECT * FROM ${TableWatchedMovies.name}
        WHERE ${TableWatchedMovies.columnIsTvShow} = 0;
    ''');

    return result.map((Map<String, Object?> e) => DBWatchedMovie.fromMap(e)).toList();
  }

  Future<List<DBWatchedMovie>> getWatchedEpisodes() async {
    final List<Map<String, Object?>> result = await _db.rawQuery('''
      SELECT * FROM ${TableWatchedMovies.name}
        WHERE ${TableWatchedMovies.columnIsTvShow} = 1;
    ''');

    return result.map((Map<String, Object?> e) => DBWatchedMovie.fromMap(e)).toList();
  }
}
