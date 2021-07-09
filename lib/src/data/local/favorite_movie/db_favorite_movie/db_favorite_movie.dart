import 'package:freezed_annotation/freezed_annotation.dart';

import '../../tables.dart';

part 'db_favorite_movie.freezed.dart';

@freezed
class DBFavoriteMovie with _$DBFavoriteMovie {
  const factory DBFavoriteMovie({
    int? id,
    required int movieId,
    required int? groupId,
    required String movieNameKa,
    required String movieNameEn,
    required int timestamp,
  }) = _DBFavoriteMovie;

  factory DBFavoriteMovie.fromMap(Map<String, dynamic> map) {
    return DBFavoriteMovie(
      id: map[TableFavoriteMovies.columnId] as int? ?? -1,
      movieId: map[TableFavoriteMovies.columnMovieId] as int? ?? -1,
      groupId: map[TableFavoriteMovies.columnGroupId] as int?,
      movieNameKa: map[TableFavoriteMovies.columnMovieNameKa] as String? ?? '',
      movieNameEn: map[TableFavoriteMovies.columnMovieNameEn] as String? ?? '',
      timestamp: map[TableFavoriteMovies.columnTimestamp] as int? ?? -1,
    );
  }
}
