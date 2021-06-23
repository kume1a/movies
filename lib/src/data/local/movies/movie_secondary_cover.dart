import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/helpers/enum_to_string.dart';
import '../../model/schemas/core/enums.dart';
import '../tables.dart';

part 'movie_secondary_cover.freezed.dart';

@freezed
class MovieSecondaryCover with _$MovieSecondaryCover {
  const factory MovieSecondaryCover({
    required int id,
    required int movieId,
    required Resolution resolution,
    required String secondaryCover,
  }) = _MovieSecondaryCover;

  factory MovieSecondaryCover.fromMap(Map<String, dynamic> map) {
    final String resolution = map[TableMovieSecondaryCovers.columnResolution] as String? ?? '';

    return MovieSecondaryCover(
      id: map[TableMovieSecondaryCovers.columnId] as int? ?? -1,
      movieId: map[TableMovieSecondaryCovers.columnMovieId] as int? ?? 01,
      resolution: EnumToString.fromString(Resolution.values, resolution)!,
      secondaryCover: map[TableMovieSecondaryCovers.columnSecondaryCover] as String? ?? '',
    );
  }
}
