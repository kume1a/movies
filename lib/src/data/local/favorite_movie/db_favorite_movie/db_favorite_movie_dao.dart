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
        ${TableFavoriteMovies.columnMovieId}
      ) VALUES (?, ?);
    ''', <Object?>[
      favoriteMovie.id,
      favoriteMovie.movieId,
    ]);
  }

  Future<List<DBFavoriteMovie>> getFavoriteMovies() async {
    final List<Map<String, Object?>> result = await _db.rawQuery('''
      SELECT * FROM ${TableFavoriteMovies.name};
    ''');

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

  Future<void> deleteFavoriteMovie(DBFavoriteMovie favoriteMovie) async {
    await _db.rawDelete('''
      DELETE FROM ${TableFavoriteMovies.name}
        WHERE ${TableFavoriteMovies.columnMovieId} = ?;
    ''', <Object?>[
      favoriteMovie.movieId,
    ]);
  }

  Future<void> deleteAll() async => _db.delete(TableFavoriteMovies.name);
}
