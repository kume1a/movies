import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/models/movies/movie_data.dart';
import '../../../state/favorites/favorites_bloc.dart';
import '../../../state/home/home_bloc.dart';
import '../../../state/statistics/statistics_bloc.dart';
import '../../core/routes/screens_navigator.dart';
import '../../core/widgets/movie_item.dart';

class MovieList extends StatelessWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesBloc, FavoritesState>(
      buildWhen: (FavoritesState previous, FavoritesState current) =>
          !const DeepCollectionEquality().equals(previous.movies, current.movies),
      builder: (BuildContext context, FavoritesState state) {
        return state.movies != null
            ? ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 8),
                itemCount: state.movies!.length,
                itemBuilder: (BuildContext context, int index) => _itemBuilder(context, state.movies![index]),
              )
            : const Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget _itemBuilder(BuildContext context, MovieData movie) {
    return GestureDetector(
      onTap: () async {
        await ScreensNavigator.pushDetailsPage(movie.movieId);
        context.read<FavoritesBloc>().add(const FavoritesEvent.refreshData());
        context.read<HomeBloc>().add(const HomeEvent.savedMoviesRequested());
        context.read<StatisticsBloc>().add(const StatisticsEvent.refreshData());
      },
      child: MovieItem(
        imageUrl: movie.poster,
        name: movie.name,
        duration: movie.duration,
        plot: movie.plot,
        rating: movie.imdbRating,
        voterCount: movie.voterCount,
        releaseYear: movie.year,
      ),
    );
  }
}
