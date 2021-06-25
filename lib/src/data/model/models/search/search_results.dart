import '../../schemas/search/search_results_schema.dart';
import 'search_result.dart';

class SearchResults {
  SearchResults(this.results, this.totalCount, this.totalPages);

  factory SearchResults.fromSchema(SearchResultsSchema schema) {
    final List<SearchResult> searchResults = schema.data
        ?.map((SearchResultSchema elementSchema) => SearchResult.fromSchema(elementSchema))
        .toList() ?? List<SearchResult>.empty();

    return SearchResults(
      searchResults,
      schema.meta?.pagination?.total ?? 0,
      schema.meta?.pagination?.totalPages ?? 0,
    );
  }

  factory SearchResults.empty() {
    return SearchResults(List<SearchResult>.empty(), 0, 0);
  }

  final List<SearchResult> results;
  final int totalCount;
  final int totalPages;
}
