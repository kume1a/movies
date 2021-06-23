import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

import '../../data/local/db_factory.dart';

@module
abstract class StorageModule {
  @preResolve
  @singleton
  Future<Database> get database => DbFactory.create();

  // @preResolve
  // @singleton
  // Future<SharedPreferences> get sharedPreferences => SharedPreferences.getInstance();
}
