// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plot_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlotsSchema _$PlotsSchemaFromJson(Map<String, dynamic> json) => PlotsSchema(
      (json['data'] as List<dynamic>?)
          ?.map((e) => PlotDataSchema.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

PlotSchema _$PlotSchemaFromJson(Map<String, dynamic> json) => PlotSchema(
      json['data'] == null
          ? null
          : PlotDataSchema.fromJson(json['data'] as Map<String, dynamic>),
    );

PlotDataSchema _$PlotDataSchemaFromJson(Map<String, dynamic> json) =>
    PlotDataSchema(
      json['description'] as String?,
      json['language'] as String?,
    );
