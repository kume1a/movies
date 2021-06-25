import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/helpers/enum_to_string.dart';
import '../../../model/schemas/core/enums.dart';
import '../../tables.dart';

part 'db_movie_secondary_cover.freezed.dart';

@freezed
class DBMovieSecondaryCover with _$DBMovieSecondaryCover {
  const factory DBMovieSecondaryCover({
    int? id,
    required int movieId,
    required Resolution resolution,
    required String secondaryCover,
  }) = _DBMovieSecondaryCover;

  factory DBMovieSecondaryCover.fromMap(Map<String, dynamic> map) {
    final String resolution = map[TableMovieSecondaryCovers.columnResolution] as String? ?? '';

    return DBMovieSecondaryCover(
      id: map[TableMovieSecondaryCovers.columnId] as int?,
      movieId: map[TableMovieSecondaryCovers.columnMovieId] as int? ?? 01,
      resolution: EnumToString.fromString(Resolution.values, resolution)!,
      secondaryCover: map[TableMovieSecondaryCovers.columnSecondaryCover] as String? ?? '',
    );
  }
}
