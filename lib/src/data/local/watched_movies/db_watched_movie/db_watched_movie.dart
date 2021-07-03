import 'package:freezed_annotation/freezed_annotation.dart';

import '../../tables.dart';

part 'db_watched_movie.freezed.dart';

@freezed
class DBWatchedMovie with _$DBWatchedMovie {
  const factory DBWatchedMovie({
    int? id,
    required int movieId,
    required int watchedDurationInMillis,
    required int durationInMillis,
    required bool isTvShow,
    required int season,
    required int episode,
    int? timestamp,
  }) = _DBWatchedMovie;

  factory DBWatchedMovie.fromMap(Map<String, dynamic> map) {
    return DBWatchedMovie(
      id: map[TableWatchedMovies.columnId] as int?,
      movieId: map[TableWatchedMovies.columnMovieId] as int? ?? -1,
      watchedDurationInMillis: map[TableWatchedMovies.columnWatchedDurationInMillis] as int? ?? -1,
      durationInMillis: map[TableWatchedMovies.columnDurationInMillis] as int? ?? -1,
      isTvShow: map[TableWatchedMovies.columnIsTvShow] == 1,
      season: map[TableWatchedMovies.columnSeason] as int? ?? -1,
      episode: map[TableWatchedMovies.columnEpisode] as int? ?? -1,
      timestamp: map[TableWatchedMovies.columnTimestamp] as int? ?? -1,
    );
  }
}
