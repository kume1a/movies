import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/enums/search_type.dart';
import '../../../../core/helpers/enum_to_string.dart';
import '../../../local/tables.dart';
import '../../schemas/core/type_mappers.dart';
import '../../schemas/search/search_results_schema.dart';

part 'search_result.freezed.dart';

@freezed
class SearchResult with _$SearchResult {
  const factory SearchResult({
    required int id,
    required SearchType type,
    required int movieId,
    required String nameKa,
    required String nameEn,
    required String descriptionKa,
    required String descriptionEn,
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
      nameKa: schema.primaryName ?? schema.originalName ?? schema.primaryName ?? '',
      nameEn: schema.secondaryName ?? schema.originalName ?? '',
      descriptionKa: schema.secondaryDescription ?? schema.primaryDescription ?? '',
      descriptionEn: schema.primaryDescription ?? schema.secondaryDescription ?? '',
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
      nameKa: map[TableSearchResults.columnNameKa] as String? ?? '',
      nameEn: map[TableSearchResults.columnNameEn] as String? ?? '',
      descriptionKa: map[TableSearchResults.columnDescriptionKa] as String? ?? '',
      descriptionEn: map[TableSearchResults.columnDescriptionEn] as String? ?? '',
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
