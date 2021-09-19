// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MetaSchema _$MetaSchemaFromJson(Map<String, dynamic> json) => MetaSchema(
      json['pagination'] == null
          ? null
          : PaginationSchema.fromJson(
              json['pagination'] as Map<String, dynamic>),
    );

PaginationSchema _$PaginationSchemaFromJson(Map<String, dynamic> json) =>
    PaginationSchema(
      json['total'] as int?,
      json['count'] as int?,
      json['per_page'] as int?,
      json['current_page'] as int?,
      json['total_pages'] as int?,
      json['links'] == null
          ? null
          : LinksSchema.fromJson(json['links'] as Map<String, dynamic>),
    );

LinksSchema _$LinksSchemaFromJson(Map<String, dynamic> json) => LinksSchema(
      json['next'] as String?,
      json['previous'] as String?,
    );
