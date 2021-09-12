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

class TopSelectionList extends GetView<HomeController> {
  const TopSelectionList({Key? key}) : super(key: key);

  static const double itemWidth = 110;
  static const double imageHeight = itemWidth / 3 * 4;
  static const double itemHeight = imageHeight + 55;
  static const double radius = 12;
  static const double spacing = 16;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: itemHeight,
      child: Obx(() {
        final Movies? topMovies = controller.topMovies.value;

        return topMovies == null
            ? ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, __) => _blankBuilder(null),
              )
            : _buildList(topMovies);
      }),
    );
  }

  Widget _buildList(Movies movies) {
    return PagedList<MovieData>(
      axis: Axis.horizontal,
      request: (BuildContext context) => controller.onTopMoviesPageFetchRequested(),
      blankBuilder: _blankBuilder,
      itemBuilder: _itemBuilder,
      items: movies.data,
      totalCount: movies.totalCount,
      totalPages: movies.totalPages,
      padding: const EdgeInsets.symmetric(horizontal: spacing / 2),
    );
  }

  Widget _itemBuilder(BuildContext context, MovieData movie) {
    return GestureDetector(
      onTap: () => controller.onTopMoviePressed(movie),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: spacing / 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SafeImage(
              imageUrl: movie.poster,
              width: itemWidth,
              height: imageHeight,
              radius: radius,
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: itemWidth,
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

  Widget _blankBuilder(_) {
    return const Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(left: 16),
        child: BlankContainer(
          width: itemWidth,
          height: imageHeight,
          radius: radius,
        ),
      ),
    );
  }
}
