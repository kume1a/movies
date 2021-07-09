import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

import '../../tables.dart';
import 'db_movie_group.dart';

@lazySingleton
class DBMovieGroupDao {
  DBMovieGroupDao(this._db);

  final Database _db;

  Future<int> insertMovieGroup(DBMovieGroup movieGroup) async {
    return _db.rawInsert('''
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

    return result.map((Map<String, Object?> e) => DBMovieGroup.fromMap(e)).toList();
  }

  Future<DBMovieGroup?> getMovieGroup(int id) async {
    final List<Map<String, Object?>> result = await _db.rawQuery('''
      SELECT * FROM ${TableMovieGroups.name}
        WHERE ${TableMovieGroups.columnId} = ?;
    ''', <Object?>[
      id,
    ]);

    return result.isNotEmpty ? DBMovieGroup.fromMap(result.first) : null;
  }

  Future<int> count() async {
    final List<Map<String, Object?>> result = await _db.rawQuery('''
      SELECT COUNT(${TableMovieGroups.columnId})
        FROM ${TableMovieGroups.name};
    ''');

    return Sqflite.firstIntValue(result) ?? 0;
  }

  Future<void> deleteMovieGroup(int id) async {
    await _db.rawDelete('''
      DELETE FROM ${TableMovieGroups.name}
      WHERE ${TableMovieGroups.columnId} = ?; 
    ''', <Object?>[
      id,
    ]);
  }

  Future<void> deleteAll() => _db.delete(TableMovieGroups.name);
}
