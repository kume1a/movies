import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movo/src/application/details/details_bloc.dart';
import 'package:movo/src/domain/movie/movie_data_model.dart';
import 'package:movo/src/presentation/core/widgets/genre_list.dart';
import 'package:movo/src/presentation/core/widgets/rating_duration.dart';
import 'package:movo/src/presentation/routes/route_args.dart';
import 'package:movo/src/presentation/routes/routes.dart';
import 'package:movo/src/presentation/screens/details/widgets/cast_list.dart';
import 'package:movo/src/presentation/screens/details/widgets/image_header.dart';
import 'package:movo/src/presentation/values/colors.dart';
import 'package:movo/src/presentation/values/text_styles.dart';

class DetailsPageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final Widget content = BlocBuilder<DetailsBloc, DetailsState>(
      builder: (BuildContext context, DetailsState state) {
        final Option<MovieData> movieOption = state.movieOption;

        return movieOption.fold(
          () => const SizedBox.shrink(), // TODO: change
          (MovieData movie) {
            final double w = MediaQuery.of(context).size.width;

            return CustomScrollView(
              slivers: <Widget>[
                SliverPersistentHeader(
                  pinned: true,
                  delegate: ImageHeader(
                    minExtent: 54,
                    maxExtent: w,
                    src: movie.availableImage,
                    onBackPressed: () => Navigator.pop(context),
                    onPlayPressed: () {
                      Navigator.pushNamed(
                        context,
                        Routes.streamPage,
                        arguments: StreamPageArgs(movie: movie),
                      );
                    },
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(movie.name, style: prB32),
                      ),
                      const SizedBox(height: 4),
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: RatingDuration(movie.imdbRating, movie.duration),
                      ),
                      const SizedBox(height: 18),
                      GenreList(movie.genres),
                      const SizedBox(height: 32),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(movie.plot, style: pr15),
                      ),
                      const SizedBox(height: 32),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text('Cast', style: prB22),
                      ),
                      const SizedBox(height: 16),
                      CastList(),
                      const SizedBox(height: 120),
                    ],
                  ),
                )
              ],
            );
          },
        );
      },
    );

    return Scaffold(
      backgroundColor: colorPrimary,
      body: SafeArea(child: content),
    );
  }
}
