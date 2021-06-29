import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../state/details/details_bloc.dart';
import '../../core/values/colors.dart';
import '../../core/values/text_styles.dart';
import '../../core/widgets/safe_image.dart';

class ImageHeader implements SliverPersistentHeaderDelegate {
  const ImageHeader({
    required this.minExtent,
    required this.maxExtent,
    required this.src,
    required this.onBackPressed,
    this.onPlayPressed,
  });

  @override
  final double minExtent;

  @override
  final double maxExtent;

  final String src;
  final VoidCallback onBackPressed;
  final VoidCallback? onPlayPressed;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final double offset = shrinkOffset / maxExtent;
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        SafeImage(imageUrl: src),
        if (onPlayPressed == null)
          Container(
            color: Colors.black.withOpacity((1 - offset) * .4),
          ),
        Positioned(
          bottom: 0,
          child: Container(
            height: 54,
            width: maxExtent,
            decoration: BoxDecoration(
              color: colorPrimary,
              borderRadius: BorderRadius.vertical(top: Radius.circular(27 * (1 - offset))),
            ),
          ),
        ),
        if (onPlayPressed == null) const Center(child: Text('Coming Soon', style: prB22)),
        if (onPlayPressed != null)
          Positioned.fill(
            bottom: minExtent / 2,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: onPlayPressed,
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
              ),
            ),
          ),
        if (onPlayPressed != null)
          Positioned(
            right: 0,
            child: FavoriteButton(),
          ),
        Positioned(
          left: 0,
          child: IconButton(
            onPressed: onBackPressed,
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate _) => true;

  @override
  PersistentHeaderShowOnScreenConfiguration? get showOnScreenConfiguration => null;

  @override
  FloatingHeaderSnapConfiguration? get snapConfiguration => null;

  @override
  OverScrollHeaderStretchConfiguration? get stretchConfiguration => null;

  @override
  TickerProvider? get vsync => null;
}

class FavoriteButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsBloc, DetailsState>(
      buildWhen: (DetailsState prev, DetailsState curr) => prev.isFavorite != curr.isFavorite,
      builder: (BuildContext context, DetailsState state) {
        final Icon icon = state.isFavorite
            ? const Icon(
                Icons.favorite,
                color: colorAccent,
                key: Key('favorite'),
              )
            : const Icon(
                Icons.favorite_border_sharp,
                color: Colors.white,
                key: Key('favorite_border_sharp'),
              );

        return GestureDetector(
          onTap: () {
            context.read<DetailsBloc>().add(const DetailsEvent.favoriteToggled());
          },
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              switchOutCurve: Curves.bounceIn,
              transitionBuilder: (Widget child, Animation<double> animation) {
                return ScaleTransition(
                  scale: animation,
                  child: child,
                );
              },
              child: icon,
            ),
          ),
        );
      },
    );
  }
}
