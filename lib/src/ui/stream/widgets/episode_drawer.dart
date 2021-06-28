import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/models/movies/movie_data.dart';
import '../../../data/model/models/seasons/episode.dart';
import '../../../data/model/models/seasons/season.dart';
import '../../../data/model/models/seasons/season_files.dart';
import '../../../state/stream/stream_bloc.dart';
import '../../core/values/constants.dart';
import '../../core/values/text_styles.dart';
import '../../core/widgets/movie_item.dart';
import '../../core/widgets/safe_image.dart';

class EpisodeDrawer extends StatefulWidget {
  const EpisodeDrawer({
    required this.child,
    this.showEpisodes = true,
    this.showRecommended = true,
  });

  final Widget child;
  final bool showEpisodes;
  final bool showRecommended;

  @override
  _EpisodeDrawerState createState() => _EpisodeDrawerState();
}

class _EpisodeDrawerState extends State<EpisodeDrawer> with TickerProviderStateMixin {
  static const double minFlingVelocity = 300;

  static const double hMaxSlide = 280;
  static const double hMinDragStartEdge = 100;
  static const double hMaxDragStartEdge = hMaxSlide - 16;

  static const double vMaxSlide = 185;
  static const double vMinDragStartEdge = 120;
  static const double vMaxDragStartEdge = vMaxSlide - 16;

  late AnimationController _horizontalController;
  bool _canBeDraggedHorizontally = false;

  late AnimationController _verticalController;
  bool _canBeDraggedVertically = false;

  bool _absorbing = false;

  // ignore: missing_return
  bool _canShow(Axis axis) {
    switch (axis) {
      case Axis.horizontal:
        return widget.showEpisodes;
      case Axis.vertical:
        return widget.showRecommended;
    }
  }

  // ignore: missing_return
  bool _canBeDragged(Axis axis, {bool? set}) {
    switch (axis) {
      case Axis.horizontal:
        _canBeDraggedHorizontally = set ?? _canBeDraggedHorizontally;
        return _canBeDraggedHorizontally;
      case Axis.vertical:
        _canBeDraggedVertically = set ?? _canBeDraggedVertically;
        return _canBeDraggedVertically;
    }
  }

  // ignore: missing_return
  AnimationController _getController(Axis axis) {
    switch (axis) {
      case Axis.horizontal:
        return _horizontalController;
      case Axis.vertical:
        return _verticalController;
    }
  }

  @override
  void initState() {
    super.initState();
    _horizontalController = AnimationController(vsync: this, duration: shortAnimDuration);
    _verticalController = AnimationController(vsync: this, duration: shortAnimDuration);
  }

  @override
  void dispose() {
    _horizontalController.dispose();
    _verticalController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant EpisodeDrawer oldWidget) {
    super.didUpdateWidget(oldWidget);

    _absorbing = false;
  }

