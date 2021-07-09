import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

import '../../tables.dart';
import 'db_favorite_movie.dart';

@lazySingleton
class DBFavoriteMovieDao {
  DBFavoriteMovieDao(this._db);

  final Database _db;

  Future<void> insertFavoriteMovie(DBFavoriteMovie favoriteMovie) async {
    await _db.rawInsert('''
      INSERT INTO ${TableFavoriteMovies.name}
      (
        ${TableFavoriteMovies.columnId},
        ${TableFavoriteMovies.columnMovieId},
        ${TableFavoriteMovies.columnGroupId},
        ${TableFavoriteMovies.columnMovieNameKa},
        ${TableFavoriteMovies.columnMovieNameEn},
        ${TableFavoriteMovies.columnTimestamp}
      ) VALUES (?, ?, ?, ?, ?, ?);
    ''', <Object?>[
      favoriteMovie.id,
      favoriteMovie.movieId,
      favoriteMovie.groupId,
      favoriteMovie.movieNameKa,
      favoriteMovie.movieNameEn,
      favoriteMovie.timestamp,
    ]);
  }

  Future<List<DBFavoriteMovie>> getFavoriteMovies(int? groupId) async {
    late List<Map<String, Object?>> result;
    if (groupId != null) {
      result = await _db.rawQuery('''
        SELECT * FROM ${TableFavoriteMovies.name}
          WHERE ${TableFavoriteMovies.columnGroupId} = ?
        ORDER BY ${TableFavoriteMovies.columnTimestamp} DESC;
      ''', <Object?>[
        groupId,
      ]);
    } else {
      result = await _db.rawQuery('''
        SELECT * FROM ${TableFavoriteMovies.name}
        ORDER BY ${TableFavoriteMovies.columnTimestamp} DESC;
      ''');
    }

    return result.map((Map<String, Object?> e) => DBFavoriteMovie.fromMap(e)).toList();
  }

  Future<bool> isMovieFavorited(int movieId) async {
    final List<Map<String, Object?>> result = await _db.rawQuery('''
      SELECT COUNT(${TableFavoriteMovies.columnId}) 
        FROM ${TableFavoriteMovies.name}
      WHERE ${TableFavoriteMovies.columnMovieId} = ?;
    ''', <Object?>[
      movieId,
    ]);

    return (Sqflite.firstIntValue(result) ?? -1) > 0;
  }

  Future<void> deleteFavoriteMovie(int movieId) async {
    await _db.rawDelete('''
      DELETE FROM ${TableFavoriteMovies.name}
        WHERE ${TableFavoriteMovies.columnMovieId} = ?;
    ''', <Object?>[
      movieId,
    ]);
  }

  Future<void> deleteAll() async => _db.delete(TableFavoriteMovies.name);

  Future<List<String>> getFavoriteMovieNamesKaForGroup(int groupId) async {
    final List<Map<String, Object?>> result = await _db.rawQuery('''
      SELECT ${TableFavoriteMovies.columnMovieNameKa} 
        FROM ${TableFavoriteMovies.name}
      WHERE ${TableFavoriteMovies.columnGroupId} = ?
        ORDER BY ${TableFavoriteMovies.columnTimestamp} DESC;
    ''', <Object?>[
      groupId,
    ]);

    return result.map((Map<String, Object?> e) => e[TableFavoriteMovies.columnMovieNameKa] as String? ?? '').toList();
  }

  Future<List<String>> getFavoriteMovieNamesEnForGroup(int groupId) async {
    final List<Map<String, Object?>> result = await _db.rawQuery('''
      SELECT ${TableFavoriteMovies.columnMovieNameEn} 
        FROM ${TableFavoriteMovies.name}
      WHERE ${TableFavoriteMovies.columnGroupId} = ?
        ORDER BY ${TableFavoriteMovies.columnTimestamp} DESC;
    ''', <Object?>[
      groupId,
    ]);

    return result.map((Map<String, Object?> e) => e[TableFavoriteMovies.columnMovieNameEn] as String? ?? '').toList();
  }

  Future<int?> getFavoriteMovieGroupId(int movieId) async {
    final List<Map<String, Object?>> result = await _db.rawQuery('''
      SELECT ${TableFavoriteMovies.columnGroupId}
        FROM ${TableFavoriteMovies.name}
      WHERE ${TableFavoriteMovies.columnMovieId} = ?;
    ''', <Object?>[
      movieId,
    ]);

    return result.isNotEmpty ? result.first[TableFavoriteMovies.columnGroupId] as int? : null;
  }

  Future<List<int>> getFavoriteMovieIds(int groupId) async {
    final List<Map<String, Object?>> result = await _db.rawQuery('''
      SELECT ${TableFavoriteMovies.columnMovieId} 
        FROM ${TableFavoriteMovies.name}
      WHERE ${TableFavoriteMovies.columnGroupId} = ?;
    ''', <Object?>[
      groupId,
    ]);

    return result.map((Map<String, Object?> e) => e[TableFavoriteMovies.columnMovieId] as int? ?? -1).toList();
  }
}
