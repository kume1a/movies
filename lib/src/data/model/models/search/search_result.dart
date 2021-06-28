import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/helpers/enum_to_string.dart';
import '../../../local/tables.dart';
import '../../schemas/core/enums.dart';
import '../../schemas/core/type_mappers.dart';
import '../../schemas/search/search_results_schema.dart';

part 'search_result.freezed.dart';

@freezed
class SearchResult with _$SearchResult {
  const factory SearchResult({
    required int id,
    required SearchType type,
    required int movieId,
    required String name,
    required String description,
    required String poster,
    required String secondaryPoster,
    required bool isTvShow,
    required int timestamp,
  }) = _SearchResult;

  const SearchResult._();

  factory SearchResult.fromSchema(SearchResultSchema schema) {
    return SearchResult(
      id: schema.id ?? 0,
      type: getSearchType(schema.type),
      movieId: schema.adjaraId ?? 0,
      name: schema.secondaryName ?? schema.originalName ?? schema.primaryName ?? '',
      description: schema.primaryDescription ?? schema.secondaryDescription ?? schema.tertiaryDescription ?? '',
      poster: schema.posters?.data?.s240 ?? '',
      secondaryPoster: schema.poster ?? '',
      isTvShow: schema.isTvShow ?? false,
      timestamp: DateTime.now().millisecondsSinceEpoch,
    );
  }

  factory SearchResult.fromMap(Map<String, dynamic> map) {
    final String searchType = map[TableSearchResults.columnSearchType] as String? ?? '';

    return SearchResult(
      id: map[TableSearchResults.columnId] as int? ?? -1,
      type: EnumToString.fromString(SearchType.values, searchType)!,
      movieId: map[TableSearchResults.columnMovieId] as int? ?? -1,
      name: map[TableSearchResults.columnName] as String? ?? '',
      description: map[TableSearchResults.columnDescription] as String? ?? '',
      poster: map[TableSearchResults.columnPoster] as String? ?? '',
      secondaryPoster: map[TableSearchResults.columnSecondaryPoster] as String? ?? '',
      isTvShow: map[TableSearchResults.columnIsTvShow] == 1,
      timestamp: map[TableSearchResults.columnTimestamp] as int? ?? -1,
    );
  }

  String get image => <String>[poster, secondaryPoster].firstWhere(
        (String e) => e.isNotEmpty,
        orElse: () => '',
      );
}
