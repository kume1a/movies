// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'countries_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountriesSchema _$CountriesSchemaFromJson(Map<String, dynamic> json) =>
    CountriesSchema(
      (json['data'] as List<dynamic>?)
          ?.map((e) => CountriesDataSchema.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

CountriesDataSchema _$CountriesDataSchemaFromJson(Map<String, dynamic> json) =>
    CountriesDataSchema(
      json['id'] as int?,
      json['primaryName'] as String?,
      json['secondaryName'] as String?,
      json['tertiaryName'] as String?,
    );
