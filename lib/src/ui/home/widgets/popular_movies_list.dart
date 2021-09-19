import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/main/home_controller.dart';
import '../../../core/extensions/model_l10n/movie_data_l10n_extensions.dart';
import '../../../data/model/models/movies/movie_data.dart';
import '../../../data/model/models/movies/movies.dart';
import '../../core/values/colors.dart';
import '../../core/values/text_styles.dart';
import '../../core/widgets/blank_container.dart';
import '../../core/widgets/carousel.dart';
import '../../core/widgets/safe_image.dart';

const double _itemHeight = 180;
const double _itemWidth = 180 / 9 * 16;
const double _radius = 16;

class PopularMoviesList extends GetView<HomeController> {
  const PopularMoviesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final Movies? popularMovies = controller.popularMovies.value;

      return Carousel(
        height: _itemHeight,
        itemCount: popularMovies != null ? popularMovies.data.length : 2,
        distortionValue: .2,
        itemBuilder: (BuildContext context, int index) =>
            popularMovies != null ? _Item(movie: popularMovies.data[index]) : const _ItemBlank(),
      );
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
      onTap: () => controller.onPopularMoviePressed(movie),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(_radius),
        child: Stack(
          children: <Widget>[
            Container(
              foregroundDecoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[Colors.transparent, Colors.black38],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: <double>[.7, 1],
                ),
              ),
              width: _itemWidth,
              height: _itemHeight,
              child: SafeImage(imageUrl: movie.availableImage),
            ),
            Positioned(
              bottom: 12,
              left: 24,
              right: 24,
              child: Text(
                movie.getName(),
                style: prB19,
                maxLines: 1,
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
    return const BlankContainer(
      width: _itemWidth,
      height: _itemHeight,
      color: colorPreview,
      radius: _radius,
    );
  }
}
