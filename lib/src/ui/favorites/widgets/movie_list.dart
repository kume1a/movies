import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

import '../../../controllers/favorites/favorites_controller.dart';
import '../../../core/extensions/model_l10n/movie_data_l10n_extensions.dart';
import '../../../data/model/models/movies/movie_data.dart';
import '../../core/routes/screens_navigator.dart';
import '../../core/widgets/movie_item.dart';

class MovieList extends GetView<FavoritesController> {
  const MovieList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? appLocalizations = AppLocalizations.of(context);

    return Obx(() {
      final RxList<MovieData> movies = controller.movies;

      if (movies.isEmpty) {
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(appLocalizations?.favoritesNoMovieHeader ?? '', style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 8),
              Wrap(
                alignment: WrapAlignment.center,
                runSpacing: 8,
                children: <Widget>[
                  Text(appLocalizations?.favoritesClick ?? '', style: const TextStyle(fontSize: 16)),
                  const SizedBox(width: 12),
                  const Icon(Icons.library_add),
                  const SizedBox(width: 12),
                  Text(appLocalizations?.favoritesNoMoviesMessageEnd ?? '', style: const TextStyle(fontSize: 16))
                ],
              ),
            ],
          ),
        );
      }

      return ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: movies.length,
        itemBuilder: (BuildContext context, int index) => _itemBuilder(context, movies[index]),
      );
    });
  }

  Widget _itemBuilder(BuildContext context, MovieData movie) {
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
  }
}
