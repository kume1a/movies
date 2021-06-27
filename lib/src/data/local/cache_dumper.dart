import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'movies/movie_dao.dart';
import 'season_files/season_files_dao.dart';

@injectable
class CacheDumper {
  const CacheDumper(
    this._sharedPreferences,
    this._movieDao,
    this._seasonFileDao,
  );

  final SharedPreferences _sharedPreferences;
  final MovieDao _movieDao;
  final SeasonFileDao _seasonFileDao;

  static const String _keyLastDumpTimestamp = 'key_last_dump_timestamp';

  Future<void> dumpCacheIfNeeded() async {
    final int? lastDumpTimestamp = _sharedPreferences.getInt(_keyLastDumpTimestamp);
    final DateTime now = DateTime.now();

    if (lastDumpTimestamp == null) {
      await _sharedPreferences.setInt(_keyLastDumpTimestamp, now.millisecondsSinceEpoch);
    } else {
      final DateTime lastDumpDate = DateTime.fromMillisecondsSinceEpoch(lastDumpTimestamp);

      if (now.difference(lastDumpDate).inHours >= 24) {
        await _dumpCache();
        await _sharedPreferences.setInt(_keyLastDumpTimestamp, now.millisecondsSinceEpoch);
      }
    }
  }

  Future<void> _dumpCache() async {
    await _seasonFileDao.deleteSeasonFiles();
    await _movieDao.deleteMovies();
  }
}
