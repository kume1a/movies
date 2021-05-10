import 'package:flutter/material.dart';
import 'package:movo/src/domain/movie/movie_data_model.dart';
import 'package:movo/src/presentation/core/widgets/movie_item.dart';
import 'package:movo/src/presentation/routes/route_args.dart';
import 'package:movo/src/presentation/routes/routes.dart';

class MovieList extends StatelessWidget {
  final List<MovieData> movies;

  const MovieList(this.movies);

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
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.detailsPage,
          arguments: DetailsPageArgs(movieId: movie.movieId),
        );
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
