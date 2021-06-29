import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

import '../../tables.dart';
import 'db_movie_group.dart';

@lazySingleton
class DBMovieGroupDao {
  DBMovieGroupDao(this._db);

  final Database _db;

  Future<void> insertMovieGroup(DBMovieGroup movieGroup) async {
    await _db.rawInsert('''
      INSERT INTO ${TableMovieGroups.name}
      (
        ${TableMovieGroups.columnName},
        ${TableMovieGroups.columnTimestamp}
      ) VALUES (?, ?);
    ''', <Object?>[
      movieGroup.name,
      DateTime.now().millisecondsSinceEpoch,
    ]);
  }

  Future<List<DBMovieGroup>> getMovieGroups() async {
    final List<Map<String, Object?>> result = await _db.rawQuery('''
      SELECT * FROM ${TableMovieGroups.name}
      ORDER BY ${TableMovieGroups.columnTimestamp} DESC;  
    ''');

    return result.map((e) => DBMovieGroup.fromMap(e)).toList();
  }
}
