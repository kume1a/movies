import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/models/movies/movie_data.dart';
import '../../../state/favorites/favorites_bloc.dart';
import '../../../state/home/home_bloc.dart';
import '../../core/routes/screens_navigator.dart';
import '../../core/widgets/movie_item.dart';

class MovieList extends StatelessWidget {
  const MovieList(this.movies);

  final List<MovieData> movies;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: movies.length,
      itemBuilder: (BuildContext context, int index) => _itemBuilder(context, movies[index]),
    );
  }

  Widget _itemBuilder(BuildContext context, MovieData movie) {
    return GestureDetector(
      onTap: () async {
        await ScreensNavigator.pushDetailsPage(movie.movieId);
        context.read<FavoritesBloc>().add(const FavoritesEvent.favoriteMoviesRequested());
        context.read<HomeBloc>().add(const HomeEvent.savedMoviesRequested());
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
