import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../data/schemas/movie/movie_data_model.dart';
import '../hive_box_holder.dart';

part 'cache_manager.g.dart';

@HiveType(typeId: HiveTypeIdHolder.cacheCleanDateId)
class CacheCleanDate {
  CacheCleanDate(this._dateString);

  @HiveField(0)
  final String _dateString;

  DateTime get dateTime => DateTime.tryParse(_dateString);

  @override
  String toString() => 'LaunchTimestamp{_dateString: $_dateString}';
}

@injectable
class CacheManager {
  const CacheManager(this._boxHolder);

  static const String _seasonCacheCleanDate = 'season_clean_date';
  static const String _movieCacheCleanDate = 'movie_cache_clean_date';

  final HiveBoxHolder _boxHolder;

  Future<void> configureCache() async {
    await _configure(
      key: _seasonCacheCleanDate,
      cacheDeadlineInDays: 2,
      onClean: () async {
        await _boxHolder.seasonFiles.clear();
      },
    );

    await _configure(
      key: _movieCacheCleanDate,
      cacheDeadlineInDays: 5,
      onClean: () async {
        for (final MovieData movieData in _boxHolder.movieData.values) {
          if (!movieData.canBePlayed) {
            await _boxHolder.movieData.delete(movieData.movieId);
          }
        }
      },
    );
  }

  Future<void> _configure({
    @required String key,
    @required int cacheDeadlineInDays,
    @required Future<void> Function() onClean,
  }) async {
    final CacheCleanDate cacheCleanDate = _boxHolder.cacheCleanDate.get(key);
    final DateTime now = DateTime.now();

    if (cacheCleanDate == null) {
      _writeCacheCleanDate(key);
    } else {
      if (now.difference(cacheCleanDate.dateTime).inDays > cacheDeadlineInDays) {
        onClean.call();
        await _writeCacheCleanDate(key);
      }
    }
  }

  Future<void> _writeCacheCleanDate(String key) async {
    final CacheCleanDate cacheCleanDate = CacheCleanDate(DateTime.now().toString());

    final Box<CacheCleanDate> box = _boxHolder.cacheCleanDate;

    await box.clear();
    await box.put(key, cacheCleanDate);
  }
}
