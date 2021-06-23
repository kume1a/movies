import 'package:json_annotation/json_annotation.dart';

part 'thumbnail_schema.g.dart';

@JsonSerializable(createToJson: false)
class ThumbnailSchema {
  ThumbnailSchema(
      this.id,
      this.url,
      this.startTime,
      this.endTime,
      this.duration,
      this.interval,
      this.width,
      this.height,
      this.columns,
      );

  factory ThumbnailSchema.fromJson(Map<String, dynamic> json) => _$ThumbnailSchemaFromJson(json);

  final int? id;
  final String? url;
  @JsonKey(name: 'start_time')
  final int? startTime;
  @JsonKey(name: 'end_time')
  final int? endTime;
  final int? duration;
  final int? interval;
  final int? width;
  final int? height;
  final int? columns;
}
