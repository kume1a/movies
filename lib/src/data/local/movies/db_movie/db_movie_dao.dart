import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

import '../../tables.dart';
import 'db_movie.dart';

@lazySingleton
class DBMovieDao {
  DBMovieDao(this._db);

  final Database _db;

  Future<void> insertDBMovie(DBMovie dbMovie) async {
    await _db.rawInsert('''
      INSERT INTO ${TableMovies.name}
      (
        ${TableMovies.columnId},
        ${TableMovies.columnMovieId},
        ${TableMovies.columnName},
        ${TableMovies.columnYear},
        ${TableMovies.columnImdbUrl},
        ${TableMovies.columnIsTvShow},
        ${TableMovies.columnDuration},
        ${TableMovies.columnCanBePlayed},
        ${TableMovies.columnPoster},
        ${TableMovies.columnImdbRating},
        ${TableMovies.columnVoterCount},
        ${TableMovies.columnPlot},
        ${TableMovies.columnIsFavorite},
        ${TableMovies.columnSaveTimestamp}
      ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
    ''', <Object?>[
      dbMovie.id,
      dbMovie.movieId,
      dbMovie.name,
      dbMovie.year,
      dbMovie.imdbUrl,
      if (dbMovie.isTvShow) 1 else 0,
      dbMovie.duration,
      if (dbMovie.canBePlayed) 1 else 0,
      dbMovie.poster,
      dbMovie.imdbRating,
      dbMovie.voterCount,
      dbMovie.plot,
      if (dbMovie.isFavorite) 1 else 0,
      dbMovie.saveTimestamp,
    ]);
  }

  Future<DBMovie?> getDBMovie(int movieId) async {
    final List<Map<String, Object?>> result = await _db.rawQuery('''
      SELECT * FROM ${TableMovies.name}
        WHERE ${TableMovies.columnMovieId} = ?;
    ''', <Object?>[
      movieId,
    ]);

    return result.isEmpty ? null : DBMovie.fromMap(result.first);
  }
}
