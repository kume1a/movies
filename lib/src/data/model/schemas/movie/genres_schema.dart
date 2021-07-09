import 'package:json_annotation/json_annotation.dart';

part 'genres_schema.g.dart';

@JsonSerializable(createToJson: false)
class GenresSchema {
  GenresSchema(this.data);

  factory GenresSchema.fromJson(Map<String, dynamic> json) => _$GenresSchemaFromJson(json);

  final List<GenresDataSchema>? data;

  @override
  String toString() => 'GenresSchema{data: $data}';
}

@JsonSerializable(createToJson: false)
class GenresDataSchema {
  GenresDataSchema(
    this.id,
    this.primaryName,
    this.secondaryName,
    this.tertiaryName,
    this.backgroundImage,
  );

  factory GenresDataSchema.fromJson(Map<String, dynamic> json) => _$GenresDataSchemaFromJson(json);

  final int? id;
  final String? primaryName;
  final String? secondaryName;
  final String? tertiaryName;
  final String? backgroundImage;

  @override
  String toString() =>
      'GenresDataSchema{id: $id, primaryName: $primaryName, secondaryName: $secondaryName, tertiaryName: $tertiaryName, backgroundImage: $backgroundImage}';
}
