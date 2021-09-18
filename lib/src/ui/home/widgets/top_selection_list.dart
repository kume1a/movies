import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/home/home_controller.dart';
import '../../../core/extensions/model_l10n/movie_data_l10n_extensions.dart';
import '../../../data/model/models/movies/movie_data.dart';
import '../../../data/model/models/movies/movies.dart';
import '../../core/values/text_styles.dart';
import '../../core/widgets/blank_container.dart';
import '../../core/widgets/paged_list.dart';
import '../../core/widgets/safe_image.dart';

const double _itemWidth = 110;
const double _imageHeight = _itemWidth / 3 * 4;
const double _itemHeight = _imageHeight + 55;
const double _radius = 12;
const double _spacing = 16;

class TopSelectionList extends GetView<HomeController> {
  const TopSelectionList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _itemHeight,
      child: Obx(() {
        final Movies? topMovies = controller.topMovies.value;

        return topMovies == null
            ? ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, __) => const _ItemBlank(),
              )
            : PagedList<MovieData>(
                axis: Axis.horizontal,
                request: (BuildContext context) => controller.onTopMoviesScrolledToEnd(),
                blankBuilder: (_) => const _ItemBlank(),
                itemBuilder: (_, MovieData movie) => _Item(movie: movie),
                items: topMovies.data,
                totalCount: topMovies.totalCount,
                totalPages: topMovies.totalPages,
                padding: const EdgeInsets.symmetric(horizontal: _spacing / 2),
              );
      }),
    );
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
      onTap: () => controller.onTopMoviePressed(movie),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: _spacing / 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SafeImage(
              imageUrl: movie.poster,
              width: _itemWidth,
              height: _imageHeight,
              radius: _radius,
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: _itemWidth,
              child: Text(
                movie.getName(context),
                style: prSB13,
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ItemBlank extends StatelessWidget {
  const _ItemBlank({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(left: 16),
        child: BlankContainer(
          width: _itemWidth,
          height: _imageHeight,
          radius: _radius,
        ),
      ),
    );
  }
}
