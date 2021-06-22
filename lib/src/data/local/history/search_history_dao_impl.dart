import 'package:injectable/injectable.dart';

import '../../model/schemas/search/search_results_model.dart';
import '../hive_box_holder.dart';
import 'search_history_dao.dart';

@LazySingleton(as: SearchHistoryDao)
class SearchHistoryDaoImpl implements SearchHistoryDao {
  SearchHistoryDaoImpl(this._boxHolder);

  final HiveBoxHolder _boxHolder;

  @override
  Future<void> saveSearchResult(SearchResult searchResult) async {
    await _boxHolder.searchHistory.put(searchResult.id, searchResult);
  }

  @override
  Future<List<SearchResult>> getSearchHistory() async {
    final List<SearchResult> history = _boxHolder.searchHistory.values.toList();
    history.sort((SearchResult a, SearchResult b) => a.timestamp.compareTo(b.timestamp) * -1);
    return history;
  }
}