import 'package:movo/src/domain/search/search_results_model.dart';

abstract class IHistoryManager {
  Future<void> saveSearchResult(SearchResult searchResult);
  Future<List<SearchResult>> getSearchHistory();
}
