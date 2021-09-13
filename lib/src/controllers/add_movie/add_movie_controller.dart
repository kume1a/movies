import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../data/local/favorite_movie/favorite_movie_dao.dart';
import '../../data/model/core/either.dart';
import '../../data/model/core/fetch_failure.dart';
import '../../data/model/models/search/search_result.dart';
import '../../data/model/models/search/search_results.dart';
import '../../data/network/services/search_service.dart';
import '../../ui/core/routes/route_args.dart';

class AddMovieController extends GetxController {
  AddMovieController(
    this._searchService,
    this._favoriteMovieDao,
  );

  final Rxn<SearchResults> searchResults = Rxn<SearchResults>();
  final RxList<int> groupMovieIds = <int>[].obs;

  final SearchService _searchService;
  final FavoriteMovieDao _favoriteMovieDao;

  late final ScrollController scrollController;

  bool _loading = false;
  int _page = 1;

  late int _groupId;
  String _lastQuery = '';

  @override
  Future<void> onInit() async {
    super.onInit();

    scrollController = ScrollController();

    final AddMoviePageArgs args = Get.arguments as AddMoviePageArgs;

    _groupId = args.groupId;

    final List<int> groupMovieIds = await _favoriteMovieDao.getFavoriteMovieIds(_groupId);
    this.groupMovieIds.assignAll(groupMovieIds);
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  Future<void> onQueryChanged(String query) async {
    if (_lastQuery == query) {
      return;
    }

    scrollController.jumpTo(0);
    
    if (query.trim().isEmpty) {
      searchResults.value = SearchResults.empty();
    } else {
      if (!_loading && _lastQuery != query) {
        _loading = true;
        _page = 1;

        final Either<FetchFailure, SearchResults> searchResults = await _searchService.search(query, _page);

        _page++;
        _loading = false;

        this.searchResults.value = searchResults.get;
      }
    }
    _lastQuery = query;
  }

  Future<void> onNextPageRequested() async {
    if (!_loading) {
      _loading = true;
      final Either<FetchFailure, SearchResults> searchResults = await _searchService.search(_lastQuery, _page);

      if (this.searchResults.value != null) {
        searchResults.getOrElse(() => SearchResults.empty()).results.insertAll(0, this.searchResults.value!.results);
      }

      _page++;
      _loading = false;

      this.searchResults.value = searchResults.get;
    }
  }

  Future<void> onAddClicked(SearchResult searchResult) async {
    await _favoriteMovieDao.addMovieToGroup(
      movieId: searchResult.movieId,
      movieNameKa: searchResult.nameKa,
      movieNameEn: searchResult.nameEn,
      groupId: _groupId,
    );

    groupMovieIds.add(searchResult.movieId);
  }

  Future<void> onRemoveClicked(SearchResult searchResult) async {
    await _favoriteMovieDao.deleteFavoriteMovie(searchResult.movieId);

    groupMovieIds.remove(searchResult.movieId);
  }
}
