import 'actors_schema.dart';

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

class Actor {
  Actor._({
    required this.id,
    required this.name,
    required this.poster,
    required this.birthDate,
    required this.birthPlace,
  });

  factory Actor.fromSchema(ActorSchema schema) {
    return Actor._(
      id: schema.id ?? 0,
      name: schema.secondaryName ?? schema.originalName ?? schema.primaryName ?? '',
      poster: schema.poster ?? '',
      birthDate: schema.birthDate ?? '',
      birthPlace: schema.birthPlace ?? '',
    );
  }

  final int id;
  final String name;
  final String poster;
  final String birthDate;
  final String birthPlace;
}
