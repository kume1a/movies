import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../data/local/favorite_movie/favorite_movie_dao.dart';
import '../../data/local/movie_group/movie_group_dao.dart';
import '../../data/local/saved_movies/saved_movie_dao.dart';
import '../../data/model/core/either.dart';
import '../../data/model/core/fetch_failure.dart';
import '../../data/model/models/actors/actors.dart';
import '../../data/model/models/movie_groups/movie_group.dart';
import '../../data/model/models/movies/movie_data.dart';
import '../../data/model/models/movies/movie_position.dart';
import '../../data/model/models/movies/saved_movie.dart';
import '../../data/network/services/movie_service.dart';

part 'details_bloc.freezed.dart';
part 'details_event.dart';
part 'details_state.dart';

@injectable
class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  DetailsBloc(
    this._movieService,
    this._favoriteMovieDao,
    this._savedMovieDao,
    this._movieGroupDao,
    @factoryParam this.movieId,
  ) : super(DetailsState.initial());

  final MovieService _movieService;
  final FavoriteMovieDao _favoriteMovieDao;
  final SavedMovieDao _savedMovieDao;
  final MovieGroupDao _movieGroupDao;

  final int? movieId;

  int _actorsPage = 1;
  bool _fetchingActors = false;

  @override
  Stream<DetailsState> mapEventToState(
    DetailsEvent event,
  ) async* {
    if (movieId == -1) throw StateError('movieId should be initialized before using bloc');

    yield* event.map(
      init: _init,
      movieFetchRequested: _movieFetchRequested,
      castPageFetchRequested: _castPageFetchRequested,
      addToGroupClicked: _addToGroupClicked,
      groupSelected: _groupSelected,
    );
  }

  Stream<DetailsState> _init(_Init event) async* {
    final int movieGroupCount = await _movieGroupDao.count();
    final SavedMovie? moviePosition = await _savedMovieDao.getSavedMovie(movieId!);
    final bool belongsToMovieGroup = await _movieGroupDao.belongsToMovieGroup(movieId!);
   
    yield state.copyWith(
      canShowGroupSelector: movieGroupCount > 0,
      moviePosition: moviePosition?.position,
      belongsToMovieGroup: belongsToMovieGroup,
    );
  }

  Stream<DetailsState> _movieFetchRequested(_MovieFetchRequested event) async* {
    final Either<FetchFailure, MovieData> movie = await _movieService.getMovie(movieId!);
    yield state.copyWith(movie: movie.get);
  }

  Stream<DetailsState> _castPageFetchRequested(_CastPageFetchRequested event) async* {
    if (!_fetchingActors) {
      _fetchingActors = true;

      final Either<FetchFailure, Actors> actors = await _movieService.getActors(movieId!, _actorsPage);
      if (state.actors != null) {
        actors.getOrElse(() => Actors.empty()).actors.insertAll(0, state.actors!.actors);
      }

      _actorsPage++;
      _fetchingActors = false;
      yield state.copyWith(actors: actors.get);
    }
  }

  Stream<DetailsState> _addToGroupClicked(_AddToGroupClicked event) async* {
    final int movieGroupCount = await _movieGroupDao.count();
    if (movieGroupCount == 0) {
      // TODO: 29/06/2021 add to just favorite movies
    }
  }

  Stream<DetailsState> _groupSelected(_GroupSelected event) async* {
    final MovieGroup? movieGroup = await _movieGroupDao.getMovieGroupWithMovieId(movieId!);

    if (event.movieGroup != movieGroup) {
      await _favoriteMovieDao.addMovieToGroup(
        state.movie!.movieId,
        state.movie!.name,
        event.movieGroup.groupId,
      );
      yield state.copyWith(belongsToMovieGroup: true);
    } else {
      await _favoriteMovieDao.removeMovieFromGroup(movieId!);
      yield state.copyWith(belongsToMovieGroup: false);
    }
  }
}
