import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

import '../../../../core/helpers/enum_to_string.dart';
import '../../tables.dart';
import 'db_movie_language.dart';

@lazySingleton
class DBMovieLanguageDao {
  DBMovieLanguageDao(this._db);

  final Database _db;

  Future<void> insertMovieLanguage(DBMovieLanguage movieLanguage) async {
    await _db.rawInsert('''
      INSERT INTO ${TableMovieLanguages.name}
      (
        ${TableMovieLanguages.columnId},
        ${TableMovieLanguages.columnMovieId},
        ${TableMovieLanguages.columnLanguage}
      ) VALUES (?, ?, ?);
    ''', <Object?>[
      movieLanguage.id,
      movieLanguage.movieId,
      EnumToString.convertToString(movieLanguage.language),
    ]);
  }

  Future<List<DBMovieLanguage>> getMovieLanguages(int movieId) async {
    final List<Map<String, Object?>> result = await _db.rawQuery('''
      SELECT * FROM ${TableMovieLanguages.name}
        WHERE ${TableMovieLanguages.columnMovieId} = ?;
    ''', <Object?>[
      movieId,
    ]);

    return result.map((Map<String, Object?> e) => DBMovieLanguage.fromMap(e)).toList();
  }

  Future<void> deleteAll() async => _db.delete(TableMovieLanguages.name);

  Future<void> deleteAllByMovieId(int movieId) async {
    await _db.rawDelete('''
      DELETE FROM ${TableMovieLanguages.name}
      WHERE ${TableMovieLanguages.columnMovieId} = ?;
    ''', <Object?>[
      movieId,
    ]);
  }
}
