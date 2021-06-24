import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/helpers/enum_to_string.dart';
import '../../../model/schemas/core/enums.dart';
import '../../tables.dart';

part 'movie_language.freezed.dart';

@freezed
class MovieLanguage with _$MovieLanguage {
  const factory MovieLanguage({
    int? id,
    required int movieId,
    required Language language,
  }) = _MovieLanguage;

  factory MovieLanguage.fromMap(Map<String, dynamic> map) {
    final String language = map[TableMovieLanguages.columnLanguage] as String? ?? '';
    return MovieLanguage(
      id: map[TableMovieLanguages.columnId] as int?,
      movieId: map[TableMovieLanguages.columnMovieId] as int? ?? -1,
      language: EnumToString.fromString(Language.values, language)!,
    );
  }
}
