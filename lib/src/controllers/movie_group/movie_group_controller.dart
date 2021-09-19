import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

import '../../data/local/favorite_movie/favorite_movie_dao.dart';
import '../../data/local/movie_group/movie_group_dao.dart';
import '../../data/model/core/either.dart';
import '../../data/model/core/fetch_failure.dart';
import '../../data/model/models/movie_groups/movie_group.dart';
import '../../data/model/models/movies/movie_data.dart';
import '../../data/model/models/search/search_result.dart';
import '../../data/network/services/movie_service.dart';
import '../../ui/core/routes/route_args.dart';
import '../../ui/core/routes/screens_navigator.dart';
import '../core/base_controller_middle_man.dart';

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

  void onScrolledUp() => isFabExpanded.value = true;

  void onScrolledDown() => isFabExpanded.value = false;
}

@injectable
class MovieGroupControllerMiddleMan extends BaseControllerMiddleMan<MovieGroupController> {
  MovieGroupControllerMiddleMan(
    this._movieService,
  );

  final MovieService _movieService;

  void onMovieAdded(SearchResult searchResult) {
    runIfRegistered((MovieGroupController controller) async {
      final Either<FetchFailure, MovieData> movie = await _movieService.getMovie(searchResult.movieId);
      movie.fold(
        (_) {},
        (MovieData r) => controller.movies.add(r),
      );
    });
  }

  void onMovieRemoved(SearchResult searchResult) {
    runIfRegistered((MovieGroupController controller) {
      controller.movies.removeWhere((MovieData e) => searchResult.movieId == e.movieId);
    });
  }
}
