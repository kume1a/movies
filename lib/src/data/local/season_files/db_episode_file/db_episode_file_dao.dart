import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

import '../../../../core/helpers/enum_to_string.dart';
import '../../tables.dart';
import 'db_episode_file.dart';

@lazySingleton
class DBEpisodeFileDao {
  DBEpisodeFileDao(this._db);

  final Database _db;

  Future<void> insertDBEpisodeFile(DBEpisodeFile episodeFile) async {
    await _db.rawInsert('''
      INSERT INTO ${TableDBEpisodeFiles.name}
      (
        ${TableDBEpisodeFiles.columnId},
        ${TableDBEpisodeFiles.columnEpisodeId},
        ${TableDBEpisodeFiles.columnLanguage},
        ${TableDBEpisodeFiles.columnEpisodeFileId},
        ${TableDBEpisodeFiles.columnQuality},
        ${TableDBEpisodeFiles.columnSrc},
        ${TableDBEpisodeFiles.columnDuration}
      ) VALUES (?, ?, ?, ?, ?, ?, ?);
    ''', <Object?>[
      episodeFile.id,
      episodeFile.episodeId,
      EnumToString.convertToString(episodeFile.language),
      episodeFile.episodeFileId,
      EnumToString.convertToString(episodeFile.quality),
      episodeFile.src,
      episodeFile.duration,
    ]);
  }

  Future<List<DBEpisodeFile>> getEpisodeFiles(int episodeId) async {
    final List<Map<String, Object?>> result = await _db.rawQuery('''
      SELECT * FROM ${TableDBEpisodeFiles.name}
        WHERE ${TableDBEpisodeFiles.columnEpisodeId} = ?;
    ''', <Object?>[
      episodeId,
    ]);

    return result.map((Map<String, Object?> e) => DBEpisodeFile.fromMap(e)).toList();
  }
}
