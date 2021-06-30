import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/models/movie_groups/movie_group.dart';
import '../../../state/details/details_bloc.dart';
import '../../core/values/colors.dart';
import '../../core/values/text_styles.dart';
import '../../core/widgets/safe_image.dart';
import 'movie_group_selector.dart';

class ImageHeader implements SliverPersistentHeaderDelegate {
  const ImageHeader({
    required this.minExtent,
    required this.maxExtent,
    required this.src,
    this.onPlayPressed,
  });

  @override
  final double minExtent;

  @override
  final double maxExtent;

  final String src;
  final VoidCallback? onPlayPressed;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final double offset = shrinkOffset / maxExtent;
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        _buildImage(),
        if (onPlayPressed == null)
          Container(
            color: Colors.black.withOpacity((1 - offset) * .4),
          ),
        _buildBottomContainer(offset),
        if (onPlayPressed == null) const Center(child: Text('Coming Soon', style: prB22)),
        if (onPlayPressed != null)
          Positioned.fill(
            bottom: minExtent / 2,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: _buildPlayButton(offset),
            ),
          ),
        if (onPlayPressed != null)
          Positioned(
            right: 0,
            child: _buildAddToGroupButton(context),
          ),
        const Positioned(
          left: 0,
          child: BackButton(color: Colors.white),
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
      child: SafeImage(imageUrl: src),
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
          borderRadius: BorderRadius.vertical(top: Radius.circular(27 * (1 - offset))),
        ),
      ),
    );
  }

  Widget _buildPlayButton(double offset) {
    return GestureDetector(
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
    );
  }

  Widget _buildAddToGroupButton(BuildContext context) {
    return BlocBuilder<DetailsBloc, DetailsState>(
      buildWhen: (DetailsState previous, DetailsState current) =>
          previous.movie != current.movie ||
          previous.canShowGroupSelector != current.canShowGroupSelector ||
          previous.belongsToMovieGroup != current.belongsToMovieGroup,
      builder: (BuildContext context, DetailsState state) {
        final Widget icon = state.belongsToMovieGroup
            ? const Icon(Icons.library_add, color: Colors.white, key: ValueKey<int>(1))
            : const Icon(Icons.library_add_outlined, color: Colors.white, key: ValueKey<int>(2));

        return IconButton(
          padding: EdgeInsets.zero,
          onPressed: () async {
            context.read<DetailsBloc>().add(const DetailsEvent.addToGroupClicked());

            final int? movieId = state.movie?.movieId;

            if (movieId != null && state.canShowGroupSelector) {
              final MovieGroup? selectedMovieGroup = await showMovieGroupSelector(context, movieId);
              if (selectedMovieGroup != null) {
                context.read<DetailsBloc>().add(DetailsEvent.groupSelected(selectedMovieGroup));
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
      },
    );
  }
}
