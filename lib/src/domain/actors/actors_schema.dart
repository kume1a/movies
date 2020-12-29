import 'package:json_annotation/json_annotation.dart';

part 'actors_schema.g.dart';

@JsonSerializable(createToJson: false)
class ActorsSchema {
  final List<ActorSchema> data;
  final MetaSchema meta;

  ActorsSchema(this.data, this.meta);

  factory ActorsSchema.fromJson(Map<String, dynamic> json) => _$ActorsSchemaFromJson(json);
}

@JsonSerializable(createToJson: false)
class ActorSchema {
  final int id;
  final String originalName;
  final String primaryName;
  final String secondaryName;
  final String tertiaryName;
  final String poster;
  final String birthDate;
  final String birthPlace;
  final String deathDate;
  final String deathPlace;
  final int height;
  final String slogan;
  final String zodiacSign;

  ActorSchema(
    this.id,
    this.originalName,
    this.primaryName,
    this.secondaryName,
    this.tertiaryName,
    this.poster,
    this.birthDate,
    this.birthPlace,
    this.deathDate,
    this.deathPlace,
    this.height,
    this.slogan,
    this.zodiacSign,
  );

  factory ActorSchema.fromJson(Map<String, dynamic> json) => _$ActorSchemaFromJson(json);
}

@JsonSerializable(createToJson: false)
class MetaSchema {
  final PaginationSchema pagination;

  MetaSchema(this.pagination);

  factory MetaSchema.fromJson(Map<String, dynamic> json) => _$MetaSchemaFromJson(json);
}

@JsonSerializable(createToJson: false)
class PaginationSchema {
  final int total;
  final int count;

  @JsonKey(name: 'per_page')
  final int perPage;

  @JsonKey(name: 'current_page')
  final int currentPage;

  @JsonKey(name: 'total_pages')
  final int totalPages;
  final LinksSchema links;

  PaginationSchema(
    this.total,
    this.count,
    this.perPage,
    this.currentPage,
    this.totalPages,
    this.links,
  );

  factory PaginationSchema.fromJson(Map<String, dynamic> json) => _$PaginationSchemaFromJson(json);
}

@JsonSerializable(createToJson: false)
class LinksSchema {
  final String next;
  final String previous;

  LinksSchema(this.next, this.previous);

  factory LinksSchema.fromJson(Map<String, dynamic> json) => _$LinksSchemaFromJson(json);
}
