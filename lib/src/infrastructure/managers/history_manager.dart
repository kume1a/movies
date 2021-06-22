import 'package:injectable/injectable.dart';

import '../../data/schemas/search/search_results_model.dart';
import '../../data/services/i_history_manager.dart';
import '../hive_box_holder.dart';

@LazySingleton(as: IHistoryManager)
class HistoryManager implements IHistoryManager {
  HistoryManager(this._boxHolder);

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