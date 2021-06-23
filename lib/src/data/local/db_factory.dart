import 'dart:async';

import 'package:sqflite/sqflite.dart';

class DbFactory {
  static const String _databaseName = 'movo.db';

  static Future<Database> create() async {
    final Database database = await openDatabase(
      _databaseName,
      version: 1,
      onConfigure: _onConfigure,
      onCreate: _onCreate,
    );
    return database;
  }

  static FutureOr<void> _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  static FutureOr<void> _onCreate(Database db, int version) async {
  }
}
