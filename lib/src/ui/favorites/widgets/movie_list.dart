import 'package:flutter/material.dart';

import '../../../data/model/schemas/movie/movie_data_model.dart';
import '../../core/routes/route_args.dart';
import '../../core/routes/routes.dart';
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
