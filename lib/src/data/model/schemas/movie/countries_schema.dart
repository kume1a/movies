import 'package:json_annotation/json_annotation.dart';

part 'countries_schema.g.dart';

@JsonSerializable(createToJson: false)
class CountriesSchema {
  CountriesSchema(this.data);

  factory CountriesSchema.fromJson(Map<String, dynamic> json) => _$CountriesSchemaFromJson(json);

  final List<CountriesDataSchema>? data;
}

@JsonSerializable(createToJson: false)
class CountriesDataSchema {
  CountriesDataSchema(this.id, this.primaryName, this.secondaryName, this.tertiaryName);

  factory CountriesDataSchema.fromJson(Map<String, dynamic> json) => _$CountriesDataSchemaFromJson(json);

  final int? id;
  final String? primaryName;
  final String? secondaryName;
  final String? tertiaryName;
}
