import 'package:freezed_annotation/freezed_annotation.dart';

import '../../tables.dart';

part 'db_saved_movie_genre.freezed.dart';

@freezed
class DBSavedMovieGenre with _$DBSavedMovieGenre {
  const factory DBSavedMovieGenre({
    int? id,
    required int movieId,
    required String genre,
  }) = _DBSavedMovieGenre;

  factory DBSavedMovieGenre.fromMap(Map<String, dynamic> map) {
    return DBSavedMovieGenre(
      id: map[TableSavedMovieGenres.columnId] as int?,
      movieId: map[TableSavedMovieGenres.columnMovieId] as int? ?? -1,
      genre: map[TableSavedMovieGenres.columnGenre] as String? ?? '',
    );
  }
}
