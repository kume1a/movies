import 'package:json_annotation/json_annotation.dart';

part 'movie_actors_schema.g.dart';

@JsonSerializable(createToJson: false)
class MovieActorsSchema {
  MovieActorsSchema(this.data);

  factory MovieActorsSchema.fromJson(Map<String, dynamic> json) => _$MovieActorsSchemaFromJson(json);

  final List<ActorsDataSchema>? data;
}

@JsonSerializable(createToJson: false)
class ActorsDataSchema {
  ActorsDataSchema(
      this.id,
      this.originalName,
      this.primaryName,
      this.secondaryName,
      this.tertiaryName,
      this.poster,
      this.birthDate,
      this.birthPlace,
      this.deathDate,
      this.deathPlace,
      this.height,
      this.slogan,
      this.zodiacSign,
      );

  factory ActorsDataSchema.fromJson(Map<String, dynamic> json) => _$ActorsDataSchemaFromJson(json);

  final int? id;
  final String? originalName;
  final String? primaryName;
  final String? secondaryName;
  final String? tertiaryName;
  final String? poster;
  final String? birthDate;
  final String? birthPlace;
  final String? deathDate;
  final String? deathPlace;
  final int? height;
  final String? slogan;
  final String? zodiacSign;
}