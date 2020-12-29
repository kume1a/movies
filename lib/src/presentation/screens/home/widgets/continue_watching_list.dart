import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movo/src/application/home/home_bloc.dart';
import 'package:movo/src/domain/movie_position/saved_movies.dart';
import 'package:movo/src/presentation/core/extensions.dart';
import 'package:movo/src/presentation/core/formatters.dart';
import 'package:movo/src/presentation/core/widgets/safe_image.dart';
import 'package:movo/src/presentation/routes/route_args.dart';
import 'package:movo/src/presentation/routes/routes.dart';
import 'package:movo/src/presentation/values/colors.dart';
import 'package:movo/src/presentation/values/text_styles.dart';

class ContinueWatchingList extends StatelessWidget {
  static const double itemWidth = 230;
  static const double imageHeight = itemWidth / 16 * 9;
  static const double itemHeight = imageHeight + 50;
  static const double radius = 8;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (HomeState prev, HomeState curr) =>
          !prev.savedMoviesOption.equals(curr.savedMoviesOption),
      builder: (BuildContext context, HomeState state) {
        return state.savedMoviesOption.fold(
          () => const SizedBox.shrink(),
          (List<SavedMovie> a) => a.isNotEmpty ? _buildList(a) : const SizedBox.shrink(),
        );
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
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.streamPage,
          arguments: StreamPageArgs(
            movie: savedMovie.data,
            seasonNumber: savedMovie.position.seasonNumber,
            episodeNumber: savedMovie.position.episodeNumber,
            startAt: Duration(milliseconds: savedMovie.position.leftAt),
          ),
        );
      },
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
                            (savedMovie.position.durationInMillis != 0
                                ? savedMovie.position.durationInMillis
                                : 60000),
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
            Text('left at ${formatVideoDuration(savedMovie.position.leftAt)}', style: sc11),
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
