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
      INSERT INTO ${TableEpisodeFiles.name}
      (
        ${TableEpisodeFiles.columnId},
        ${TableEpisodeFiles.columnEpisodeId},
        ${TableEpisodeFiles.columnLanguage},
        ${TableEpisodeFiles.columnEpisodeFileId},
        ${TableEpisodeFiles.columnQuality},
        ${TableEpisodeFiles.columnSrc},
        ${TableEpisodeFiles.columnDuration}
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
      SELECT * FROM ${TableEpisodeFiles.name}
        WHERE ${TableEpisodeFiles.columnEpisodeId} = ?;
    ''', <Object?>[
      episodeId,
    ]);

    return result.map((Map<String, Object?> e) => DBEpisodeFile.fromMap(e)).toList();
  }

  Future<void> deleteAll() async => _db.delete(TableEpisodeFiles.name);
}
