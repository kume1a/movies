import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

import '../../tables.dart';
import 'db_episode.dart';

@lazySingleton
class DBEpisodeDao {
  DBEpisodeDao(this._db);

  final Database _db;

  Future<int> insertDBEpisode(DBEpisode episode) async {
    return _db.rawInsert('''
      INSERT INTO ${TableDBEpisodes.name}
      (
        ${TableDBEpisodes.columnId},
        ${TableDBEpisodes.columnSeasonFilesId},
        ${TableDBEpisodes.columnEpisode},
        ${TableDBEpisodes.columnTitle},
        ${TableDBEpisodes.columnDescription},
        ${TableDBEpisodes.columnRating},
        ${TableDBEpisodes.columnPoster}
      ) VALUES (?, ?, ?, ?, ?, ?, ?);
    ''', <Object?>[
      episode.id,
      episode.seasonFilesId,
      episode.episode,
      episode.title,
      episode.description,
      episode.rating.toString(),
      episode.poster,
    ]);
  }

  Future<List<DBEpisode>> getEpisodes(int seasonFilesId) async {
    final List<Map<String, Object?>> result = await _db.rawQuery('''
      SELECT * FROM ${TableDBEpisodes.name}
        WHERE ${TableDBEpisodes.columnSeasonFilesId} = ?;
    ''', <Object?>[
      seasonFilesId,
    ]);

    return result.map((Map<String, Object?> e) => DBEpisode.fromMap(e)).toList();
  }
}
