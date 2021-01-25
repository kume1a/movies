import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:movo/src/infrastructure/hive_box_holder.dart';

part 'cache_control.g.dart';

@HiveType(typeId: HiveTypeIdHolder.cacheCleanDateId)
class CacheCleanDate {
  @HiveField(0)
  final String _dateString;

  CacheCleanDate(this._dateString);

  DateTime get dateTime => DateTime.tryParse(_dateString);

  @override
  String toString() => 'LaunchTimestamp{_dateString: $_dateString}';
}

@injectable
class CacheControl {
  final HiveBoxHolder _boxHolder;
  static const String _seasonCacheCleanDate = 'season_clean_date';
  static const String _movieCacheCleanDate = 'movie_cache_clean_date';

  const CacheControl(this._boxHolder);

  Future<void> configureCache() async {
    final CacheCleanDate seasonCacheCleanDate = _boxHolder.cacheCleanDate.get(_seasonCacheCleanDate);
    final CacheCleanDate movieCacheCleanDate = _boxHolder.cacheCleanDate.get(_movieCacheCleanDate);
    
    final DateTime now = DateTime.now();

    if (seasonCacheCleanDate != null && now.difference(seasonCacheCleanDate.dateTime).inDays > 2) {
      await _boxHolder.seasonFiles.clear();
      _writeCacheCleanDate(_seasonCacheCleanDate);
    }
    
    if (movieCacheCleanDate != null && now.difference(movieCacheCleanDate.dateTime).inDays > 5) {
      await _boxHolder.movieData.clear();
      _writeCacheCleanDate(_movieCacheCleanDate);
    }
  }

  Future<void> _writeCacheCleanDate(String key) async {
    final CacheCleanDate cacheCleanDate = CacheCleanDate(DateTime.now().toString());

    final Box<CacheCleanDate> box = _boxHolder.cacheCleanDate;

    await box.clear();
    await box.put(key, cacheCleanDate);
  }
}
