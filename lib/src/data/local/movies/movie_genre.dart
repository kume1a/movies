import 'package:freezed_annotation/freezed_annotation.dart';

import '../tables.dart';

part 'movie_genre.freezed.dart';

@freezed
class MovieGenre with _$MovieGenre {
  const factory MovieGenre({
    required int id,
    required int movieId,
    required String genre,
  }) = _MovieGenre;

  factory MovieGenre.fromMap(Map<String, dynamic> map) {
    return MovieGenre(
      id: map[TableMovieGenres.columnId] as int? ?? -1,
      movieId: map[TableMovieGenres.columnMovieId] as int? ?? -1,
      genre: map[TableMovieGenres.columnGenre] as String? ?? '',
    );
  }
}
