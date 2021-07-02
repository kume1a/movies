import 'package:freezed_annotation/freezed_annotation.dart';

import '../../schemas/search/search_results_schema.dart';
import 'search_result.dart';

part 'search_results.freezed.dart';

@freezed
class SearchResults with _$SearchResults {
  const factory SearchResults({
    required List<SearchResult> results,
    required int totalCount,
    required int totalPages,
  }) = _SearchResults;

  factory SearchResults.fromSchema(SearchResultsSchema schema) {
    final List<SearchResult> searchResults =
        schema.data?.map((SearchResultSchema elementSchema) => SearchResult.fromSchema(elementSchema)).toList() ??
            List<SearchResult>.empty();

    return SearchResults(
      results: searchResults,
      totalCount: schema.meta?.pagination?.total ?? 0,
      totalPages: schema.meta?.pagination?.totalPages ?? 0,
    );
  }

  factory SearchResults.empty() {
    return SearchResults(
      results: List<SearchResult>.empty(growable: true),
      totalCount: 0,
      totalPages: 0,
    );
  }
}
