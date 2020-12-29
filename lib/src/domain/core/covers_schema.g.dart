// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'covers_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoversSchema _$CoversSchemaFromJson(Map<String, dynamic> json) {
  return CoversSchema(
    json['data'] == null
        ? null
        : CoversDataSchema.fromJson(json['data'] as Map<String, dynamic>),
  );
}

CoversDataSchema _$CoversDataSchemaFromJson(Map<String, dynamic> json) {
  return CoversDataSchema(
    json['1920'] as String,
    json['1050'] as String,
    json['510'] as String,
    json['367'] as String,
    json['145'] as String,
    json['imageHeight'],
    json['position'] as String,
    json['positionPercentage'] as String,
    json['blurhash'] as String,
  );
}
