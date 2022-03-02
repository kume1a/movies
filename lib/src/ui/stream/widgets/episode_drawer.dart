import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/stream/stream_controller.dart';
import '../../../core/extensions/model_l10n/movie_data_l10n_extensions.dart';
import '../../../data/model/models/movies/movie_data.dart';
import '../../../data/model/models/movies/movies.dart';
import '../../../data/model/models/seasons/episode.dart';
import '../../../data/model/models/seasons/season.dart';
import '../../../data/model/models/seasons/season_files.dart';
import '../../../l10n/parameterized_translations.dart';
import '../../core/values/text_styles.dart';
import '../../core/widgets/movie_item.dart';
import '../../core/widgets/safe_image.dart';

class EpisodeDrawer extends StatefulWidget {
  const EpisodeDrawer({
    required this.child,
    this.showEpisodes = true,
  });

  final Widget child;
  final bool showEpisodes;

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

  bool _canShow(Axis axis) {
    switch (axis) {
      case Axis.horizontal:
        return widget.showEpisodes;
      case Axis.vertical:
        return true;
    }
  }

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
    _horizontalController = AnimationController(vsync: this, duration: const Duration(milliseconds: 200));
    _verticalController = AnimationController(vsync: this, duration: const Duration(milliseconds: 200));
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
    if (!widget.showEpisodes) {
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
            AnimatedBuilder(
              animation: _horizontalController,
              builder: (BuildContext context, Widget? child) {
                final double value = _horizontalController.value;

                return value > 0
                    ? Opacity(
                        opacity: value,
                        child: child,
                      )
                    : const SizedBox.shrink();
              },
              child: GestureDetector(
                onTap: () => _horizontalController.fling(velocity: -20),
                child: Container(color: Colors.black38),
              ),
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
          AnimatedBuilder(
            animation: _verticalController,
            builder: (BuildContext context, Widget? child) {
              final double value = _verticalController.value;

              return value > 0
                  ? Opacity(
                      opacity: value,
                      child: child,
                    )
                  : const SizedBox.shrink();
            },
            child: GestureDetector(
              onTap: () => _verticalController.fling(velocity: -20),
              child: Container(color: Colors.black38),
            ),
          ),
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

  StreamController get streamController => Get.find();

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
    return Obx(
      () {
        final SeasonFiles? seasonFiles = streamController.seasonFiles.value;
        final int episode = streamController.episode.value;
        final MovieData? movie = streamController.movie.value;

        return seasonFiles != null
            ? _buildContent(
                seasonFiles: seasonFiles,
                episode: episode,
                episodeSeason: streamController.episodeSeason.value,
                season: streamController.season.value,
                seasons: movie != null ? movie.seasons.map((Season e) => e.number).toList() : List<int>.empty(),
              )
            : const SizedBox.shrink();
      },
    );
  }

  Widget _buildContent({
    required SeasonFiles seasonFiles,
    required int episode,
    required int episodeSeason,
    required int season,
    required List<int> seasons,
  }) {
    return PageView(
      controller: _pageController,
      children: <Widget>[
        Container(
          color: backgroundColor,
          child: _buildSeasonList(
            seasonNumbers: seasons,
            selectedSeason: season,
          ),
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

  Widget _buildSeasonList({
    required List<int> seasonNumbers,
    required int selectedSeason,
  }) {
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
              duration: const Duration(milliseconds: 200),
              curve: Curves.bounceIn,
            );

            if (season != selectedSeason) {
              streamController.onSeasonChanged(season);
            }
          },
          color: season == selectedSeason ? activeColor : Colors.transparent,
          minWidth: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 36),
          height: 50,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(ParameterizedTranslations.streamSeason(season), style: prB19),
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
              duration: const Duration(milliseconds: 200),
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
              Text(ParameterizedTranslations.streamSeason(season), style: prSB18),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return _buildItem(
                context,
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

  Widget _buildItem(
    BuildContext context, {
    required int index,
    required Episode episode,
    required bool isSelected,
  }) {
    return GestureDetector(
      onTap: () => streamController.onEpisodeChanged(episode.episode),
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
                  Text(ParameterizedTranslations.streamEp(episode.episode)),
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

  StreamController get streamController => Get.find();

  static const double imageWidth = 225;
  static const double imageHeight = imageWidth / 16 * 9;
  static const double radius = 8;

  final VoidCallback onItemTap;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final Movies? related = streamController.related.value;

      return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: related != null ? related.data.length : 0,
        itemBuilder: (BuildContext context, int index) =>
            related != null ? _buildItem(context, related.data[index]) : const MovieItem(),
      );
    });
  }

  Widget _buildItem(BuildContext context, MovieData movie) {
    return GestureDetector(
      onTap: () {
        onItemTap.call();
        streamController.onRelatedMoviePressed(movie.movieId);
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
                movie.getName(),
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
