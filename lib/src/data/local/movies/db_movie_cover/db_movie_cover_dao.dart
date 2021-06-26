import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

import '../../../../core/helpers/enum_to_string.dart';
import '../../tables.dart';
import 'db_movie_cover.dart';

@lazySingleton
class DBMovieCoverDao {
  DBMovieCoverDao(this._db);

  final Database _db;

  Future<void> insertMovieCover(DBMovieCover movieCover) async {
    await _db.rawInsert('''
      INSERT INTO ${TableMovieCovers.name}
      (
        ${TableMovieCovers.columnId},
        ${TableMovieCovers.columnMovieId},
        ${TableMovieCovers.columnImageSize},
        ${TableMovieCovers.columnCover}
      ) VALUES (?, ?, ?, ?);
    ''', <Object?>[
      movieCover.id,
      movieCover.movieId,
      EnumToString.convertToString(movieCover.imageSize),
      movieCover.cover,
    ]);
  }

  Future<List<DBMovieCover>> getMovieCovers(int movieId) async {
    final List<Map<String, Object?>> result = await _db.rawQuery('''
      SELECT * FROM ${TableMovieCovers.name}
        WHERE ${TableMovieCovers.columnMovieId} = ?;
    ''', <Object?>[
      movieId,
    ]);

    return result.map((Map<String, Object?> e) => DBMovieCover.fromMap(e)).toList();
  }

  Future<void> deleteAll() async => _db.delete(TableMovieCovers.name);
}
