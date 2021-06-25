import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/helpers/enum_to_string.dart';
import '../../../model/schemas/core/enums.dart';
import '../../tables.dart';

part 'db_movie_trailer.freezed.dart';

@freezed
class DBMovieTrailer with _$DBMovieTrailer {
  const factory DBMovieTrailer({
    int? id,
    required int movieId,
    required Language language,
    required String trailerUrl,
  }) = _DBMovieTrailer;

  factory DBMovieTrailer.fromMap(Map<String, dynamic> map) {
    final String language = map[TableMovieTrailers.columnLanguage] as String? ?? '';

    return DBMovieTrailer(
      id: map[TableMovieTrailers.columnId] as int?,
      movieId: map[TableMovieTrailers.columnMovieId] as int? ?? -1,
      language: EnumToString.fromString(Language.values, language)!,
      trailerUrl: map[TableMovieTrailers.columnTrailerUrl] as String? ?? '',
    );
  }
}
