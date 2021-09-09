import 'package:json_annotation/json_annotation.dart';

part 'last_series_schema.g.dart';

@JsonSerializable(createToJson: false)
class LastSeriesSchema {
  LastSeriesSchema(this.data);

  factory LastSeriesSchema.fromJson(Map<String, dynamic> json) => _$LastSeriesSchemaFromJson(json);

  final LastSeriesDataSchema? data;
}

@JsonSerializable(createToJson: false)
class LastSeriesDataSchema {
  LastSeriesDataSchema(this.season, this.episode);

  factory LastSeriesDataSchema.fromJson(Map<String, dynamic> json) => _$LastSeriesDataSchemaFromJson(json);

  final int? season;
  final int? episode;
}