  bool _shouldAbsorb() {
    if (!widget.showRecommended || !widget.showEpisodes) {
      return _absorbing;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: (DragStartDetails details) => _onDragStart(details, Axis.horizontal),
      onHorizontalDragUpdate: (DragUpdateDetails details) => _onDragUpdate(details, Axis.horizontal),
      onHorizontalDragEnd: (DragEndDetails details) => _onDragEnd(details, Axis.horizontal),
      onVerticalDragStart: (DragStartDetails details) => _onDragStart(details, Axis.vertical),
      onVerticalDragUpdate: (DragUpdateDetails details) => _onDragUpdate(details, Axis.vertical),
      onVerticalDragEnd: (DragEndDetails details) => _onDragEnd(details, Axis.vertical),
      child: Stack(
        children: <Widget>[
          AbsorbPointer(
            absorbing: _shouldAbsorb(),
            child: widget.child,
          ),
          if (widget.showEpisodes)
            Align(
              alignment: Alignment.centerRight,
              child: ConstrainedBox(
                constraints: const BoxConstraints.expand(width: hMaxSlide),
                child: AnimatedBuilder(
                  animation: _horizontalController,
                  builder: (BuildContext context, Widget? child) {
                    final double offset = _horizontalController.value;
                    final double x = (1 - offset) * hMaxSlide;
                    final double opacity = offset <= .1 ? offset * 10 : 1;
                    return Transform.translate(
                      offset: Offset(x, 0),
                      child: Opacity(
                        opacity: opacity,
                        child: child,
                      ),
                    );
                  },
                  child: DrawerEpisodeList(),
                ),
              ),
            ),
          if (widget.showRecommended)
            Align(
              alignment: Alignment.bottomCenter,
              child: ConstrainedBox(
                constraints: const BoxConstraints.expand(height: vMaxSlide),
                child: AnimatedBuilder(
                  animation: _verticalController,
                  builder: (BuildContext context, Widget? child) {
                    final double y = (1 - _verticalController.value) * vMaxSlide;
                    return Transform.translate(
                      offset: Offset(0, y),
                      child: child,
                    );
                  },
                  child: DrawerRecommendedList(
                    onItemTap: () {
                      _verticalController.reverse();
                    },
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  void _onDragStart(DragStartDetails details, Axis axis) {
    if (!_canShow(axis)) return;

    final Size size = MediaQuery.of(context).size;
    final AnimationController controller = _getController(axis);

    final bool validOpenPosition = axis == Axis.horizontal
        ? details.globalPosition.dx > size.width - hMinDragStartEdge
        : details.globalPosition.dy > size.height - vMinDragStartEdge;

    final bool validClosePosition = axis == Axis.horizontal
        ? details.globalPosition.dx < size.width - hMaxDragStartEdge
        : details.globalPosition.dy < size.height - vMaxDragStartEdge;

    final bool otherClosed =
        axis == Axis.horizontal ? _verticalController.isDismissed : _horizontalController.isDismissed;

    final bool canBeDragged =
        (controller.isDismissed && validOpenPosition && otherClosed) || (controller.isCompleted && validClosePosition);

    _absorbing = canBeDragged;
    _canBeDragged(axis, set: canBeDragged);
  }

  void _onDragUpdate(DragUpdateDetails details, Axis axis) {
    if (!_canShow(axis)) return;

    if (_canBeDragged(axis)) {
      final double maxSlide = axis == Axis.vertical ? vMaxSlide : hMaxSlide;
      final double delta = (details.primaryDelta ?? 0) / maxSlide;
      _getController(axis).value -= delta;
    }
  }

  void _onDragEnd(DragEndDetails details, Axis axis) {
    if (!_canShow(axis)) return;

    final AnimationController controller = _getController(axis);

    if (controller.isDismissed || controller.isCompleted) return;

    final double size =
        axis == Axis.horizontal ? MediaQuery.of(context).size.width : MediaQuery.of(context).size.height;
    final double pixelsPerSec =
        axis == Axis.horizontal ? details.velocity.pixelsPerSecond.dx : details.velocity.pixelsPerSecond.dy;

    if (pixelsPerSec >= minFlingVelocity) {
      final double visualVelocity = pixelsPerSec / size;
      controller.fling(velocity: -visualVelocity);
    } else if (controller.value < 0.5) {
      controller.reverse();
    } else {
      controller.forward();
    }
    _absorbing = false;
  }
}

class DrawerEpisodeList extends StatefulWidget {
  @override
  _DrawerEpisodeListState createState() => _DrawerEpisodeListState();
}

class _DrawerEpisodeListState extends State<DrawerEpisodeList> {
  static const double imageWidth = 150;
  static const double imageHeight = imageWidth / 3 * 2;
  static const double radius = 8;
  static const Color backgroundColor = Colors.black26;
  static final Color activeColor = Colors.white.withOpacity(.15);

  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 1);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StreamBloc, StreamState>(
      buildWhen: (StreamState prev, StreamState curr) =>
          prev.episode != curr.episode ||
          prev.season != curr.season ||
          prev.episodeSeason != curr.episodeSeason ||
          prev.seasonFiles != curr.seasonFiles ||
          prev.movie != curr.movie,
      builder: (BuildContext context, StreamState state) {
        return state.seasonFiles != null
            ? _buildContent(
                state.seasonFiles!,
                state.episode,
                state.episodeSeason,
                state.season,
                state.movie != null ? state.movie!.seasons.map((Season e) => e.number).toList() : List<int>.empty(),
              )
            : const SizedBox.shrink();
      },
    );
  }

  Widget _buildContent(
    SeasonFiles seasonFiles,
    int episode,
    int episodeSeason,
    int season,
    List<int> seasons,
  ) {
    return PageView(
      controller: _pageController,
      children: <Widget>[
        Container(
          color: backgroundColor,
          child: _buildSeasonList(seasons, season),
        ),
        _buildEpisodeList(
          seasonFiles: seasonFiles,
          episode: episode,
          episodeSeason: episodeSeason,
          season: season,
        ),
      ],
    );
  }

  Widget _buildSeasonList(List<int> seasonNumbers, int selectedSeason) {
    return ListView.builder(
      itemCount: seasonNumbers.length + 1,
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return const SizedBox(height: 60);
        }
        final int season = seasonNumbers[index - 1];

        // ignore: deprecated_member_use
        return FlatButton(
          onPressed: () {
            _pageController.animateToPage(
              1,
              duration: shortAnimDuration,
              curve: Curves.bounceIn,
            );

            if (season != selectedSeason) {
              context.read<StreamBloc>().add(StreamEvent.seasonChanged(season));
            }
          },
          color: season == selectedSeason ? activeColor : Colors.transparent,
          minWidth: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 36),
          height: 50,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text('Season $season', style: prB19),
          ),
        );
      },
    );
  }

  Widget _buildEpisodeList({
    required SeasonFiles seasonFiles,
    required int episode,
    required int episodeSeason,
    required int season,
  }) {
    return Column(
      children: <Widget>[
        // ignore: deprecated_member_use
        FlatButton(
          onPressed: () {
            _pageController.animateToPage(
              0,
              duration: shortAnimDuration,
              curve: Curves.bounceIn,
            );
          },
          color: backgroundColor,
          minWidth: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
          height: 50,
          child: Row(
            children: <Widget>[
              const Icon(Icons.chevron_left),
              const SizedBox(width: 6),
              Text('Season $season', style: prSB18),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return _buildItem(
                context: context,
                index: index,
                episode: seasonFiles.data[index],
                isSelected: episode == index + 1 && episodeSeason == seasonFiles.season,
              );
            },
            itemCount: seasonFiles.data.length,
          ),
        ),
      ],
    );
  }

  Widget _buildItem({
    required BuildContext context,
    required int index,
    required Episode episode,
    required bool isSelected,
  }) {
    return GestureDetector(
      onTap: () => context.read<StreamBloc>().add(StreamEvent.episodeChanged(episode.episode)),
      child: Container(
        color: isSelected ? activeColor : backgroundColor,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: <Widget>[
            SafeImage(
              imageUrl: episode.poster,
              height: imageHeight,
              width: imageWidth,
              radius: radius,
            ),
            const SizedBox(width: 4),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Ep ${episode.episode}'),
                  const SizedBox(height: 12),
                  Text(
                    episode.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DrawerRecommendedList extends StatelessWidget {
  const DrawerRecommendedList({
    required this.onItemTap,
  });

  static const double imageWidth = 225;
  static const double imageHeight = imageWidth / 16 * 9;
  static const double radius = 8;

  final VoidCallback onItemTap;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StreamBloc, StreamState>(
      buildWhen: (StreamState prev, StreamState curr) => prev.related != curr.related,
      builder: (BuildContext context, StreamState state) {
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: state.related != null ? state.related!.data.length : 0,
          itemBuilder: (BuildContext context, int index) {
            return state.related != null
                ? _buildItem(context, state.related!.data[index])
                : const MovieItem();
          },
        );
      },
    );
  }

  Widget _buildItem(BuildContext context, MovieData movie) {
    return GestureDetector(
      onTap: () {
        onItemTap.call();
        context.read<StreamBloc>()
          ..add(StreamEvent.movieChanged(movie.movieId))
          ..add(const StreamEvent.seasonChanged(1))
          ..add(const StreamEvent.episodeChanged(1))
          ..add(const StreamEvent.fetchRelatedRequested());
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SafeImage(
              imageUrl: movie.availableImage ?? '',
              radius: radius,
              width: imageWidth,
              height: imageHeight,
            ),
            const SizedBox(height: 6),
            SizedBox(
              width: imageWidth,
              child: Text(
                movie.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: prSB18,
              ),
            )
          ],
        ),
      ),
    );
  }
}
