import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../data/model/schemas/movie/movie_data_model.dart';
import '../../di/injection.dart';
import '../../state/stream/stream_bloc.dart';
import '../core/base_state.dart';
import '../core/values/colors.dart';
import '../core/values/text_styles.dart';
import '../core/widgets/rating_duration.dart';
import 'widgets/widgets.dart';

class StreamPage extends StatelessWidget {
  const StreamPage({
    required this.movieId,
    required this.season,
    required this.episode,
    required this.startAt,
  });

  final int movieId;
  final int season;
  final int episode;
  final Duration startAt;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<StreamBloc>(
      create: (_) => getIt<StreamBloc>()
        ..add(StreamEvent.movieChanged(movieId))
        ..add(StreamEvent.startPositionChanged(startAt))
        ..add(StreamEvent.seasonChanged(season))
        ..add(StreamEvent.episodeChanged(episode))
        ..add(const StreamEvent.fetchRelatedRequested()),
      child: StreamPageContent(),
    );
  }
}

class StreamPageContent extends StatefulWidget {
  @override
  _StreamPageContentState createState() => _StreamPageContentState();
}

class _StreamPageContentState extends UIOverlaySaverState<StreamPageContent> {
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

    return BlocConsumer<StreamBloc, StreamState>(
      listenWhen: (StreamState previous, StreamState current) =>
          previous.shouldShowPermissionDeniedMessage != current.shouldShowPermissionDeniedMessage ||
          previous.shouldShowDownloadStartedMessage != current.shouldShowDownloadStartedMessage,
      listener: (BuildContext context, StreamState state) {
        if (state.shouldShowPermissionDeniedMessage) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('Grant storage permission to download'),
              action: SnackBarAction(
                label: 'settings',
                onPressed: () => openAppSettings(),
              ),
              duration: const Duration(seconds: 6),
            ),
          );
        }

        if (state.shouldShowDownloadStartedMessage) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Download started'),
            ),
          );
        }

        context.read<StreamBloc>().add(const StreamEvent.removeMessages());
      },
      builder: (BuildContext context, StreamState state) {
        return state.movie.fold(
          () => const CircularProgressIndicator(),
          (MovieData movie) {
            final List<Widget> content = <Widget>[
              SizedBox(
                width: playerWidth,
                height: playerHeight,
                child: EpisodeDrawer(
                  showEpisodes: !isPortrait && movie.isTvShow,
                  showRecommended: !isPortrait,
                  child: VideoPlayer(movie.id),
                ),
              ),
            ];

            if (isPortrait) {
              content.add(Padding(
                padding: const EdgeInsets.only(left: 12, top: 16),
                child: RatingDurationYear(movie.imdbRating, movie.duration, movie.year),
              ));
              if (movie.isTvShow) {
                content.addAll(<Widget>[
                  const SizedBox(height: 10),
                  SeasonList(
                    seasonNumbers: movie.seasons.map((Season e) => e.number).toList(),
                  ),
                  const SizedBox(height: 4),
                  EpisodeList(),
                ]);
              } else {
                content.add(const Padding(
                  padding: EdgeInsets.only(left: 16, top: 16),
                  child: Text('Recommended', style: prB22),
                ));
                content.add(RelatedMovies());
              }
            }

            return Scaffold(
              backgroundColor: colorPrimary,
              resizeToAvoidBottomInset: false,
              body: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: content,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
