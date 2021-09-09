import 'package:json_annotation/json_annotation.dart';

part 'trailers_schema.g.dart';

@JsonSerializable(createToJson: false)
class TrailersSchema {
  TrailersSchema(this.data);

  factory TrailersSchema.fromJson(Map<String, dynamic> json) => _$TrailersSchemaFromJson(json);

  final List<TrailersDataSchema>? data;
}

@JsonSerializable(createToJson: false)
class TrailersDataSchema {
  TrailersDataSchema(this.id, this.name, this.fileUrl, this.language);

  factory TrailersDataSchema.fromJson(Map<String, dynamic> json) => _$TrailersDataSchemaFromJson(json);

  final int? id;
  final String? name;
  final String? fileUrl;
  final String? language;
}
