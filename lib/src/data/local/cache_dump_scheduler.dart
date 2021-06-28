import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'cache_dumper.dart';

@injectable
class CacheDumpScheduler {
  CacheDumpScheduler(
    this._sharedPreferences,
    this._cacheDumper,
  );

  final SharedPreferences _sharedPreferences;
  final CacheDumper _cacheDumper;

  static const String _keyLastDumpTimestamp = 'key_last_dump_timestamp';

  Future<void> dumpCacheIfNeeded() async {
    final int? lastDumpTimestamp = _sharedPreferences.getInt(_keyLastDumpTimestamp);
    final DateTime now = DateTime.now();

    if (lastDumpTimestamp == null) {
      await _sharedPreferences.setInt(_keyLastDumpTimestamp, now.millisecondsSinceEpoch);
    } else {
      final DateTime lastDumpDate = DateTime.fromMillisecondsSinceEpoch(lastDumpTimestamp);

      if (now.difference(lastDumpDate).inHours >= 24) {
        await _cacheDumper.dumpSeasonFiles();
        await _sharedPreferences.setInt(_keyLastDumpTimestamp, now.millisecondsSinceEpoch);
      }
    }
  }
}
