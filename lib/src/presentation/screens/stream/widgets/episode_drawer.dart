import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movo/src/application/stream/stream_bloc.dart';
import 'package:movo/src/domain/actors/season_files/season_files_model.dart';
import 'package:movo/src/domain/movie/movie_data_model.dart';
import 'package:movo/src/domain/movies/movies_model.dart';
import 'package:movo/src/presentation/core/extensions.dart';
import 'package:movo/src/presentation/core/widgets/movie_item.dart';
import 'package:movo/src/presentation/core/widgets/safe_image.dart';
import 'package:movo/src/presentation/values/constants.dart';
import 'package:movo/src/presentation/values/text_styles.dart';

class EpisodeDrawer extends StatefulWidget {
  final Widget child;
  final bool showEpisodes;
  final bool showRecommended;
  final List<int> seasons;

  const EpisodeDrawer({
    @required this.child,
    @required this.seasons,
    this.showEpisodes = true,
    this.showRecommended = true,
  });

  @override
  _EpisodeDrawerState createState() => _EpisodeDrawerState();
}

class _EpisodeDrawerState extends State<EpisodeDrawer> with TickerProviderStateMixin {
  static const double minFlingVelocity = 365.0;

  static const double hMaxSlide = 280;
  static const double hMinDragStartEdge = 100;
  static const double hMaxDragStartEdge = hMaxSlide - 16;

  static const double vMaxSlide = 185;
  static const double vMinDragStartEdge = 120;
  static const double vMaxDragStartEdge = vMaxSlide - 16;

  AnimationController _horizontalController;
  bool _canBeDraggedHorizontally = false;

