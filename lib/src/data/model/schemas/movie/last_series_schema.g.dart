// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'last_series_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LastSeriesSchema _$LastSeriesSchemaFromJson(Map<String, dynamic> json) =>
    LastSeriesSchema(
      json['data'] == null
          ? null
          : LastSeriesDataSchema.fromJson(json['data'] as Map<String, dynamic>),
    );

LastSeriesDataSchema _$LastSeriesDataSchemaFromJson(
        Map<String, dynamic> json) =>
    LastSeriesDataSchema(
      json['season'] as int?,
      json['episode'] as int?,
    );
