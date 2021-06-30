import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_group.freezed.dart';

@freezed
class MovieGroup with _$MovieGroup {
  const factory MovieGroup({
    required int groupId,
    required String name,
    required List<String> movieNames,
  }) = _MovieGroup;
}
