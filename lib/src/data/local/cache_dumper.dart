import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class CacheDumper {
  const CacheDumper(
    this._sharedPreferences,
  );

  final SharedPreferences _sharedPreferences;

  Future<void> dumpCacheIfNeeded() async {

  }
}
