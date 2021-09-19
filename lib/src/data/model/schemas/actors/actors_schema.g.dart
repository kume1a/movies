// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actors_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActorsSchema _$ActorsSchemaFromJson(Map<String, dynamic> json) => ActorsSchema(
      (json['data'] as List<dynamic>?)
          ?.map((e) => ActorSchema.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['meta'] == null
          ? null
          : MetaSchema.fromJson(json['meta'] as Map<String, dynamic>),
    );
