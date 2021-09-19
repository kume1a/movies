// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'languages_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LanguagesSchema _$LanguagesSchemaFromJson(Map<String, dynamic> json) =>
    LanguagesSchema(
      (json['data'] as List<dynamic>?)
          ?.map((e) => LanguagesDataSchema.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

LanguagesDataSchema _$LanguagesDataSchemaFromJson(Map<String, dynamic> json) =>
    LanguagesDataSchema(
      json['code'] as String?,
      json['primaryName'] as String?,
      json['primaryNameTurned'] as String?,
      json['tertiaryName'] as String?,
      json['secondaryName'] as String?,
    );
