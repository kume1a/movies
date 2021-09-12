import 'package:get/get.dart';

import '../../data/local/favorite_movie/favorite_movie_dao.dart';
import '../../data/local/movie_group/movie_group_dao.dart';
import '../../data/model/models/movie_groups/movie_group.dart';

class MovieGroupSelectorController extends GetxController {
  MovieGroupSelectorController(
    this._movieGroupDao,
    this._favoriteMovieDao,
  );

  final MovieGroupDao _movieGroupDao;
  final FavoriteMovieDao _favoriteMovieDao;

  final Rxn<MovieGroup> selectedMovieGroup = Rxn<MovieGroup>();
  final RxList<MovieGroup> movieGroups = <MovieGroup>[].obs;

  @override
  Future<void> onInit() async {
    super.onInit();

    final int movieId = Get.arguments as int;

    const MovieGroup optionNoGroup = MovieGroup(
      groupId: null,
      name: '',
      movieNamesEn: <String>[],
      movieNamesKa: <String>[],
    );

    MovieGroup? movieGroup = await _movieGroupDao.getMovieGroupWithMovieId(movieId);
    final List<MovieGroup> movieGroups = await _movieGroupDao.getMovieGroups();
    movieGroups.insert(0, optionNoGroup);
    if (movieGroup == null) {
      final bool isFavorited = await _favoriteMovieDao.isMovieFavorited(movieId);
      if (isFavorited) {
        movieGroup = optionNoGroup;
      }
    }

    this.movieGroups.value = movieGroups;
    selectedMovieGroup.value = movieGroup;
  }
}
