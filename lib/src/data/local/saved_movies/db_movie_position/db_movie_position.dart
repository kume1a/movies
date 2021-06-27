import 'package:freezed_annotation/freezed_annotation.dart';

import '../../tables.dart';

part 'db_movie_position.freezed.dart';

@freezed
class DBMoviePosition with _$DBMoviePosition {
  const factory DBMoviePosition({
    int? id,
    required int movieId,
    required int durationInMillis,
    required int leftAt,
    required bool isTvShow,
    required int season,
    required int episode,
    required int saveTimestamp,
  }) = _DBMoviePosition;

  factory DBMoviePosition.fromMap(Map<String, dynamic> map) {
    return DBMoviePosition(
      id: map[TableMoviePositions.columnId] as int?,
      movieId: map[TableMoviePositions.columnMovieId] as int? ?? -1,
      durationInMillis: map[TableMoviePositions.columnDurationInMillis] as int? ?? -1,
      leftAt: map[TableMoviePositions.columnLeftAt] as int? ?? -1,
      isTvShow: map[TableMoviePositions.columnIsTvShow] == 1,
      season: map[TableMoviePositions.columnSeason] as int? ?? -1,
      episode: map[TableMoviePositions.columnEpisode] as int? ?? -1,
      saveTimestamp: map[TableMoviePositions.columnSaveTimestamp] as int? ?? -1,
    );
  }
}
