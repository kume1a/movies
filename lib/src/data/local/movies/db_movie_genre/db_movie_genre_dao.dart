import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

import '../../tables.dart';
import 'db_movie_genre.dart';

@lazySingleton
class DBMovieGenreDao {
  DBMovieGenreDao(this._db);

  final Database _db;

  Future<void> insertMovieGenre(DBMovieGenre movieGenre) async {
    await _db.rawInsert('''
      INSERT INTO ${TableMovieGenres.name}
      (
        ${TableMovieGenres.columnId},
        ${TableMovieGenres.columnMovieId},
        ${TableMovieGenres.columnGenre}
      ) VALUES (?, ?, ?);
    ''', <Object?>[
      movieGenre.id,
      movieGenre.movieId,
      movieGenre.genre,
    ]);
  }

  Future<List<DBMovieGenre>> getMovieGenres(int movieId) async {
    final List<Map<String, Object?>> result = await _db.rawQuery('''
      SELECT * FROM ${TableMovieGenres.name} 
        WHERE ${TableMovieGenres.columnMovieId} = ?;
    ''', <Object?>[
      movieId,
    ]);

    return result.map((Map<String, Object?> e) => DBMovieGenre.fromMap(e)).toList();
  }

  Future<void> deleteAll() async => _db.delete(TableMovieGenres.name);
}
