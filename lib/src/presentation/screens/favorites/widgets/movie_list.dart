import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movo/src/application/favorites/favorites_bloc.dart';
import 'package:movo/src/domain/movie/movie_data_model.dart';
import 'package:movo/src/presentation/core/widgets/movie_item.dart';
import 'package:movo/src/presentation/routes/route_args.dart';
import 'package:movo/src/presentation/routes/routes.dart';
import 'package:movo/src/presentation/core/extensions.dart';

class MovieList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesBloc, FavoritesState>(
      buildWhen: (FavoritesState prev, FavoritesState curr) =>
          !prev.moviesOption.equals(curr.moviesOption),
      builder: (BuildContext context, FavoritesState state) {
        return state.moviesOption.fold(
          () => Center(child: const CircularProgressIndicator()),
          _buildList,
        );
      },
    );
  }

  Widget _buildList(List<MovieData> movies) {
    return ListView.builder(
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
      ),
    );
  }
}
