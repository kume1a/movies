import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

import '../../controllers/stream/stream_controller.dart';
import '../../data/model/models/movies/movie_data.dart';
import '../../data/model/models/seasons/season.dart';
import '../core/base_state.dart';
import '../core/routes/screens_navigator.dart';
import '../core/values/colors.dart';
import '../core/widgets/rating_duration.dart';
import 'widgets/widgets.dart';

class StreamPage extends StatefulWidget {
  const StreamPage();

  @override
  _StreamPageState createState() => _StreamPageState();
}

class _StreamPageState extends UIOverlaySaverState<StreamPage> {
  StreamController get controller => Get.find();

  @override
  void initState() {
    SystemChrome.setPreferredOrientations(<DeviceOrientation>[
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    SystemChrome.setEnabledSystemUIOverlays(<SystemUiOverlay>[
      SystemUiOverlay.top,
      SystemUiOverlay.bottom,
    ]);
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations(<DeviceOrientation>[
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setEnabledSystemUIOverlays(<SystemUiOverlay>[]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? appLocalizations = AppLocalizations.of(context);
    final ThemeData theme = Theme.of(context);

    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final bool isPortrait = mediaQueryData.orientation == Orientation.portrait;

    final double playerWidth = mediaQueryData.size.width;
    final double playerHeight = isPortrait ? playerWidth * 9 / 16 : mediaQueryData.size.height;

    return Obx(() {
      final MovieData? movie = controller.movie.value;

      if (movie == null) {
        return const Center(child: CircularProgressIndicator());
      }
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
        content.add(
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RatingDurationYear(
                  rating: movie.imdbRating,
                  duration: movie.duration,
                  releaseYear: movie.year,
                ),
                IconButton(
                  onPressed: () => ScreensNavigator.pushDetailsPageAndRemoveUntilRoot(movie.movieId),
                  icon: const Icon(Icons.info_outline),
                  splashRadius: 24,
                  padding: EdgeInsets.zero,
                ),
              ],
            ),
          ),
        );
        if (movie.isTvShow) {
          content.addAll(<Widget>[
            SeasonList(
              seasonNumbers: movie.seasons.map((Season e) => e.number).toList(),
            ),
            const SizedBox(height: 4),
            EpisodeList(),
          ]);
        } else {
          content.addAll(<Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 12, top: 12),
              child: Text(
                appLocalizations?.streamHeaderRecommended ?? '',
                style: theme.textTheme.headline6?.copyWith(fontWeight: FontWeight.w100),
              ),
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
    });
  }
}
