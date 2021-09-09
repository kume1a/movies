import 'package:json_annotation/json_annotation.dart';

part 'posters_schema.g.dart';

@JsonSerializable(createToJson: false)
class PostersSchema {
  PostersSchema(this.data);

  factory PostersSchema.fromJson(Map<String, dynamic> json) => _$PostersSchemaFromJson(json);

  final PostersDataSchema? data;
}

@JsonSerializable(createToJson: false)
class PostersDataSchema {
  PostersDataSchema(this.s240, this.blurhash);

  factory PostersDataSchema.fromJson(Map<String, dynamic> json) => _$PostersDataSchemaFromJson(json);

  @JsonKey(name: '240')
  final String? s240;
  final String? blurhash;
}
