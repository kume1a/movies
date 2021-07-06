import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../data/model/models/movies/saved_movie.dart';
import '../../../state/home/home_bloc.dart';
import '../../core/formatters.dart';
import '../../core/routes/screens_navigator.dart';
import '../../core/values/colors.dart';
import '../../core/values/text_styles.dart';
import '../../core/widgets/safe_image.dart';

class ContinueWatchingList extends StatelessWidget {
  const ContinueWatchingList({Key? key}) : super(key: key);

  static const double itemWidth = 230;
  static const double imageHeight = itemWidth / 16 * 9;
  static const double itemHeight = imageHeight + 50;
  static const double radius = 8;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (HomeState prev, HomeState curr) =>
          !const DeepCollectionEquality().equals(prev.savedMovies, curr.savedMovies),
      builder: (BuildContext context, HomeState state) =>
          state.savedMovies?.isNotEmpty == true ? _buildList(context, state.savedMovies!) : const SizedBox.shrink(),
    );
  }

  Widget _buildList(BuildContext context, List<SavedMovie> savedMovies) {
    return VisibilityDetector(
      key: UniqueKey(),
      onVisibilityChanged: (VisibilityInfo info) =>
          context.read<HomeBloc>().add(const HomeEvent.refreshSavedMoviesRequested()),
      child: SizedBox(
        height: itemHeight,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: savedMovies.length,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          itemBuilder: (BuildContext context, int index) {
            final SavedMovie savedMovie = savedMovies[index];

            String bottomDetailText = formatVideoDuration(savedMovie.position.leftAt);
            if (savedMovie.position.isTvShow) {
              final int s = savedMovie.position.season;
              final int e = savedMovie.position.episode;
              bottomDetailText += '\t--\t${s}x${e < 10 ? '0$e' : e}';
            }

            final double progress = savedMovie.position.durationInMillis != 0
                ? savedMovie.position.leftAt / savedMovie.position.durationInMillis
                : 0;

            return GestureDetector(
              onTap: () => ScreensNavigator.pushStreamPage(
                movieId: savedMovie.position.movieId,
                season: savedMovie.position.season,
                episode: savedMovie.position.episode,
                leftAt: savedMovie.position.leftAt,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(radius),
                      child: Stack(
                        children: <Widget>[
                          SafeImage(
                            imageUrl: savedMovie.data.availableImage,
                            width: itemWidth,
                            height: imageHeight,
                          ),
                          Positioned(
                            bottom: 0,
                            child: SizedBox(
                              width: itemWidth,
                              child: LinearProgressIndicator(
                                backgroundColor: colorInactive,
                                value: progress,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 6),
                    SizedBox(
                      width: itemWidth,
                      child: Text(
                        savedMovie.data.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: prSB18,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text('left at $bottomDetailText', style: sc11),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
