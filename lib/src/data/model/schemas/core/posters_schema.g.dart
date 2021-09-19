// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posters_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostersSchema _$PostersSchemaFromJson(Map<String, dynamic> json) =>
    PostersSchema(
      json['data'] == null
          ? null
          : PostersDataSchema.fromJson(json['data'] as Map<String, dynamic>),
    );

PostersDataSchema _$PostersDataSchemaFromJson(Map<String, dynamic> json) =>
    PostersDataSchema(
      json['240'] as String?,
      json['blurhash'] as String?,
    );
