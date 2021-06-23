import 'package:json_annotation/json_annotation.dart';

part 'covers_schema.g.dart';

@JsonSerializable(createToJson: false)
class CoversSchema {
  CoversSchema(this.data);

  factory CoversSchema.fromJson(Map<String, dynamic> json) => _$CoversSchemaFromJson(json);

  final CoversDataSchema? data;
}

@JsonSerializable(createToJson: false)
class CoversDataSchema {
  CoversDataSchema(
    this.s1920,
    this.s1050,
    this.s510,
    this.s367,
    this.s145,
    this.imageHeight,
    this.position,
    this.positionPercentage,
    this.blurhash,
  );

  factory CoversDataSchema.fromJson(Map<String, dynamic> json) => _$CoversDataSchemaFromJson(json);

  @JsonKey(name: '1920')
  final String? s1920;

  @JsonKey(name: '1050')
  final String? s1050;

  @JsonKey(name: '510')
  final String? s510;

  @JsonKey(name: '367')
  final String? s367;

  @JsonKey(name: '145')
  final String? s145;

  final dynamic imageHeight;
  final String? position;
  final String? positionPercentage;
  final String? blurhash;
}
