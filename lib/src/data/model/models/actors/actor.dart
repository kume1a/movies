import '../../schemas/actors/actor_schema.dart';

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
