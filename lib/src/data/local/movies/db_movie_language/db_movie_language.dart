import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/helpers/enum_to_string.dart';
import '../../../model/schemas/core/enums.dart';
import '../../tables.dart';

part 'db_movie_language.freezed.dart';

@freezed
class DBMovieLanguage with _$DBMovieLanguage {
  const factory DBMovieLanguage({
    int? id,
    required int movieId,
    required Language language,
  }) = _DBMovieLanguage;

  factory DBMovieLanguage.fromMap(Map<String, dynamic> map) {
    final String language = map[TableMovieLanguages.columnLanguage] as String? ?? '';

    return DBMovieLanguage(
      id: map[TableMovieLanguages.columnId] as int?,
      movieId: map[TableMovieLanguages.columnMovieId] as int? ?? -1,
      language: EnumToString.fromString(Language.values, language)!,
    );
  }
}
