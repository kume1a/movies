import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/helpers/enum_to_string.dart';
import '../../../model/schemas/core/enums.dart';
import '../../tables.dart';

part 'movie_trailer.freezed.dart';

@freezed
class MovieTrailer with _$MovieTrailer {
  const factory MovieTrailer({
    int? id,
    required int movieId,
    required Language language,
    required String trailerUrl,
  }) = _MovieTrailer;

  factory MovieTrailer.fromMap(Map<String, dynamic> map) {
    final String language = map[TableMovieTrailers.columnLanguage] as String? ?? '';

    return MovieTrailer(
      id: map[TableMovieTrailers.columnId] as int?,
      movieId: map[TableMovieTrailers.columnMovieId] as int? ?? -1,
      language: EnumToString.fromString(Language.values, language)!,
      trailerUrl: map[TableMovieTrailers.columnTrailerUrl] as String? ?? '',
    );
  }
}
