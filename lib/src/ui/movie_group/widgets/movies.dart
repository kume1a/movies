import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../core/extensions/model_l10n/movie_data_l10n_extensions.dart';
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
          return const SizedBox.shrink();
        }

        return VisibilityDetector(
          key: UniqueKey(),
          onVisibilityChanged: (VisibilityInfo info) {
            if (info.visibleFraction == 1) {
              context.read<MovieGroupBloc>().add(const MovieGroupEvent.refreshData());
            }
          },
          child: ListView.builder(
            itemCount: state.movies!.length,
            itemBuilder: (BuildContext context, int index) {
              final MovieData movie = state.movies![index];

              return GestureDetector(
                onTap: () => ScreensNavigator.pushDetailsPage(movie.movieId),
                child: MovieItem(
                  imageUrl: movie.poster,
                  name: movie.getName(context),
                  duration: movie.duration,
                  plot: movie.getPlot(context),
                  rating: movie.imdbRating,
                  voterCount: movie.voterCount,
                  releaseYear: movie.year,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
