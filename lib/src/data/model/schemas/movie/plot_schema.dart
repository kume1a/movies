import 'package:json_annotation/json_annotation.dart';

part 'plot_schema.g.dart';

@JsonSerializable(createToJson: false)
class PlotsSchema {
  PlotsSchema(this.data);

  factory PlotsSchema.fromJson(Map<String, dynamic> json) => _$PlotsSchemaFromJson(json);

  final List<PlotDataSchema>? data;
}

@JsonSerializable(createToJson: false)
class PlotSchema {
  PlotSchema(this.data);

  factory PlotSchema.fromJson(Map<String, dynamic> json) => _$PlotSchemaFromJson(json);

  final PlotDataSchema? data;
}

@JsonSerializable(createToJson: false)
class PlotDataSchema {
  PlotDataSchema(this.description, this.language);

  factory PlotDataSchema.fromJson(Map<String, dynamic> json) => _$PlotDataSchemaFromJson(json);

  final String? description;
  final String? language;
}