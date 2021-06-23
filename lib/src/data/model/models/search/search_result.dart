import 'package:hive/hive.dart';

import '../../../local/hive_box_holder.dart';
import '../../schemas/core/enums.dart';
import '../../schemas/core/type_mappers.dart';
import '../../schemas/search/search_results_schema.dart';

part 'search_result.g.dart';

@HiveType(typeId: HiveTypeIdHolder.searchResultId)
class SearchResult {
  SearchResult({
    required this.id,
    required this.type,
    required this.movieId,
    required this.name,
    required this.description,
    required this.poster,
    required this.secondaryPoster,
    required this.isTvShow,
    required this.timestamp,
  });

  factory SearchResult.fromSchema(SearchResultSchema schema) {
    return SearchResult(
      id: schema.id ?? 0,
      type: getSearchType(schema.type),
      movieId: schema.adjaraId ?? 0,
      name: schema.secondaryName ?? schema.originalName ?? schema.primaryName ?? '',
      description: schema.primaryDescription ??
          schema.secondaryDescription ??
          schema.tertiaryDescription ??
          '',
      poster: schema.posters?.data?.s240 ?? '',
      secondaryPoster: schema.poster ?? '',
      isTvShow: schema.isTvShow ?? false,
      timestamp: DateTime
          .now()
          .millisecondsSinceEpoch,
    );
  }

  @HiveField(0)
  final int id;

  @HiveField(1)
  final SearchType type;

  @HiveField(2)
  final int movieId;

  @HiveField(3)
  final String name;

  @HiveField(4)
  final String description;

  @HiveField(5)
  final String poster;

  @HiveField(6)
  final String secondaryPoster;

  @HiveField(7)
  final bool isTvShow;

  @HiveField(8)
  final int timestamp;

  String get image =>
      <String>[poster, secondaryPoster].firstWhere(
            (String e) => e.isNotEmpty,
        orElse: () => '',
      );

  @override
  String toString() {
    return 'SearchResult{id: $id, type: $type, movieId: $movieId, name: $name, description: $description, poster: $poster, secondaryPoster: $secondaryPoster, isTvShow: $isTvShow, timestamp: $timestamp}';
  }
}
