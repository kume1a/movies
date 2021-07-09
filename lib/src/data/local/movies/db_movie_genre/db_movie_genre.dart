import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/enums/movie_genre.dart';
import '../../../../core/helpers/enum_to_string.dart';
import '../../tables.dart';

part 'db_movie_genre.freezed.dart';

@freezed
class DBMovieGenre with _$DBMovieGenre {
  const factory DBMovieGenre({
    int? id,
    required int movieId,
    required MovieGenre genre,
  }) = _DBMovieGenre;

  factory DBMovieGenre.fromMap(Map<String, dynamic> map) {
    final String genre = map[TableMovieGenres.columnGenre] as String? ?? '';

    return DBMovieGenre(
      id: map[TableMovieGenres.columnId] as int?,
      movieId: map[TableMovieGenres.columnMovieId] as int? ?? -1,
      genre: EnumToString.fromString(MovieGenre.values, genre)!,
    );
  }
}
