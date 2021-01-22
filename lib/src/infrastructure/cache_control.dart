import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:movo/src/infrastructure/hive_box_holder.dart';

part 'cache_control.g.dart';

@HiveType(typeId: HiveTypeIdHolder.launchTimestampId)
class LaunchTimestamp {
  @HiveField(0)
  final String _dateString;

  LaunchTimestamp(this._dateString);

  DateTime get dateTime => DateTime.tryParse(_dateString);

  @override
  String toString() => 'LaunchTimestamp{_dateString: $_dateString}';
}

@injectable
class CacheControl {
  final HiveBoxHolder _boxHolder;
  static const String _key = 'key';

  const CacheControl(this._boxHolder);

  Future<void> configureCache() async {
    final LaunchTimestamp launchTimestamp = _boxHolder.launchTimestamp.get(_key);

    if (launchTimestamp != null && DateTime.now().difference(launchTimestamp.dateTime).inDays > 2) {
      await _clear();
    }

    await _writeLaunchTimestamp();
  }

  Future<void> _writeLaunchTimestamp() async {
    final LaunchTimestamp launchTimestamp = LaunchTimestamp(DateTime.now().toString());

    final Box<LaunchTimestamp> box = _boxHolder.launchTimestamp;

    await box.clear();
    await box.put(_key, launchTimestamp);
  }

  Future<void> _clear() async {
    await _boxHolder.movieData.clear();
    await _boxHolder.seasonFiles.clear();
  }
}
