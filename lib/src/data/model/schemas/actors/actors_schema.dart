import 'package:json_annotation/json_annotation.dart';

import '../core/meta_schema.dart';
import 'actor_schema.dart';

part 'actors_schema.g.dart';

@JsonSerializable(createToJson: false)
class ActorsSchema {
  ActorsSchema(this.data, this.meta);

  factory ActorsSchema.fromJson(Map<String, dynamic> json) => _$ActorsSchemaFromJson(json);

  final List<ActorSchema>? data;
  final MetaSchema? meta;
}
