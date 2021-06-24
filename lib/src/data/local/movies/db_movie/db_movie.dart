import 'package:freezed_annotation/freezed_annotation.dart';

import '../../tables.dart';

part 'db_movie.freezed.dart';

@freezed
class DBMovie with _$DBMovie {
  const factory DBMovie({
    int? id,
    required int movieId,
    required String name,
    required int year,
    required String imdbUrl,
    required bool isTvShow,
    required int duration,
    required bool canBePlayed,
    required String poster,
    required double imdbRating,
    required int voterCount,
    required String plot,
    required bool isFavorite,
    required int saveTimestamp,
  }) = _DBMovie;

  factory DBMovie.fromMap(Map<String, dynamic> map) {
    return DBMovie(
      id: map[TableDBMovies.columnId] as int?,
      movieId: map[TableDBMovies.columnMovieId] as int? ?? -1,
      name: map[TableDBMovies.columnName] as String? ?? '',
      year: map[TableDBMovies.columnYear] as int? ?? -1,
      imdbUrl: map[TableDBMovies.columnImdbUrl] as String? ?? '',
      isTvShow: map[TableDBMovies.columnIsTvShow] == 1,
      duration: map[TableDBMovies.columnDuration] as int? ?? -1,
      canBePlayed: map[TableDBMovies.columnCanBePlayed] == 1,
      poster: map[TableDBMovies.columnPoster] as String? ?? '',
      imdbRating: map[TableDBMovies.columnImdbRating] as double? ?? -1,
      voterCount: map[TableDBMovies.columnVoterCount] as int? ?? -1,
      plot: map[TableDBMovies.columnPlot] as String? ?? '',
      isFavorite: map[TableDBMovies.columnIsFavorite] == 1,
      saveTimestamp: map[TableDBMovies.columnSaveTimestamp] as int? ?? -1,
    );
  }
}
