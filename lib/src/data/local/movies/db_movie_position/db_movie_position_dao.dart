import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

import '../../tables.dart';
import 'db_movie_position.dart';

@lazySingleton
class DBMoviePositionDao {
  DBMoviePositionDao(this._db);

  final Database _db;

  Future<void> insertMoviePosition(DBMoviePosition moviePosition) async {
    await _db.rawInsert('''
      INSERT INTO ${TableMoviePositions.name}
      (
        ${TableMoviePositions.columnId},
        ${TableMoviePositions.columnMovieId},
        ${TableMoviePositions.columnDurationInMillis},
        ${TableMoviePositions.columnLeftAt},
        ${TableMoviePositions.columnIsTvShow},
        ${TableMoviePositions.columnSeason},
        ${TableMoviePositions.columnEpisode},
        ${TableMoviePositions.columnSaveTimestamp}
      ) VALUES (?, ?, ?, ?, ?, ?, ?, ?);
    ''', <Object?>[
      moviePosition.id,
      moviePosition.movieId,
      moviePosition.durationInMillis,
      moviePosition.leftAt,
      if (moviePosition.isTvShow) 1 else 0,
      moviePosition.season,
      moviePosition.episode,
      moviePosition.saveTimestamp,
    ]);
  }

  Future<bool> positionForMovieIdExists(int movieId) async {
    final List<Map<String, Object?>> result = await _db.rawQuery('''
      SELECT COUNT(${TableMoviePositions.columnId}) 
        FROM ${TableMoviePositions.name}
      WHERE ${TableMoviePositions.columnMovieId} = ?;
    ''', <Object?>[
      movieId,
    ]);

    return (Sqflite.firstIntValue(result) ?? -1) > 0;
  }

  Future<DBMoviePosition?> getMoviePosition(int movieId) async {
    final List<Map<String, Object?>> result = await _db.rawQuery('''
      SELECT * FROM ${TableMoviePositions.name}
        WHERE ${TableMoviePositions.columnMovieId} = ?
      LIMIT 1;
    ''', <Object?>[
      movieId,
    ]);

    return result.isEmpty ? null : DBMoviePosition.fromMap(result.first);
  }

  Future<void> updateMoviePosition(int movieId, int leftAt) async {
    await _db.rawUpdate('''
      UPDATE ${TableMoviePositions.name}
        SET ${TableMoviePositions.columnLeftAt} = ?, ${TableMoviePositions.columnSaveTimestamp} = ?
      WHERE ${TableMoviePositions.columnMovieId} = ?;
    ''', <Object?>[
      leftAt,
      DateTime.now().millisecondsSinceEpoch,
      movieId,
    ]);
  }

  Future<List<DBMoviePosition>> getMoviePositions() async {
    final List<Map<String, Object?>> result = await _db.rawQuery('''
      SELECT * FROM ${TableMoviePositions.name}
      ORDER BY ${TableMoviePositions.columnSaveTimestamp} DESC;
    ''');

    return result.map((Map<String, Object?> e) => DBMoviePosition.fromMap(e)).toList();
  }

  Future<void> deleteMoviePositions() async => _db.delete(TableMoviePositions.name);
}
