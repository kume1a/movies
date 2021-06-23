import 'package:json_annotation/json_annotation.dart';

part 'cover_schema.g.dart';

@JsonSerializable(createToJson: false)
class CoverSchema {
  CoverSchema(this.small, this.large);

  factory CoverSchema.fromJson(Map<String, dynamic> json) => _$CoverSchemaFromJson(json);

  final String? small;
  final String? large;
}
