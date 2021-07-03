import 'package:freezed_annotation/freezed_annotation.dart';

part 'watched_movie.freezed.dart';

@freezed
class WatchedMovie with _$WatchedMovie {
  const factory WatchedMovie({
    required int movieId,
    required int watchedDurationInMillis,
    required int durationInMillis,
    required bool isTvShow,
    required int season,
    required int episode,
    DateTime? date,
  }) = _WatchedMovie;
}
