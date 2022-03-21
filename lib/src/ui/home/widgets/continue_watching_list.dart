import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../controllers/main/home_controller.dart';
import '../../../core/extensions/model_l10n/movie_data_l10n_extensions.dart';
import '../../../data/model/models/movies/saved_movie.dart';
import '../../../l10n/translation_keys.dart';
import '../../core/formatters.dart';
import '../../core/values/colors.dart';
import '../../core/values/text_styles.dart';
import '../../core/widgets/safe_image.dart';

const double _itemWidth = 230;
const double _imageHeight = _itemWidth / 16 * 9;
const double _itemHeight = _imageHeight + 50;
const double _radius = 4;

class ContinueWatchingList extends GetView<HomeController> {
  const ContinueWatchingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: UniqueKey(),
      onVisibilityChanged: (VisibilityInfo info) {
        if (info.visibleFraction == 1) {
          controller.onSavedMoviesVisible();
        }
      },
      child: Obx(() {
        final RxList<SavedMovie> savedMovies = controller.savedMovies;

        return savedMovies.isNotEmpty
            ? SizedBox(
                height: _itemHeight,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: savedMovies.length,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  itemBuilder: (BuildContext context, int index) => _Item(savedMovie: savedMovies[index]),
                ),
              )
            : const SizedBox(width: 1, height: 1);
      }),
    );
  }
}

class _Item extends GetView<HomeController> {
  const _Item({
    Key? key,
    required this.savedMovie,
  }) : super(key: key);

  final SavedMovie savedMovie;

  @override
  Widget build(BuildContext context) {
    String bottomDetailText = formatVideoDuration(savedMovie.position.leftAt);
    if (savedMovie.position.isTvShow) {
      final int s = savedMovie.position.season;
      final int e = savedMovie.position.episode;
      bottomDetailText += '\t--\t${s}x${e < 10 ? '0$e' : e}';
    }

    final double progress = savedMovie.position.durationInMillis != 0
        ? savedMovie.position.leftAt / savedMovie.position.durationInMillis
        : 0;

    return GestureDetector(
      onTap: () => controller.onSavedMoviePressed(savedMovie),
      onLongPress: () => controller.onSavedMovieLongPressed(savedMovie),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(_radius),
              child: Stack(
                children: <Widget>[
                  SafeImage(
                    imageUrl: savedMovie.data.availableImage,
                    width: _itemWidth,
                    height: _imageHeight,
                  ),
                  Positioned(
                    bottom: 0,
                    child: SizedBox(
                      width: _itemWidth,
                      child: LinearProgressIndicator(
                        backgroundColor: colorInactive,
                        value: progress,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 6),
            SizedBox(
              width: _itemWidth,
              child: Text(
                savedMovie.data.getName(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: prSB18,
              ),
            ),
            const SizedBox(height: 2),
            Text('${trHomeWatchLaterLeftAt.tr} $bottomDetailText', style: sc11),
          ],
        ),
      ),
    );
  }
}
