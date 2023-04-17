import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/stream/stream_controller.dart';
import '../../../core/extensions/model_l10n/movie_data_l10n_extensions.dart';
import '../../../data/model/models/movies/movie_data.dart';
import '../../../data/model/models/movies/movies.dart';
import '../../core/widgets/movie_item.dart';

class RelatedMovies extends GetView<StreamController> {
  const RelatedMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final Movies? related = controller.related.value;

      return Expanded(
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 6),
          itemCount: related != null ? related.data.length : 0,
          itemBuilder: (BuildContext context, int index) {
            return related != null ? _buildItem(related.data[index]) : const MovieItem();
          },
        ),
      );
    });
  }

  Widget _buildItem(MovieData movie) {
    return GestureDetector(
      onTap: () => controller.onRelatedMoviePressed(movie.movieId),
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
  }
}