  AnimationController _verticalController;
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
  bool _canBeDragged(Axis axis, {bool set}) {
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
      onHorizontalDragUpdate: (DragUpdateDetails details) =>
          _onDragUpdate(details, Axis.horizontal),
      onHorizontalDragEnd: (DragEndDetails details) => _onDragEnd(details, Axis.horizontal),
      onVerticalDragStart: (DragStartDetails details) => _onDragStart(details, Axis.vertical),
      onVerticalDragUpdate: (DragUpdateDetails details) => _onDragUpdate(details, Axis.vertical),
      onVerticalDragEnd: (DragEndDetails details) => _onDragEnd(details, Axis.vertical),
      child: Stack(
        children: <Widget>[
          AbsorbPointer(
            child: widget.child,
            absorbing: _shouldAbsorb(),
          ),
          if (widget.showEpisodes)
            Align(
              alignment: Alignment.centerRight,
              child: ConstrainedBox(
                constraints: const BoxConstraints.expand(width: hMaxSlide),
                child: AnimatedBuilder(
                  animation: _horizontalController,
                  child: DrawerEpisodeList(widget.seasons),
                  builder: (BuildContext context, Widget child) {
                    double x = (1 - _horizontalController.value) * hMaxSlide;
                    return Transform.translate(
                      offset: Offset(x, 0),
                      child: child,
                    );
                  },
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
                  child: DrawerRecommendedList(),
                  builder: (BuildContext context, Widget child) {
                    double y = (1 - _verticalController.value) * vMaxSlide;
                    return Transform.translate(
                      offset: Offset(0, y),
                      child: child,
                    );
                  },
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

    final bool otherClosed = axis == Axis.horizontal
        ? _verticalController.isDismissed
        : _horizontalController.isDismissed;

    final bool canBeDragged = (controller.isDismissed && validOpenPosition && otherClosed) ||
        (controller.isCompleted && validClosePosition);

    _absorbing = canBeDragged;
    _canBeDragged(axis, set: canBeDragged);
  }

  void _onDragUpdate(DragUpdateDetails details, Axis axis) {
    if (!_canShow(axis)) return;

    if (_canBeDragged(axis)) {
      double maxSlide = axis == Axis.vertical ? vMaxSlide : hMaxSlide;
      double delta = details.primaryDelta / maxSlide;
      _getController(axis).value -= delta;
    }
  }

  void _onDragEnd(DragEndDetails details, Axis axis) {
    if (!_canShow(axis)) return;

    AnimationController controller = _getController(axis);

    if (controller.isDismissed || controller.isCompleted) return;

    final double size = axis == Axis.horizontal
        ? MediaQuery.of(context).size.width
        : MediaQuery.of(context).size.height;
    final double pixelsPerSec = axis == Axis.horizontal
        ? details.velocity.pixelsPerSecond.dx
        : details.velocity.pixelsPerSecond.dy;

    if (pixelsPerSec >= minFlingVelocity) {
      double visualVelocity = pixelsPerSec / size;
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
  final List<int> seasons;

  const DrawerEpisodeList(this.seasons);

  @override
  _DrawerEpisodeListState createState() => _DrawerEpisodeListState();
}

class _DrawerEpisodeListState extends State<DrawerEpisodeList> {
  static const double imageWidth = 150;
  static const double imageHeight = imageWidth / 3 * 2;
  static const double radius = 8;
  static const Color backgroundColor = Colors.black26;
  static final Color activeColor = Colors.white.withOpacity(.15);

  PageController _pageController;

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
          prev.episodeSeason != curr.episodeSeason,
      builder: (BuildContext context, StreamState state) {
        return state.seasonFilesOption.fold(
          () => const SizedBox.shrink(),
          (SeasonFiles a) => _buildContent(
            a,
            state.episode,
            state.episodeSeason,
            state.season,
          ),
        );
      },
    );
  }

  Widget _buildContent(SeasonFiles seasonFiles, int episode, int episodeSeason, int season) {
    return PageView(
      controller: _pageController,
      children: <Widget>[
        Container(
          color: backgroundColor,
          child: _buildSeasonList(widget.seasons, season),
        ),
        _buildEpisodeList(seasonFiles, episode, episodeSeason, season),
      ],
    );
  }

  Widget _buildSeasonList(List<int> seasonNumbers, int selectedSeason) {
    return ListView.builder(
      itemCount: seasonNumbers.length + 1,
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return SizedBox(height: 60);
        }
        int season = seasonNumbers[index - 1];

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

  Widget _buildEpisodeList(SeasonFiles seasonFiles, int episode, int episodeSeason, int season) {
    return Column(
      children: <Widget>[
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
              Icon(Icons.chevron_left),
              const SizedBox(width: 6),
              Text('Season $season', style: prSB18),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return _buildItem(
                context,
                index,
                seasonFiles.data[index],
                episode == index && episodeSeason == seasonFiles.season,
              );
            },
            itemCount: seasonFiles.data.length,
          ),
        ),
      ],
    );
  }

  Widget _buildItem(BuildContext context, int index, Episode episode, bool selected) {
    return GestureDetector(
      onTap: () => context.read<StreamBloc>().add(StreamEvent.episodeChanged(index)),
      child: Container(
        color: selected ? activeColor : backgroundColor,
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
                    style:
                        TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
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
  static const double imageWidth = 225;
  static const double imageHeight = imageWidth / 16 * 9;
  static const double radius = 8;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StreamBloc, StreamState>(
      buildWhen: (StreamState prev, StreamState curr) =>
          !prev.relatedOption.equals(curr.relatedOption),
      builder: (BuildContext context, StreamState state) {
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: state.relatedOption.fold(() => 0, (Movies movies) => movies.data.length),
          itemBuilder: (BuildContext context, int index) {
            return state.relatedOption.fold(
              () => const MovieItem(),
              (Movies movies) => _buildItem(context, movies.data[index]),
            );
          },
        );
      },
    );
  }

  Widget _buildItem(BuildContext context, MovieData movie) {
    return GestureDetector(
      onTap: () {
        context.read<StreamBloc>()
          ..add(StreamEvent.movieChanged(movie))
          ..add(StreamEvent.seasonChanged(1))
          ..add(StreamEvent.episodeChanged(0))
          ..add(StreamEvent.fetchRelatedRequested());
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SafeImage(
              imageUrl: movie.availableImage,
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
