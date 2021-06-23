import '../../schemas/actors/actor_schema.dart';
import '../../schemas/actors/actors_schema.dart';
import 'actor.dart';

class Actors {
  Actors._({
    required this.actors,
    required this.totalCount,
    required this.totalPages,
  });

  factory Actors.fromSchema(ActorsSchema schema) {
    final List<Actor> actors = schema.data?.map((ActorSchema e) => Actor.fromSchema(e)).toList() ?? List<Actor>.empty();

    return Actors._(
      actors: actors.cast<Actor>(),
      totalCount: schema.meta?.pagination?.total ?? 0,
      totalPages: schema.meta?.pagination?.totalPages ?? 0,
    );
  }

  factory Actors.empty() {
    return Actors._(actors: List<Actor>.empty(), totalCount: 0, totalPages: 0);
  }

  final List<Actor> actors;
  final int totalCount;
  final int totalPages;
}
