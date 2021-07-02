import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/models/movies/movie_data.dart';
import '../../../state/movie_group/movie_group_bloc.dart';
import '../../core/routes/screens_navigator.dart';
import '../../core/widgets/movie_item.dart';

class Movies extends StatelessWidget {
  const Movies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieGroupBloc, MovieGroupState>(
      builder: (_, MovieGroupState state) {
        if (state.movies == null) {
          return const SliverToBoxAdapter();
        }

        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              final MovieData movie = state.movies![index];

              return GestureDetector(
                onTap: () async {
                  await ScreensNavigator.pushDetailsPage(movie.movieId);
                  context.read<MovieGroupBloc>().add(const MovieGroupEvent.refreshData());
                },
                child: MovieItem(
                  imageUrl: movie.availableImage,
                  name: movie.name,
                  duration: movie.duration,
                  plot: movie.plot,
                  rating: movie.imdbRating,
                  voterCount: movie.voterCount,
                  releaseYear: movie.year,
                ),
              );
            },
            childCount: state.movies!.length,
          ),
        );
      },
    );
  }
}
