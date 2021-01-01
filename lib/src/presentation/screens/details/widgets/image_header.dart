import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movo/src/application/details/details_bloc.dart';
import 'package:movo/src/presentation/core/widgets/safe_image.dart';
import 'package:movo/src/presentation/values/colors.dart';
import 'package:movo/src/presentation/values/constants.dart';
import 'package:movo/src/presentation/values/text_styles.dart';

class ImageHeader implements SliverPersistentHeaderDelegate {
  @override
  final double minExtent;

  @override
  final double maxExtent;

  final String src;
  final VoidCallback onBackPressed;
  final VoidCallback onPlayPressed;

  ImageHeader({
    @required this.minExtent,
    @required this.maxExtent,
    @required this.src,
    @required this.onBackPressed,
    this.onPlayPressed,
  });

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final double offset = shrinkOffset / maxExtent;
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        SafeImage(imageUrl: src),
        if (onPlayPressed == null)
          Container(
            color: Colors.black.withOpacity((1-offset) * .4),
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
        if (onPlayPressed == null)
          Center(child: const Text('Coming Soon', style: prB22)),
        if (onPlayPressed != null)
          Positioned.fill(
            bottom: minExtent / 2,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: onPlayPressed,
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
  PersistentHeaderShowOnScreenConfiguration get showOnScreenConfiguration => null;

  @override
  FloatingHeaderSnapConfiguration get snapConfiguration => null;

  @override
  OverScrollHeaderStretchConfiguration get stretchConfiguration => null;

  @override
  TickerProvider get vsync => null;
}

class FavoriteButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsBloc, DetailsState>(
      buildWhen: (DetailsState prev, DetailsState curr) => prev.favorite != curr.favorite,
      builder: (BuildContext context, DetailsState state) {
        final Icon icon = state.favorite
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
              duration: shortAnimDuration,
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
