import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import '../../../controllers/details/details_controller.dart';
import '../../../data/model/models/movie_groups/movie_group.dart';
import '../../core/values/colors.dart';
import '../../core/values/text_styles.dart';
import '../../core/widgets/default_back_button.dart';
import '../../core/widgets/safe_image.dart';
import 'movie_group_selector.dart';

class ImageHeader implements SliverPersistentHeaderDelegate {
  const ImageHeader({
    required this.minExtent,
    required this.maxExtent,
  });

  @override
  final double minExtent;
  @override
  final double maxExtent;

  DetailsController get controller => Get.find();

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final double offset = shrinkOffset / maxExtent;
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        _buildImage(),
        Obx(() {
          final bool canBePlayed = controller.movie.value?.canBePlayed ?? true;
          return !canBePlayed
              ? Container(
                  color: Colors.black.withOpacity((1 - offset) * .4),
                )
              : const SizedBox.shrink();
        }),
        _buildBottomContainer(offset),
        Obx(() {
          final bool canBePlayed = controller.movie.value?.canBePlayed ?? true;
          return !canBePlayed ? const Center(child: Text('Coming Soon', style: prB22)) : const SizedBox.shrink();
        }),
        Obx(
          () {
            final bool canBePlayed = controller.movie.value?.canBePlayed ?? true;
            return canBePlayed
                ? Positioned.fill(
                    bottom: minExtent / 2,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: _buildPlayButton(offset),
                    ),
                  )
                : const SizedBox.shrink();
          },
        ),
        Obx(() {
          final bool canBePlayed = controller.movie.value?.canBePlayed ?? true;
          return canBePlayed
              ? Positioned(
                  right: 0,
                  child: ClipOval(
                    child: Material(
                      type: MaterialType.transparency,
                      child: _buildAddToGroupButton(context),
                    ),
                  ),
                )
              : const SizedBox.shrink();
        }),
        const Positioned(
          left: 0,
          child: ClipOval(
            child: Material(
              type: MaterialType.transparency,
              child: DefaultBackButton(),
            ),
          ),
        ),
      ],
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate delegate) => true;

  @override
  PersistentHeaderShowOnScreenConfiguration? get showOnScreenConfiguration => null;

  @override
  FloatingHeaderSnapConfiguration? get snapConfiguration => null;

  @override
  OverScrollHeaderStretchConfiguration? get stretchConfiguration => null;

  @override
  TickerProvider? get vsync => null;

  Widget _buildImage() {
    return Container(
      foregroundDecoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[Colors.black26, Colors.transparent],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: <double>[0, .2],
        ),
      ),
      child: Obx(() => SafeImage(imageUrl: controller.movie.value?.availableImage ?? '')),
    );
  }

  Widget _buildBottomContainer(double offset) {
    return Positioned(
      bottom: 0,
      child: Container(
        height: 54,
        width: maxExtent,
        decoration: BoxDecoration(
          color: colorPrimary,
          borderRadius: BorderRadius.vertical(top: Radius.circular(12 * (1 - offset))),
        ),
      ),
    );
  }

  Widget _buildPlayButton(double offset) {
    return GestureDetector(
      onTap: controller.onPlayPressed,
      child: SizedBox(
        width: minExtent,
        height: minExtent,
        child: Center(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            width: offset <= .3 ? minExtent : 0,
            height: offset <= .3 ? minExtent : 0,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(minExtent / 2),
              color: colorAccent,
            ),
            child: const FittedBox(
              child: Icon(
                Icons.play_arrow_outlined,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAddToGroupButton(BuildContext context) {
    return Obx(() {
      final Widget icon = controller.isFavorite.value
          ? const Icon(Icons.library_add, color: Colors.white, key: ValueKey<int>(1))
          : const Icon(Icons.library_add_outlined, color: Colors.white, key: ValueKey<int>(2));

      return IconButton(
        padding: EdgeInsets.zero,
        onPressed: () async {
          final int? movieId = controller.movie.value?.movieId;

          if (movieId != null) {
            final MovieGroup? selectedMovieGroup = await showMovieGroupSelector(context, movieId);
            if (selectedMovieGroup != null) {
              controller.onGroupSelected(selectedMovieGroup);
            }
          }
        },
        splashColor: Colors.transparent,
        icon: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          transitionBuilder: (Widget child, Animation<double> animation) =>
              ScaleTransition(scale: animation, child: child),
          child: icon,
        ),
      );
    });
  }
}
