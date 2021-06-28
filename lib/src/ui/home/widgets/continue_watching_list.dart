import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/models/movies/saved_movie.dart';
import '../../../state/home/home_bloc.dart';
import '../../core/formatters.dart';
import '../../core/routes/screens_navigator.dart';
import '../../core/values/colors.dart';
import '../../core/values/text_styles.dart';
import '../../core/widgets/safe_image.dart';

class ContinueWatchingList extends StatelessWidget {
  static const double itemWidth = 230;
  static const double imageHeight = itemWidth / 16 * 9;
  static const double itemHeight = imageHeight + 50;
  static const double radius = 8;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (HomeState prev, HomeState curr) =>
          !const DeepCollectionEquality().equals(prev.savedMovies, curr.savedMovies),
      builder: (BuildContext context, HomeState state) {
        return state.savedMovies != null
            ? state.savedMovies!.isNotEmpty
                ? _buildList(state.savedMovies!)
                : const SizedBox.shrink()
            : const SizedBox.shrink();
      },
    );
  }

  Widget _buildList(List<SavedMovie> savedMovies) {
    return SizedBox(
      height: itemHeight,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: savedMovies.length,
        itemBuilder: (BuildContext context, int index) {
          return _itemBuilder(context, savedMovies[index]);
        },
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, SavedMovie savedMovie) {
    String bottomDetailText = formatVideoDuration(savedMovie.position.leftAt);
    if (savedMovie.position.isTvShow) {
      final int s = savedMovie.position.season;
      final int e = savedMovie.position.episode;
      bottomDetailText += '\t--\t${s}x${e < 10 ? '0$e' : e}';
    }

    return GestureDetector(
      onTap: () => ScreensNavigator.pushStreamPage(
        movieId: savedMovie.position.movieId,
        season: savedMovie.position.season,
        episode: savedMovie.position.episode,
        leftAt: savedMovie.position.leftAt,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 16),
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
                        value: savedMovie.position.leftAt /
                            (savedMovie.position.durationInMillis != 0 ? savedMovie.position.durationInMillis : 60000),
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
                )),
            const SizedBox(height: 2),
            Text('left at $bottomDetailText', style: sc11),
          ],
        ),
      ),
    );
  }

// Widget _blankBuilder(_) {
//   return Padding(
//     padding: const EdgeInsets.only(left: 16),
//     child: Align(
//       alignment: Alignment.topCenter,
//       child: BlankContainer(
//         width: itemWidth,
//         height: imageHeight,
//         color: colorPreview,
//         radius: radius,
//       ),
//     ),
//   );
// }
}
