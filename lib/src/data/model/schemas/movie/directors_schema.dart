import 'package:json_annotation/json_annotation.dart';

part 'directors_schema.g.dart';

@JsonSerializable(createToJson: false)
class DirectorsSchema {
  DirectorsSchema(this.data);

  factory DirectorsSchema.fromJson(Map<String, dynamic> json) => _$DirectorsSchemaFromJson(json);

  final List<DirectorsDataSchema>? data;
}

@JsonSerializable(createToJson: false)
class DirectorsDataSchema {
  DirectorsDataSchema(
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

  factory DirectorsDataSchema.fromJson(Map<String, dynamic> json) =>
      _$DirectorsDataSchemaFromJson(json);

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
