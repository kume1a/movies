import 'package:get/get.dart';

import '../../data/local/favorite_movie/favorite_movie_dao.dart';
import '../../data/local/movie_group/movie_group_dao.dart';
import '../../data/model/models/movie_groups/movie_group.dart';
import '../../data/model/models/movies/movie_data.dart';
import '../../ui/core/routes/route_args.dart';
import '../../ui/core/routes/screens_navigator.dart';

class MovieGroupController extends GetxController {
  MovieGroupController(
    this._favoriteMovieDao,
    this._movieGroupDao,
  );

  final FavoriteMovieDao _favoriteMovieDao;
  final MovieGroupDao _movieGroupDao;

  final Rxn<MovieGroup> movieGroup = Rxn<MovieGroup>();
  final RxList<MovieData> movies = <MovieData>[].obs;
  final RxBool isFabExpanded = true.obs;

  late int _groupId;

  @override
  Future<void> onInit() async {
    super.onInit();

    final MovieGroupPageArgs args = Get.arguments as MovieGroupPageArgs;

    _groupId = args.groupId;

    final List<MovieData> movies = await _favoriteMovieDao.getFavoritedMovies(_groupId);
    final MovieGroup? movieGroup = await _movieGroupDao.getMovieGroup(_groupId);

    this.movies.assignAll(movies);
    this.movieGroup.value = movieGroup;
  }

  Future<void> onRefreshData() async {
    final List<MovieData> movies = await _favoriteMovieDao.getFavoritedMovies(_groupId);
    this.movies.assignAll(movies);
  }

  void onAddMovieClicked() => ScreensNavigator.pushAddMoviePage(_groupId);

  void onScrolledUp()  => isFabExpanded.value = true;

  void onScrolledDown() => isFabExpanded.value = false;
}
