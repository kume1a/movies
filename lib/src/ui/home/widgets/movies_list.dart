import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/home/home_controller.dart';
import '../../../core/extensions/model_l10n/movie_data_l10n_extensions.dart';
import '../../../data/model/models/movies/movie_data.dart';
import '../../../data/model/models/movies/movies.dart';
import '../../core/widgets/movie_item.dart';
import '../../core/widgets/paged_list.dart';

class MoviesList extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final Movies? movies = controller.movies.value;

      return movies != null
          ? PagedList<MovieData>(
              extent: 1,
              listType: ListType.sliverBuilder,
              request: (BuildContext context) => controller.onMoviesScrolledToEnd(),
              blankBuilder: (_) => const _ItemLoader(),
              itemBuilder: (_, MovieData movie) => _Item(movie: movie),
              items: movies.data,
              totalCount: movies.totalCount,
              totalPages: movies.totalPages,
            )
          : const SliverToBoxAdapter();
    });
  }
}

class _Item extends GetView<HomeController> {
  const _Item({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final MovieData movie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => controller.onMoviePressed(movie),
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

class _ItemLoader extends StatelessWidget {
  const _ItemLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 32),
      child: Center(child: CircularProgressIndicator()),
    );
  }
}
