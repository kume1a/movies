// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trailers_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrailersSchema _$TrailersSchemaFromJson(Map<String, dynamic> json) =>
    TrailersSchema(
      (json['data'] as List<dynamic>?)
          ?.map((e) => TrailersDataSchema.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

TrailersDataSchema _$TrailersDataSchemaFromJson(Map<String, dynamic> json) =>
    TrailersDataSchema(
      json['id'] as int?,
      json['name'] as String?,
      json['fileUrl'] as String?,
      json['language'] as String?,
    );
