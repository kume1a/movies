import 'package:freezed_annotation/freezed_annotation.dart';

import '../../schemas/actors/actor_schema.dart';

part 'actor.freezed.dart';

@freezed
class Actor with _$Actor {
  const factory Actor({
    required int id,
    required String name,
    required String poster,
    required String birthDate,
    required String birthPlace,
  }) = _Actor;

  factory Actor.fromSchema(ActorSchema schema) {
    return Actor(
      id: schema.id ?? 0,
      name: schema.secondaryName ?? schema.originalName ?? schema.primaryName ?? '',
      poster: schema.poster ?? '',
      birthDate: schema.birthDate ?? '',
      birthPlace: schema.birthPlace ?? '',
    );
  }
}
