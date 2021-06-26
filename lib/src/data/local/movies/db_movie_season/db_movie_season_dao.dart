import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

import '../../../model/models/seasons/season.dart';
import '../../tables.dart';

@lazySingleton
class DBMovieSeasonDao {
  DBMovieSeasonDao(this._db);

  final Database _db;

  Future<void> insertMovieSeason(Season season) async {
    await _db.rawInsert('''
      INSERT INTO ${TableSeasons.name}
      (
        ${TableSeasons.columnId},
        ${TableSeasons.columnMovieId},
        ${TableSeasons.columnNumber},
        ${TableSeasons.columnName},
        ${TableSeasons.columnEpisodesCount}
      ) VALUES (?, ?, ?, ?, ?);
    ''', <Object?>[
      season.id,
      season.movieId,
      season.number,
      season.name,
      season.episodesCount,
    ]);
  }

  Future<List<Season>> getMovieSeasons(int movieId) async {
    final List<Map<String, Object?>> result = await _db.rawQuery('''
      SELECT * FROM ${TableSeasons.name}
        WHERE ${TableSeasons.columnMovieId} = ?;
    ''', <Object?>[
      movieId,
    ]);

    return result.map((Map<String, Object?> e) => Season.fromMap(e)).toList();
  }

  Future<void> deleteAll() async => _db.delete(TableSeasons.name);
}
