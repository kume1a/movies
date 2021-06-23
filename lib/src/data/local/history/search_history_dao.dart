import '../../model/models/search/search_result.dart';

abstract class SearchHistoryDao {
  Future<void> saveSearchResult(SearchResult searchResult);
  Future<List<SearchResult>> getSearchHistory();
}
