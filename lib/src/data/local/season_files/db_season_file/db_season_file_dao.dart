import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

import '../../tables.dart';
import 'db_season_file.dart';

@lazySingleton
class DBSeasonFileDao {
  DBSeasonFileDao(this._db);

  final Database _db;

  Future<void> insertSeasonFile(DBSeasonFile seasonFile) async {
    await _db.rawInsert('''
      INSERT INTO ${TableSeasonFiles.name}
      (
        ${TableSeasonFiles.columnId},
        ${TableSeasonFiles.columnMovieId},
        ${TableSeasonFiles.columnSeason}
      ) VALUES (?, ?, ?);
    ''', <Object?>[
      seasonFile.id,
      seasonFile.movieId,
      seasonFile.season,
    ]);
  }

  Future<DBSeasonFile?> getSeasonFile(int movieId, int season) async {
    final List<Map<String, Object?>> result = await _db.rawQuery('''
      SELECT * FROM ${TableSeasonFiles.name}
        WHERE ${TableSeasonFiles.columnMovieId} = ? AND ${TableSeasonFiles.columnSeason} = ?;
    ''', <Object?>[
      movieId,
      season,
    ]);

    return result.isEmpty ? null : DBSeasonFile.fromMap(result.first);
  }
}
