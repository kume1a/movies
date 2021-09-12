import 'package:get/get.dart';

import '../../core/enums/favorites_page_state.dart';
import '../../data/local/favorite_movie/favorite_movie_dao.dart';
import '../../data/local/movie_group/movie_group_dao.dart';
import '../../data/local/preferences/preferences_helper.dart';
import '../../data/model/models/movie_groups/movie_group.dart';
import '../../data/model/models/movies/movie_data.dart';

class FavoritesController extends GetxController {
  FavoritesController(
    this._favoriteMovieDao,
    this._movieGroupDao,
    this._preferencesHelper,
  );

  final FavoriteMovieDao _favoriteMovieDao;
  final MovieGroupDao _movieGroupDao;
  final PreferencesHelper _preferencesHelper;

  final RxList<MovieData> movies = <MovieData>[].obs;
  final RxList<MovieGroup> movieGroups = <MovieGroup>[].obs;
  final Rxn<FavoritesPageState> pageState = Rxn<FavoritesPageState>();
  final RxBool isLoading = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();

    // TODO: 12/09/2021 add movie group and movie when added from somewhere else
    final FavoritesPageState favoritesPageState = await _preferencesHelper.readFavoritesPageState();
    switch (favoritesPageState) {
      case FavoritesPageState.seeAll:
        onSwitchedToSeeAll();
        break;
      case FavoritesPageState.groups:
        onSwitchedToMovieGroups();
        break;
    }
  }

  Future<void> refreshData() async {
    switch (pageState.value) {
      case FavoritesPageState.seeAll:
        _fetchFavoriteMovies();
        break;
      case FavoritesPageState.groups:
        _fetchMovieGroups();
        break;
      default:
        break;
    }
  }

  Future<void> onSwitchedToSeeAll() async {
    if (pageState.value != FavoritesPageState.seeAll) {
      pageState.value = FavoritesPageState.seeAll;
      await _preferencesHelper.writeFavoritesPageState(FavoritesPageState.seeAll);
      await _fetchFavoriteMovies();
    }
  }

  Future<void> onSwitchedToMovieGroups() async {
    if (pageState.value != FavoritesPageState.groups) {
      pageState.value = FavoritesPageState.groups;
      await _preferencesHelper.writeFavoritesPageState(FavoritesPageState.groups);
      await _fetchMovieGroups();
    }
  }

  Future<void> onGroupAdded(String groupName) async {
    final int groupId = await _movieGroupDao.saveMovieGroup(groupName);
    if (pageState.value == FavoritesPageState.groups) {
      final MovieGroup? insertedGroup = await _movieGroupDao.getMovieGroup(groupId);
      if (insertedGroup != null) {
        movieGroups.insert(0, insertedGroup);
      }
    }
  }

  Future<void> onGroupDeleted(MovieGroup movieGroup) async {
    await _movieGroupDao.deleteMovieGroup(movieGroup);
    if (pageState.value == FavoritesPageState.groups) {
      movieGroups.remove(movieGroup);
    }
  }

  Future<void> _fetchMovieGroups() async {
    isLoading.value = true;
    final List<MovieGroup> movieGroups = await _movieGroupDao.getMovieGroups();
    isLoading.value = false;

    movies.clear();
    this.movieGroups.assignAll(movieGroups);
  }

  Future<void> _fetchFavoriteMovies() async {
    isLoading.value = true;
    final List<MovieData> favoriteMovies = await _favoriteMovieDao.getFavoritedMovies();
    isLoading.value = false;

    movies.assignAll(favoriteMovies);
    movieGroups.clear();
  }
}
