import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/details/details_controller.dart';
import '../../core/extensions/model_l10n/movie_data_l10n_extensions.dart';
import '../../data/model/models/movies/movie_data.dart';
import '../../data/model/models/movies/movie_position.dart';
import '../../l10n/translation_keys.dart';
import '../core/routes/screens_navigator.dart';
import '../core/values/colors.dart';
import '../core/values/text_styles.dart';
import '../core/widgets/rating_duration.dart';
import 'widgets/widgets.dart';

class DetailsPage extends GetView<DetailsController> {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: colorPrimary,
      floatingActionButton: Obx(() {
        final MoviePosition? moviePosition = controller.moviePosition.value;
        final MovieData? movie = controller.movie.value;

        final Widget fab = movie != null && moviePosition != null
            ? FloatingActionButton.extended(
                onPressed: () => ScreensNavigator.pushStreamPage(
                  movieId: moviePosition.movieId,
                  episode: moviePosition.season,
                  season: moviePosition.season,
                  leftAt: moviePosition.leftAt,
                ),
                backgroundColor: colorAccent,
                icon: const Icon(Icons.play_arrow_rounded, color: Colors.white),
                label: Text(trDetailsButtonContinue.tr, style: prB15),
              )
            : const SizedBox.shrink();

        return AnimatedOpacity(
          duration: const Duration(seconds: 1),
          opacity: moviePosition != null ? 1 : 0,
          child: fab,
        );
      }),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: controller.onRefresh,
          child: CustomScrollView(
            slivers: <Widget>[
              SliverPersistentHeader(
                pinned: true,
                delegate: ImageHeader(
                  minExtent: 54,
                  maxExtent: w,
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  <Widget>[
                    Obx(
                      () => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(controller.movie.value?.getName() ?? '', style: prB28),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Obx(
                        () => RatingDurationYear(
                          rating: controller.movie.value?.imdbRating,
                          duration: controller.movie.value?.duration,
                          releaseYear: controller.movie.value?.year,
                        ),
                      ),
                    ),
                    const SizedBox(height: 18),
                    const GenreList(),
                    const SizedBox(height: 32),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Obx(() => Text(controller.movie.value?.getPlot() ?? '', style: pr15)),
                    ),
                    const SizedBox(height: 32),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: CastHeader(),
                    ),
                    const SizedBox(height: 16),
                    CastList(),
                    const SizedBox(height: 260),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
