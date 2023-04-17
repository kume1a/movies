import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/main/favorites_controller.dart';
import '../../../core/extensions/model_l10n/movie_data_l10n_extensions.dart';
import '../../../data/model/models/movies/movie_data.dart';
import '../../../l10n/translation_keys.dart';
import '../../core/widgets/movie_item.dart';

class MovieList extends GetView<FavoritesController> {
  const MovieList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final RxList<MovieData> movies = controller.movies;

      if (movies.isEmpty) {
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(trFavoritesNoMovieHeader.tr, style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 8),
              Wrap(
                alignment: WrapAlignment.center,
                runSpacing: 8,
                children: <Widget>[
                  Text(trFavoritesClick.tr, style: const TextStyle(fontSize: 16)),
                  const SizedBox(width: 12),
                  const Icon(Icons.library_add),
                  const SizedBox(width: 12),
                  Text(trFavoritesNoMoviesMessageEnd.tr, style: const TextStyle(fontSize: 16))
                ],
              ),
            ],
          ),
        );
      }

      return ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: movies.length,
        itemBuilder: (BuildContext context, int index) => _itemBuilder(movies[index]),
      );
    });
  }

  Widget _itemBuilder(MovieData movie) {
    return GestureDetector(
      onTap: () => controller.onFavoriteMoviePressed(movie),
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
