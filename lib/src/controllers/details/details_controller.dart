import 'package:get/get.dart';

import '../../data/local/favorite_movie/favorite_movie_dao.dart';
import '../../data/local/movie_group/movie_group_dao.dart';
import '../../data/local/saved_movies/saved_movie_dao.dart';
import '../../data/model/core/either.dart';
import '../../data/model/core/fetch_failure.dart';
import '../../data/model/models/actors/actors.dart';
import '../../data/model/models/movie_groups/movie_group.dart';
import '../../data/model/models/movies/movie_data.dart';
import '../../data/model/models/movies/movie_position.dart';
import '../../data/network/services/movie_service.dart';
import '../../ui/core/routes/route_args.dart';
import '../../ui/core/routes/screens_navigator.dart';
import '../favorites/favorites_controller.dart';

class DetailsController extends GetxController {
  DetailsController(
    this._movieService,
    this._favoriteMovieDao,
    this._savedMovieDao,
    this._movieGroupDao,
    this._favoritesControllerMiddleMan,
  );

  final Rxn<MovieData> movie = Rxn<MovieData>();
  final Rxn<Actors> actors = Rxn<Actors>();
  final Rxn<MoviePosition> moviePosition = Rxn<MoviePosition>();
  final RxBool isFavorite = false.obs;

  final MovieService _movieService;
  final FavoriteMovieDao _favoriteMovieDao;
  final SavedMovieDao _savedMovieDao;
  final MovieGroupDao _movieGroupDao;
  final FavoritesControllerMiddleMan _favoritesControllerMiddleMan;

  late final int _movieId;

  int _actorsPage = 1;
  bool _fetchingActors = false;

  @override
  Future<void> onInit() async {
    super.onInit();

    final DetailsPageArgs args = Get.arguments as DetailsPageArgs;
    _movieId = args.movieId;

    moviePosition.value = (await _savedMovieDao.getSavedMovie(_movieId))?.position;
    isFavorite.value = await _favoriteMovieDao.isMovieFavorited(_movieId);

    _fetchMovie();
    _fetchActors();
  }

  Future<void> onCastPageFetchRequested() async => _fetchActors();

  Future<void> onGroupSelected(MovieGroup selectedMovieGroup) async {
    final MovieGroup? movieGroup = await _movieGroupDao.getMovieGroupWithMovieId(_movieId);

    bool isFavorite = this.isFavorite.value;
    if (selectedMovieGroup != movieGroup) {
      if (selectedMovieGroup.groupId != null) {
        // switching to other group
        await _favoriteMovieDao.addMovieToGroup(
          movieId: movie.value!.movieId,
          movieNameKa: movie.value!.nameKa,
          movieNameEn: movie.value!.nameEn,
          groupId: selectedMovieGroup.groupId!,
        );
        _favoritesControllerMiddleMan.onFavoriteMovieGroupSwitched(_movieId, movieGroup, selectedMovieGroup);
        isFavorite = true;
      } else {
        final bool isFavorited = await _favoriteMovieDao.isMovieFavorited(_movieId);
        if (isFavorited) {
          if (movieGroup != null && movieGroup.groupId != null) {
            // switching from a group to no group
            await _favoriteMovieDao.justFavoriteMovie(
              movieId: movie.value!.movieId,
              movieNameKa: movie.value!.nameKa,
              movieNameEn: movie.value!.nameEn,
            );
            _favoritesControllerMiddleMan.onFavoriteMovieSwitchedToNoGroup(_movieId);
            isFavorite = true;
          } else {
            // clicking no group when no group is selected
            await _favoriteMovieDao.deleteFavoriteMovie(_movieId);
            _favoritesControllerMiddleMan.onFavoriteMovieRemoved(_movieId);
            isFavorite = false;
          }
        } else {
          // clicking no group when movie hasn't yet been favorited
          await _favoriteMovieDao.justFavoriteMovie(
            movieId: movie.value!.movieId,
            movieNameKa: movie.value!.nameKa,
            movieNameEn: movie.value!.nameEn,
          );
          _favoritesControllerMiddleMan.onFavoriteMovieAddedToGroup(_movieId, selectedMovieGroup.groupId!);
          isFavorite = true;
        }
      }
    } else {
      // clicking a group that is already selected
      await _favoriteMovieDao.deleteFavoriteMovie(_movieId);
      _favoritesControllerMiddleMan.onFavoriteMovieRemoved(_movieId);
      isFavorite = false;
    }
    this.isFavorite.value = isFavorite;
  }

  void onPlayPressed() {
    if (movie.value != null) {
      ScreensNavigator.pushStreamPage(movieId: movie.value!.movieId);
    }
  }

  Future<void> _fetchMovie() async {
    final Either<FetchFailure, MovieData> movie = await _movieService.getMovie(_movieId);
    this.movie.value = movie.get;
  }

  Future<void> _fetchActors() async {
    if (_fetchingActors) {
      return;
    }

    _fetchingActors = true;

    final Either<FetchFailure, Actors> actors = await _movieService.getActors(_movieId, _actorsPage);
    if (this.actors.value != null) {
      actors.getOrElse(() => Actors.empty()).actors.insertAll(0, this.actors.value!.actors);
    }

    _actorsPage++;
    _fetchingActors = false;

    this.actors.value = actors.get;
  }
}
