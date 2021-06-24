import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

import '../../../../core/helpers/enum_to_string.dart';
import '../../tables.dart';
import 'movie_language.dart';

@lazySingleton
class MovieLanguageDao {
  MovieLanguageDao(this._db);

  final Database _db;

  Future<void> insertMovieLanguage(MovieLanguage movieLanguage) async {
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

  Future<List<MovieLanguage>> getMovieLanguages(int movieId) async {
    final List<Map<String, Object?>> result = await _db.rawQuery('''
      SELECT * FROM ${TableMovieLanguages.name}
        WHERE ${TableMovieLanguages.columnMovieId} = ?;
    ''', <Object?>[
      movieId,
    ]);

    return result.map((Map<String, Object?> e) => MovieLanguage.fromMap(e)).toList();
  }
}
