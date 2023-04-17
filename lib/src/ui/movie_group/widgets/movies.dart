import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../controllers/movie_group/movie_group_controller.dart';
import '../../../core/extensions/model_l10n/movie_data_l10n_extensions.dart';
import '../../../data/model/models/movies/movie_data.dart';
import '../../core/routes/screens_navigator.dart';
import '../../core/widgets/movie_item.dart';

class Movies extends GetView<MovieGroupController> {
  const Movies({super.key});

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: UniqueKey(),
      onVisibilityChanged: (VisibilityInfo info) {
        if (info.visibleFraction == 1) {
          controller.onRefreshData();
        }
      },
      child: Obx(() {
        final RxList<MovieData> movies = controller.movies;

        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (BuildContext context, int index) {
            final MovieData movie = movies[index];

            return GestureDetector(
              onTap: () => ScreensNavigator.pushDetailsPage(movie.movieId),
              child: MovieItem(
                imageUrl: movie.poster,
                name: movie.getName(),
                duration: movie.duration,
                plot: movie.getPlot(),
                rating: movie.imdbRating,
                voterCount: movie.voterCount,
                releaseYear: movie.year,
              ),
            );
          },
        );
      }),
    );
  }
}
