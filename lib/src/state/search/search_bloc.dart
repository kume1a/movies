import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../data/local/search_result/search_result_dao.dart';
import '../../data/local/settings/settings_manager.dart';
import '../../data/model/core/either.dart';
import '../../data/model/core/fetch_failure.dart';
import '../../data/model/core/option.dart';
import '../../data/model/models/search/search_result.dart';
import '../../data/model/models/search/search_results.dart';
import '../../data/network/services/search_service.dart';

part 'search_bloc.freezed.dart';
part 'search_event.dart';
part 'search_state.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc(
    this._searchService,
    this._searchResultDao,
    this._settingsInteractor,
  ) : super(SearchState.initial());

  final SearchService _searchService;
  final SearchResultDao _searchResultDao;
  final SettingsManager _settingsInteractor;

  bool _loading = false;
  int _page = 1;

  @override
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {
    yield* event.map(
      queryChanged: (_QueryChanged e) async* {
        if (e.query.isEmpty) {
          final List<SearchResult> history = await _searchResultDao.getSearchResults();
          final SearchResults savedSearchResults = SearchResults(history, history.length, 1);
          yield state.copyWith(
            query: e.query,
            searchResultsOption: some(savedSearchResults),
          );
        } else {
          if (!_loading && state.query != e.query) {
            _loading = true;
            _page = 1;

            final Either<FetchFailure, SearchResults> searchResults = await _searchService.search(e.query, _page);

            _page++;
            _loading = false;
            yield state.copyWith(
              query: e.query,
              searchResultsOption: searchResults.toOption(),
            );
          }
        }
      },
      nextPageRequested: (_NextPageRequested e) async* {
        if (!_loading) {
          _loading = true;
          final Either<FetchFailure, SearchResults> searchResults = await _searchService.search(state.query, _page);

          state.searchResultsOption.fold(
            () => searchResults,
            (SearchResults previousSearchResults) {
              searchResults.getOrElse(() => SearchResults.empty()).results.insertAll(0, previousSearchResults.results);
              return searchResults;
            },
          );
          _page++;
          _loading = false;
          yield state.copyWith(searchResultsOption: searchResults.toOption());
        }
      },
      searchResultSelected: (_SearchResultSelected e) async* {
        final bool recordSearchHistoryEnabled = await _settingsInteractor.isRecordSearchHistoryEnabled();
        if (recordSearchHistoryEnabled) {
          _searchResultDao.insertSearchResult(e.searchResult);
        }
      },
    );
  }
}
