import 'package:freezed_annotation/freezed_annotation.dart';

import '../../tables.dart';

part 'db_movie_group.freezed.dart';

@freezed
class DBMovieGroup with _$DBMovieGroup {
  const factory DBMovieGroup({
    int? id,
    required String name,
    required int timestamp,
  }) = _DBMovieGroup;

  factory DBMovieGroup.fromMap(Map<String, dynamic> map) {
    return DBMovieGroup(
      id: map[TableMovieGroups.columnId] as int? ?? -1,
      name: map[TableMovieGroups.columnName] as String? ?? '',
      timestamp: map[TableMovieGroups.columnTimestamp] as int? ?? -1,
    );
  }
}
