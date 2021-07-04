import 'package:freezed_annotation/freezed_annotation.dart';

part 'watched_duration.freezed.dart';

@freezed
class WatchedDuration with _$WatchedDuration {
  const factory WatchedDuration({
    required BigInt durationInMillis,
    required DateTime date,
  }) = _WatchedDuration;
}
