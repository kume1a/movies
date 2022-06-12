import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

import '../../../../core/helpers/enum_to_string.dart';
import '../../tables.dart';
import 'db_movie_trailer.dart';

@lazySingleton
class DBMovieTrailerDao {
  DBMovieTrailerDao(this._db);

  final Database _db;

  Future<void> insertMovieTrailer(DBMovieTrailer movieTrailer) async {
    await _db.rawInsert('''
      INSERT INTO ${TableMovieTrailers.name}
      (
        ${TableMovieTrailers.columnId},
        ${TableMovieTrailers.columnMovieId},
        ${TableMovieTrailers.columnLanguage},
        ${TableMovieTrailers.columnTrailerUrl}
      ) VALUES (?, ?, ?, ?);
    ''', <Object?>[
      movieTrailer.id,
      movieTrailer.movieId,
      EnumToString.convertToString(movieTrailer.language),
      movieTrailer.trailerUrl,
    ]);
  }

  Future<List<DBMovieTrailer>> getMovieTrailers(int movieId) async {
    final List<Map<String, Object?>> result = await _db.rawQuery('''
      SELECT * FROM ${TableMovieTrailers.name}
        WHERE ${TableMovieTrailers.columnMovieId} = ?;
    ''', <Object?>[
      movieId,
    ]);

    return result.map((Map<String, Object?> e) => DBMovieTrailer.fromMap(e)).toList();
  }

  Future<void> deleteAll() async => _db.delete(TableMovieTrailers.name);

  Future<void> deleteAllByMovieId(int movieId) async {
    await _db.rawDelete('''
      DELETE FROM ${TableMovieTrailers.name}
      WHERE ${TableMovieTrailers.columnMovieId} = ?;
    ''', <Object?>[
      movieId,
    ]);
  }
}
