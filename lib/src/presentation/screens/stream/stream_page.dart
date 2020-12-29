import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movo/src/application/stream/stream_bloc.dart';
import 'package:movo/src/di/injection.dart';
import 'package:movo/src/domain/movie/movie_data_model.dart';
import 'package:movo/src/presentation/core/widgets/rating_duration.dart';
import 'package:movo/src/presentation/screens/stream/widgets/episode_drawer.dart';
import 'package:movo/src/presentation/screens/stream/widgets/episode_list.dart';
import 'package:movo/src/presentation/screens/stream/widgets/related_movies.dart';
import 'package:movo/src/presentation/screens/stream/widgets/season_list.dart';
import 'package:movo/src/presentation/screens/stream/widgets/video_player.dart';
import 'package:movo/src/presentation/values/colors.dart';
import 'package:movo/src/presentation/values/text_styles.dart';

class StreamPage extends StatelessWidget {
  final MovieData movie;
  final int seasonNumber;
  final int episodeNumber;
  final Duration startAt;

  const StreamPage({
    @required this.movie,
    @required this.seasonNumber,
    @required this.episodeNumber,
    @required this.startAt,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<StreamBloc>(
      create: (_) => getIt<StreamBloc>(param1: movie)
        ..add(StreamEvent.startPositionChanged(startAt))
        ..add(StreamEvent.seasonChanged(seasonNumber))
        ..add(StreamEvent.episodeChanged(episodeNumber))
        ..add(StreamEvent.fetchRelatedRequested()),
      child: StreamPageContent(movie),
    );
  }
}

class StreamPageContent extends StatefulWidget {
  final MovieData movie;

  const StreamPageContent(this.movie);

  @override
  _StreamPageContentState createState() => _StreamPageContentState();
}

class _StreamPageContentState extends State<StreamPageContent> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations(<DeviceOrientation>[
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    SystemChrome.setEnabledSystemUIOverlays(<SystemUiOverlay>[]);
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations(<DeviceOrientation>[
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setEnabledSystemUIOverlays(<SystemUiOverlay>[
      SystemUiOverlay.top,
      SystemUiOverlay.bottom,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final bool isPortrait = mediaQueryData.orientation == Orientation.portrait;

    final double playerWidth = mediaQueryData.size.width;
    final double playerHeight = isPortrait ? playerWidth * 9 / 16 : mediaQueryData.size.height;

    final List<int> seasons = widget.movie.seasons.map((Season e) => e.number).toList();

    final List<Widget> content = <Widget>[
      SizedBox(
        width: playerWidth,
        height: playerHeight,
        child: EpisodeDrawer(
          showEpisodes: !isPortrait && widget.movie.isTvShow,
          seasons: seasons,
          showRecommended: !isPortrait,
          child: VideoPlayer(widget.movie.id),
        ),
      ),
    ];

    if (isPortrait) {
      content.add(Padding(
        padding: const EdgeInsets.only(left: 12, top: 8),
        child: RatingDuration(widget.movie.imdbRating, widget.movie.duration),
      ));
      if (widget.movie.isTvShow) {
        content.addAll(<Widget>[
          SeasonList(seasonNumbers: seasons),
          EpisodeList(),
        ]);
      } else {
        content.addAll(<Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 8, top: 12),
            child: Text('Recommended', style: prB22),
          ),
          RelatedMovies(),
        ]);
      }
    }

    return Scaffold(
      backgroundColor: colorPrimary,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: content,
        ),
      ),
    );
  }
}
