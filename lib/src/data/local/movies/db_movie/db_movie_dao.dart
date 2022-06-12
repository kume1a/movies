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
        ${TableMovies.columnNameKa},
        ${TableMovies.columnNameEn},
        ${TableMovies.columnYear},
        ${TableMovies.columnImdbUrl},
        ${TableMovies.columnIsTvShow},
        ${TableMovies.columnDuration},
        ${TableMovies.columnCanBePlayed},
        ${TableMovies.columnPoster},
        ${TableMovies.columnImdbRating},
        ${TableMovies.columnVoterCount},
        ${TableMovies.columnPlotKa},
        ${TableMovies.columnPlotEn}
      ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
    ''', <Object?>[
      dbMovie.id,
      dbMovie.movieId,
      dbMovie.nameKa,
      dbMovie.nameEn,
      dbMovie.year,
      dbMovie.imdbUrl,
      if (dbMovie.isTvShow) 1 else 0,
      dbMovie.duration,
      if (dbMovie.canBePlayed) 1 else 0,
      dbMovie.poster,
      dbMovie.imdbRating,
      dbMovie.voterCount,
      dbMovie.plotKa,
      dbMovie.plotEn,
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

  Future<void> deleteAll() async => _db.delete(TableMovies.name);

  Future<void> deleteById(int id) async {
    await _db.rawDelete('''
      DELETE FROM ${TableMovies.name} 
      WHERE ${TableMovies.name}.${TableMovies.columnId} = ?;
    ''', <Object?>[
      id,
    ]);
  }

  Future<bool> existsById(int id) async {
    final List<Map<String, Object?>> result = await _db.rawQuery('''
      SELECT COUNT(${TableMovies.columnId}) 
      FROM ${TableMovies.name}
      WHERE ${TableMovies.columnId} = ?;
    ''', <Object?>[
      id,
    ]);

    return (Sqflite.firstIntValue(result) ?? -1) > 0;
  }
}
