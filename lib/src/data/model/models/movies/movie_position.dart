import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_position.freezed.dart';

@freezed
class MoviePosition with _$MoviePosition {
  const factory MoviePosition({
    required int movieId,
    required int durationInMillis,
    required int leftAt,
    required bool isTvShow,
    required int season,
    required int episode,
    required int timestamp,
  }) = _MoviePosition;
}
