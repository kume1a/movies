import 'package:freezed_annotation/freezed_annotation.dart';

import '../../tables.dart';

part 'db_season_file.freezed.dart';

@freezed
class DBSeasonFile with _$DBSeasonFile {
  const factory DBSeasonFile({
    int? id,
    required int movieId,
    required int season,
  }) = _DBSeasonFile;

  factory DBSeasonFile.fromMap(Map<String, dynamic> map) {
    return DBSeasonFile(
      id: map[TableDBSeasonFiles.columnId] as int?,
      movieId: map[TableDBSeasonFiles.columnMovieId] as int? ?? -1,
      season: map[TableDBSeasonFiles.columnSeason] as int? ?? -1,
    );
  }
}
