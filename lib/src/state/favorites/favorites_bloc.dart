import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../core/enums/favorites_page_state.dart';
import '../../data/local/favorite_movie/favorite_movie_dao.dart';
import '../../data/local/movie_group/movie_group_dao.dart';
import '../../data/local/preferences/preferences_helper.dart';
import '../../data/model/models/movie_groups/movie_group.dart';
import '../../data/model/models/movies/movie_data.dart';

part 'favorites_bloc.freezed.dart';
part 'favorites_event.dart';
part 'favorites_state.dart';

@injectable
class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc(
    this._favoriteMovieDao,
    this._movieGroupDao,
    this._preferencesHelper,
  ) : super(FavoritesState.initial());

  final FavoriteMovieDao _favoriteMovieDao;
  final MovieGroupDao _movieGroupDao;
  final PreferencesHelper _preferencesHelper;

  @override
  Stream<FavoritesState> mapEventToState(
    FavoritesEvent event,
  ) async* {
    yield* event.map(
      init: _init,
      refreshData: _refreshData,
      switchedToSeeAll: _switchedToSeeAll,
      switchedToMovieGroups: _switchedToMovieGroups,
      groupAdded: _groupAdded,
    );
  }

  Stream<FavoritesState> _init(_Init event) async* {
    final FavoritesPageState favoritesPageState = await _preferencesHelper.readFavoritesPageState();
    switch (favoritesPageState) {
      case FavoritesPageState.seeAll:
        add(const FavoritesEvent.switchedToSeeAll());
        break;
      case FavoritesPageState.groups:
        add(const FavoritesEvent.switchedToMovieGroups());
        break;
    }
  }

  Stream<FavoritesState> _refreshData(_RefreshData event) async* {
    if (state.movies != null) {
      final List<MovieData> favoriteMovies = await _favoriteMovieDao.getFavoritedMovies();
      yield state.copyWith(movies: favoriteMovies, movieGroups: null);
    } else if (state.movieGroups != null) {
      final List<MovieGroup> movieGroups = await _movieGroupDao.getMovieGroups();
      yield state.copyWith(movieGroups: movieGroups, movies: null);
    }
  }

  Stream<FavoritesState> _switchedToSeeAll(_SwitchedToFavorites event) async* {
    if (state.pageState != FavoritesPageState.seeAll) {
      yield state.copyWith(pageState: FavoritesPageState.seeAll);
      await _preferencesHelper.writeFavoritesPageState(FavoritesPageState.seeAll);

      final List<MovieData> favoriteMovies = await _favoriteMovieDao.getFavoritedMovies();
      yield state.copyWith(
        movies: favoriteMovies,
        movieGroups: null,
      );
    }
  }

  Stream<FavoritesState> _switchedToMovieGroups(_SwitchedToMovieGroups event) async* {
    if (state.pageState != FavoritesPageState.groups) {
      yield state.copyWith(pageState: FavoritesPageState.groups);
      await _preferencesHelper.writeFavoritesPageState(FavoritesPageState.groups);

      final List<MovieGroup> movieGroups = await _movieGroupDao.getMovieGroups();
      yield state.copyWith(
        movies: null,
        movieGroups: movieGroups,
      );
    }
  }

  Stream<FavoritesState> _groupAdded(_GroupAdded event) async* {
    final int groupId = await _movieGroupDao.saveMovieGroup(event.groupName);
    if (state.movieGroups != null) {
      final MovieGroup? insertedGroup = await _movieGroupDao.getMovieGroup(groupId);
      if (insertedGroup != null) {
        final List<MovieGroup> movieGroups = List<MovieGroup>.of(state.movieGroups!);
        movieGroups.insert(0, insertedGroup);
        yield state.copyWith(movieGroups: movieGroups);
      }
    }
  }
}
