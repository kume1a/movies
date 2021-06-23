import 'package:json_annotation/json_annotation.dart';

part 'languages_schema.g.dart';

@JsonSerializable(createToJson: false)
class LanguagesSchema {
  LanguagesSchema(this.data);

  factory LanguagesSchema.fromJson(Map<String, dynamic> json) => _$LanguagesSchemaFromJson(json);

  final List<LanguagesDataSchema>? data;
}

@JsonSerializable(createToJson: false)
class LanguagesDataSchema {
  LanguagesDataSchema(
    this.code,
    this.primaryName,
    this.primaryNameTurned,
    this.tertiaryName,
    this.secondaryName,
  );

  factory LanguagesDataSchema.fromJson(Map<String, dynamic> json) => _$LanguagesDataSchemaFromJson(json);

  final String? code;
  final String? primaryName;
  final String? primaryNameTurned;
  final String? tertiaryName;
  final String? secondaryName;
}
