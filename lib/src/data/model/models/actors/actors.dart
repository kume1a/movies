import 'package:freezed_annotation/freezed_annotation.dart';

import '../../schemas/actors/actor_schema.dart';
import '../../schemas/actors/actors_schema.dart';
import 'actor.dart';

part 'actors.freezed.dart';

@freezed
class Actors with _$Actors {
  const factory Actors({
    required List<Actor> actors,
    required int totalCount,
    required int totalPages,
  }) = _Actors;

  factory Actors.fromSchema(ActorsSchema schema) {
    final List<Actor> actors = schema.data?.map((ActorSchema e) => Actor.fromSchema(e)).toList() ?? List<Actor>.empty();

    return Actors(
      actors: actors,
      totalCount: schema.meta?.pagination?.total ?? 0,
      totalPages: schema.meta?.pagination?.totalPages ?? 0,
    );
  }

  factory Actors.empty() {
    return Actors(
      actors: List<Actor>.empty(),
      totalCount: 0,
      totalPages: 0,
    );
  }
}
