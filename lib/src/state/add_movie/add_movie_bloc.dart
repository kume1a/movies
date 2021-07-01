import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../data/local/favorite_movie/favorite_movie_dao.dart';
import '../../data/model/core/either.dart';
import '../../data/model/core/fetch_failure.dart';
import '../../data/model/models/search/search_results.dart';
import '../../data/network/services/search_service.dart';

part 'add_movie_bloc.freezed.dart';
part 'add_movie_event.dart';
part 'add_movie_state.dart';

@injectable
class AddMovieBloc extends Bloc<AddMovieEvent, AddMovieState> {
  AddMovieBloc(
    this._searchService,
    this._favoriteMovieDao,
  ) : super(AddMovieState.initial());

  final SearchService _searchService;
  final FavoriteMovieDao _favoriteMovieDao;

  bool _loading = false;
  int _page = 1;

  late int _groupId;
  String _query = '';

  @override
  Stream<AddMovieState> mapEventToState(
    AddMovieEvent event,
  ) async* {
    yield* event.map(
      init: _init,
      queryChanged: _queryChanged,
      nextPageRequested: _nextPageRequested,
      addClicked: _addClicked,
      removeClicked: _removeClicked,
    );
  }

  Stream<AddMovieState> _init(_Init event) async* {
    _groupId = event.groupId;

    final List<int> groupMovieIds = await _favoriteMovieDao.getFavoriteMovieIds(_groupId);
    yield state.copyWith(groupMovieIds: groupMovieIds);
  }

  Stream<AddMovieState> _queryChanged(_QueryChanged event) async* {
    if (!_loading && _query != event.query) {
      _loading = true;
      _page = 1;

      final Either<FetchFailure, SearchResults> searchResults = await _searchService.search(event.query, _page);

      _page++;
      _loading = false;
      _query = event.query;

      yield state.copyWith(searchResults: searchResults.get);
    }
  }

  Stream<AddMovieState> _nextPageRequested(_NextPageRequested event) async* {
    if (!_loading) {
      _loading = true;
      final Either<FetchFailure, SearchResults> searchResults = await _searchService.search(_query, _page);

      if (state.searchResults != null) {
        searchResults.getOrElse(() => SearchResults.empty()).results.insertAll(0, state.searchResults!.results);
      }

      _page++;
      _loading = false;
      yield state.copyWith(searchResults: searchResults.get);
    }
  }

  Stream<AddMovieState> _addClicked(_AddClicked event) async* {
    await _favoriteMovieDao.addMovieToGroup(event.movieId, event.movieName, _groupId);

    final List<int> groupMovieIds = List<int>.of(state.groupMovieIds);
    groupMovieIds.add(event.movieId);
    yield state.copyWith(groupMovieIds: groupMovieIds);
  }

  Stream<AddMovieState> _removeClicked(_RemoveClicked event) async* {
    await _favoriteMovieDao.deleteFavoriteMovie(event.movieId);

    final List<int> groupMovieIds = List<int>.of(state.groupMovieIds);
    groupMovieIds.remove(event.movieId);
    yield state.copyWith(groupMovieIds: groupMovieIds);
  }
}
