import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/enums/movie_genre.dart';
import '../../../../core/helpers/enum_to_string.dart';

import '../../tables.dart';

part 'db_saved_movie_genre.freezed.dart';

@freezed
class DBSavedMovieGenre with _$DBSavedMovieGenre {
  const factory DBSavedMovieGenre({
    int? id,
    required int movieId,
    required MovieGenre genre,
  }) = _DBSavedMovieGenre;

  factory DBSavedMovieGenre.fromMap(Map<String, dynamic> map) {
    final String genre = map[TableSavedMovieGenres.columnGenre] as String? ?? '';

    return DBSavedMovieGenre(
      id: map[TableSavedMovieGenres.columnId] as int?,
      movieId: map[TableSavedMovieGenres.columnMovieId] as int? ?? -1,
      genre: EnumToString.fromString(MovieGenre.values, genre)!,
    );
  }
}
