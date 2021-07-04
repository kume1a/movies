import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

import '../../tables.dart';
import 'db_saved_movie_genre.dart';

@lazySingleton
class DBSavedMovieGenreDao {
  DBSavedMovieGenreDao(this._db);

  final Database _db;

  Future<void> insertSavedMovieGenre(DBSavedMovieGenre movieGenre) async {
    await _db.rawInsert('''
      INSERT INTO ${TableSavedMovieGenres.name}
      (
        ${TableSavedMovieGenres.columnId},
        ${TableSavedMovieGenres.columnMovieId},
        ${TableSavedMovieGenres.columnGenre}
      ) VALUES (?, ?, ?);
    ''', <Object?>[
      movieGenre.id,
      movieGenre.movieId,
      movieGenre.genre,
    ]);
  }

  Future<List<DBSavedMovieGenre>> getAll() async {
    final List<Map<String, Object?>> result = await _db.rawQuery('''
      SELECT * FROM ${TableSavedMovieGenres.name};
    ''');

    return result.map((Map<String, Object?> e) => DBSavedMovieGenre.fromMap(e)).toList();
  }

  Future<void> deleteAll() async => _db.delete(TableSavedMovieGenres.name);
}
