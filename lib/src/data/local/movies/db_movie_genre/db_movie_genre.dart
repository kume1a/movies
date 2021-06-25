import 'package:freezed_annotation/freezed_annotation.dart';

import '../../tables.dart';

part 'db_movie_genre.freezed.dart';

@freezed
class DBMovieGenre with _$DBMovieGenre {
  const factory DBMovieGenre({
    int? id,
    required int movieId,
    required String genre,
  }) = _DBMovieGenre;

  factory DBMovieGenre.fromMap(Map<String, dynamic> map) {
    return DBMovieGenre(
      id: map[TableMovieGenres.columnId] as int?,
      movieId: map[TableMovieGenres.columnMovieId] as int? ?? -1,
      genre: map[TableMovieGenres.columnGenre] as String? ?? '',
    );
  }
}
