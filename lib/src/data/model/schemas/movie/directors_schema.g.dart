// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'directors_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DirectorsSchema _$DirectorsSchemaFromJson(Map<String, dynamic> json) =>
    DirectorsSchema(
      (json['data'] as List<dynamic>?)
          ?.map((e) => DirectorsDataSchema.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

DirectorsDataSchema _$DirectorsDataSchemaFromJson(Map<String, dynamic> json) =>
    DirectorsDataSchema(
      json['id'] as int?,
      json['originalName'] as String?,
      json['primaryName'] as String?,
      json['secondaryName'] as String?,
      json['tertiaryName'] as String?,
      json['poster'] as String?,
      json['birthDate'] as String?,
      json['birthPlace'] as String?,
      json['deathDate'] as String?,
      json['deathPlace'] as String?,
      json['height'] as int?,
      json['slogan'] as String?,
      json['zodiacSign'] as String?,
    );
