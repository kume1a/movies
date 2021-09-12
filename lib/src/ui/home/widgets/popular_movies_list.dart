import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/home/home_controller.dart';
import '../../../core/extensions/model_l10n/movie_data_l10n_extensions.dart';
import '../../../data/model/models/movies/movie_data.dart';
import '../../../data/model/models/movies/movies.dart';
import '../../core/values/colors.dart';
import '../../core/values/text_styles.dart';
import '../../core/widgets/carousel.dart';
import '../../core/widgets/safe_image.dart';

class PopularMoviesList extends GetView<HomeController> {
  const PopularMoviesList({Key? key}) : super(key: key);

  static const double _itemHeight = 180;
  static const double _itemWidth = 180 / 9 * 16;
  static const double _radius = 16;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final Movies? popularMovies = controller.popularMovies.value;

      return Carousel(
        height: _itemHeight,
        itemCount: popularMovies != null ? popularMovies.data.length : 3,
        distortionValue: .2,
        itemBuilder: (BuildContext context, int index) {
          return popularMovies != null ? _itemBuilder(context, popularMovies.data[index]) : _blankBuilder();
        },
      );
    });
  }

  Widget _itemBuilder(BuildContext context, MovieData movie) {
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
                movie.getName(context),
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

  Widget _blankBuilder() {
    return Container(
      width: _itemWidth,
      height: _itemHeight,
      decoration: BoxDecoration(
        color: colorPreview,
        borderRadius: BorderRadius.circular(_radius),
      ),
    );
  }
}
