import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../data/model/models/seasons/season.dart';
import '../../di/injection.dart';
import '../../state/stream/stream_bloc.dart';
import '../core/base_state.dart';
import '../core/routes/screens_navigator.dart';
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
        ..add(const StreamEvent.init())
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
    final AppLocalizations? appLocalizations = AppLocalizations.of(context);

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
      buildWhen: (StreamState previous, StreamState current) => previous.movie != current.movie,
      builder: (BuildContext context, StreamState state) {
        if (state.movie == null) {
          return const Center(child: CircularProgressIndicator());
        }
        final List<Widget> content = <Widget>[
          SizedBox(
            width: playerWidth,
            height: playerHeight,
            child: EpisodeDrawer(
              showEpisodes: !isPortrait && state.movie!.isTvShow,
              showRecommended: !isPortrait,
              child: VideoPlayer(state.movie!.id),
            ),
          ),
        ];

        if (isPortrait) {
          content.add(Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RatingDurationYear(
                  rating: state.movie!.imdbRating,
                  duration: state.movie!.duration,
                  releaseYear: state.movie!.year,
                ),
                IconButton(
                  onPressed: () => ScreensNavigator.pushDetailsPageAndRemoveUntilRoot(state.movie!.movieId),
                  icon: const Icon(Icons.info_outline),
                  splashRadius: 24,
                  padding: EdgeInsets.zero,
                ),
              ],
            ),
          ));
          if (state.movie!.isTvShow) {
            content.addAll(<Widget>[
              SeasonList(
                seasonNumbers: state.movie!.seasons.map((Season e) => e.number).toList(),
              ),
              const SizedBox(height: 4),
              EpisodeList(),
            ]);
          } else {
            content.addAll(<Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 16, bottom: 4),
                child: Text(appLocalizations?.streamHeaderRecommended ?? '', style: prB22),
              ),
              RelatedMovies(),
            ]);
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
  }
}
