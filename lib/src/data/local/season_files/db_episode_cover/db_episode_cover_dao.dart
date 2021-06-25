import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

import '../../../../core/helpers/enum_to_string.dart';
import '../../tables.dart';
import 'db_episode_cover.dart';

@lazySingleton
class DBEpisodeCoverDao {
  DBEpisodeCoverDao(this._db);

  final Database _db;

  Future<void> insertEpisodeCover(DBEpisodeCover episodeCover) async {
    await _db.rawInsert('''
      INSERT INTO ${TableEpisodeCovers.name}
      (
        ${TableEpisodeCovers.columnId},
        ${TableEpisodeCovers.columnEpisodeId},
        ${TableEpisodeCovers.columnResolution},
        ${TableEpisodeCovers.columnCover}
      ) VALUES (?, ?, ?, ?);
    ''', <Object?>[
      episodeCover.id,
      episodeCover.episodeId,
      EnumToString.convertToString(episodeCover.resolution),
      episodeCover.cover,
    ]);
  }

  Future<List<DBEpisodeCover>> getEpisodeCovers(int episodeId) async {
    final List<Map<String, Object?>> result = await _db.rawQuery('''
      SELECT * FROM ${TableEpisodeCovers.name}
        WHERE ${TableEpisodeCovers.columnEpisodeId} = ?;
    ''', <Object?>[
      episodeId,
    ]);

    return result.map((Map<String, Object?> e) => DBEpisodeCover.fromMap(e)).toList();
  }
}
