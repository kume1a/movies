import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/helpers/enum_to_string.dart';
import '../../../model/schemas/core/enums.dart';
import '../../tables.dart';

part 'db_movie_cover.freezed.dart';

@freezed
class DBMovieCover with _$DBMovieCover {
  const factory DBMovieCover({
    int? id,
    required int movieId,
    required ImageSize imageSize,
    required String cover,
  }) = _DBMovieCover;

  factory DBMovieCover.fromMap(Map<String, dynamic> map) {
    final String imageSize = map[TableMovieCovers.columnImageSize] as String? ?? '';

    return DBMovieCover(
      id: map[TableMovieCovers.columnId] as int?,
      movieId: map[TableMovieCovers.columnMovieId] as int? ?? -1,
      imageSize: EnumToString.fromString(ImageSize.values, imageSize)!,
      cover: map[TableMovieCovers.columnCover] as String? ?? '',
    );
  }
}
