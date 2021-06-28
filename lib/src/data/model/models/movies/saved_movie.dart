import 'package:freezed_annotation/freezed_annotation.dart';

import 'movie_data.dart';
import 'movie_position.dart';

part 'saved_movie.freezed.dart';

@freezed
class SavedMovie with _$SavedMovie {
  const factory SavedMovie({
    required MoviePosition position,
    required MovieData data,
  }) = _SavedMovie;
}
