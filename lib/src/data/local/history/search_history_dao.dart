import '../../model/schemas/search/search_results_model.dart';

abstract class SearchHistoryDao {
  Future<void> saveSearchResult(SearchResult searchResult);
  Future<List<SearchResult>> getSearchHistory();
}
