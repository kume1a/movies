import 'package:json_annotation/json_annotation.dart';

import 'thumbnail_schema.dart';

part 'files_schema.g.dart';

@JsonSerializable(createToJson: false)
class FilesSchema {
  FilesSchema(this.lang, this.files);

  factory FilesSchema.fromJson(Map<String, dynamic> json) => _$FilesSchemaFromJson(json);

  final String? lang;
  final List<FileSchema>? files;
}

@JsonSerializable(createToJson: false)
class FileSchema {
  FileSchema(this.id, this.quality, this.src, this.duration, this.thumbnails);

  factory FileSchema.fromJson(Map<String, dynamic> json) => _$FileSchemaFromJson(json);

  final int? id;
  final String? quality;
  final String? src;
  final int? duration;
  final List<ThumbnailSchema>? thumbnails;
}
