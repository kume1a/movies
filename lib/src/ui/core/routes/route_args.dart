import 'package:freezed_annotation/freezed_annotation.dart';

part 'route_args.freezed.dart';

@freezed
class DetailsPageArgs with _$DetailsPageArgs {
  const factory DetailsPageArgs({
    required int movieId,
  }) = _DetailsPageArgs;
}

@freezed
class StreamPageArgs with _$StreamPageArgs {
  const factory StreamPageArgs({
    required int movieId,
    required int season,
    required int episode,
    required Duration startAt,
  }) = _StreamPageArgs;
}

@freezed
class MovieGroupPageArgs with _$MovieGroupPageArgs {
  const factory MovieGroupPageArgs({
    required int groupId,
  }) = _MovieGroupPageArgs;
}
