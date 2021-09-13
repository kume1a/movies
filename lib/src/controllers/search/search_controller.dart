import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../data/local/preferences/settings_helper.dart';
import '../../data/local/search_result/search_result_dao.dart';
import '../../data/model/core/either.dart';
import '../../data/model/core/fetch_failure.dart';
import '../../data/model/models/search/search_result.dart';
import '../../data/model/models/search/search_results.dart';
import '../../data/network/services/search_service.dart';
import '../../ui/core/routes/screens_navigator.dart';

class SearchController extends GetxController {
  SearchController(
    this._searchService,
    this._searchResultDao,
    this._settingsHelper,
  );

  final SearchService _searchService;
  final SearchResultDao _searchResultDao;
  final SettingsHelper _settingsHelper;

  final Rxn<SearchResults> searchResults = Rxn<SearchResults>();

  late final ScrollController scrollController;

  String _lastQuery = '';
  bool _loading = false;
  int _page = 1;

  @override
  void onInit() {
    super.onInit();

    scrollController = ScrollController();
  }

  @override
  void onClose() {
    super.onClose();
    scrollController.dispose();
  }

  Future<void> onQueryChanged(String query) async {
    if (scrollController.hasClients) {
      scrollController.jumpTo(0);
    }

    if (query.isEmpty) {
      final List<SearchResult> history = await _searchResultDao.getSearchResults();
      final SearchResults savedSearchResults = SearchResults(
        results: history,
        totalCount: history.length,
        totalPages: 1,
      );

      _lastQuery = query;
      searchResults.value = savedSearchResults;
    } else {
      if (!_loading && _lastQuery != query) {
        _loading = true;
        _page = 1;

        final Either<FetchFailure, SearchResults> searchResults = await _searchService.search(query, _page);

        _page++;
        _loading = false;

        _lastQuery = query;
        this.searchResults.value = searchResults.get;
      }
    }
  }

  Future<void> onNextPageRequested() async {
    if (_loading) {
      return;
    }

    _loading = true;
    final Either<FetchFailure, SearchResults> searchResults = await _searchService.search(_lastQuery, _page);

    if (this.searchResults.value != null) {
      searchResults.getOrElse(() => SearchResults.empty()).results.insertAll(0, this.searchResults.value!.results);
    }

    _page++;
    _loading = false;

    this.searchResults.value = searchResults.get;
  }

  Future<void> onSearchResultSelected(SearchResult searchResult) async {
    final bool recordSearchHistoryEnabled = await _settingsHelper.isRecordSearchHistoryEnabled();
    if (recordSearchHistoryEnabled) {
      _searchResultDao.insertSearchResult(searchResult);
    }

    ScreensNavigator.pushDetailsPage(searchResult.movieId);
  }
}
