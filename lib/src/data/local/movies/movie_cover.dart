import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/helpers/enum_to_string.dart';
import '../../model/schemas/core/enums.dart';
import '../tables.dart';

part 'movie_cover.freezed.dart';

@freezed
class MovieCover with _$MovieCover {
  const factory MovieCover({
    required int id,
    required int movieId,
    required ImageSize imageSize,
    required String cover,
  }) = _MovieCover;

  factory MovieCover.fromMap(Map<String, dynamic> map) {
    final String imageSize = map[TableMovieCovers.columnImageSize] as String? ?? '';

    return MovieCover(
      id: map[TableMovieCovers.columnId] as int? ?? -1,
      movieId: map[TableMovieCovers.columnMovieId] as int? ?? -1,
      imageSize: EnumToString.fromString(ImageSize.values, imageSize)!,
      cover: map[TableMovieCovers.columnCover] as String? ?? '',
    );
  }
}
