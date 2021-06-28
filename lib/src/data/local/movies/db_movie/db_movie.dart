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
  }) = _DBMovie;

  factory DBMovie.fromMap(Map<String, dynamic> map) {
    return DBMovie(
      id: map[TableMovies.columnId] as int?,
      movieId: map[TableMovies.columnMovieId] as int? ?? -1,
      name: map[TableMovies.columnName] as String? ?? '',
      year: map[TableMovies.columnYear] as int? ?? -1,
      imdbUrl: map[TableMovies.columnImdbUrl] as String? ?? '',
      isTvShow: map[TableMovies.columnIsTvShow] == 1,
      duration: map[TableMovies.columnDuration] as int? ?? -1,
      canBePlayed: map[TableMovies.columnCanBePlayed] == 1,
      poster: map[TableMovies.columnPoster] as String? ?? '',
      imdbRating: map[TableMovies.columnImdbRating] as double? ?? -1,
      voterCount: map[TableMovies.columnVoterCount] as int? ?? -1,
      plot: map[TableMovies.columnPlot] as String? ?? '',
    );
  }
}
