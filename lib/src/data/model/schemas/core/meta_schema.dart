import 'package:json_annotation/json_annotation.dart';

part 'meta_schema.g.dart';

@JsonSerializable(createToJson: false)
class MetaSchema {
  MetaSchema(this.pagination);

  factory MetaSchema.fromJson(Map<String, dynamic> json) => _$MetaSchemaFromJson(json);

  final PaginationSchema? pagination;
}

@JsonSerializable(createToJson: false)
class PaginationSchema {
  PaginationSchema(
    this.total,
    this.count,
    this.perPage,
    this.currentPage,
    this.totalPages,
    this.links,
  );

  factory PaginationSchema.fromJson(Map<String, dynamic> json) => _$PaginationSchemaFromJson(json);

  final int? total;
  final int? count;

  @JsonKey(name: 'per_page')
  final int? perPage;

  @JsonKey(name: 'current_page')
  final int? currentPage;

  @JsonKey(name: 'total_pages')
  final int? totalPages;
  final LinksSchema? links;
}

@JsonSerializable(createToJson: false)
class LinksSchema {
  LinksSchema(this.next, this.previous);

  factory LinksSchema.fromJson(Map<String, dynamic> json) => _$LinksSchemaFromJson(json);

  final String? next;
  final String? previous;
}
