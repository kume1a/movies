import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/models/movies/movie_position.dart';
import '../../../data/model/schemas/movie/movie_data_model.dart';
import '../../../di/injection.dart';
import '../../../state/details/details_bloc.dart';
import '../../core/extensions.dart';
import '../../core/widgets/genre_list.dart';
import '../../core/widgets/rating_duration.dart';
import '../../routes/route_args.dart';
import '../../routes/routes.dart';
import '../../values/colors.dart';
import '../../values/text_styles.dart';
import 'widgets/cast_list.dart';
import 'widgets/image_header.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({@required this.movieId});

  final int movieId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DetailsBloc>(
      create: (_) {
        return getIt<DetailsBloc>(param1: movieId)
          ..add(const DetailsEvent.init())
          ..add(const DetailsEvent.movieFetchRequested())
          ..add(const DetailsEvent.castPageFetchRequested())
          ..add(const DetailsEvent.isSavedMovieRequested());
      },
      child: DetailsPageContent(),
    );
  }
}

class DetailsPageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsBloc, DetailsState>(
      buildWhen: (DetailsState prev, DetailsState curr) =>
          !prev.movieOption.equals(curr.movieOption) || !prev.moviePositionOption.equals(curr.moviePositionOption),
      builder: (BuildContext context, DetailsState state) {
        return state.movieOption.fold(
          () => const SizedBox.shrink(),
          (MovieData movie) {
            final double w = MediaQuery.of(context).size.width;
            final Widget fab = state.moviePositionOption.fold(
              () => const SizedBox.shrink(),
              (MoviePosition a) => FloatingActionButton.extended(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    Routes.streamPage,
                    arguments: StreamPageArgs(
                      movieId: a.movieId,
                      season: a.season,
                      episode: a.episode,
                      startAt: Duration(milliseconds: a.leftAt),
                    ),
                  );
                },
                backgroundColor: colorAccent,
                icon: const Icon(Icons.play_arrow_rounded, color: Colors.white),
                label: const Text('continue', style: prB15),
              ),
            );

            return Scaffold(
              backgroundColor: colorPrimary,
              floatingActionButton: AnimatedOpacity(
                duration: const Duration(seconds: 1),
                opacity: state.moviePositionOption.isSome() ? 1 : 0,
                child: fab,
              ),
              body: SafeArea(
                child: CustomScrollView(
                  slivers: <Widget>[
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: ImageHeader(
                        minExtent: 54,
                        maxExtent: w,
                        src: movie.availableImage,
                        onBackPressed: () => Navigator.pop(context),
                        onPlayPressed: movie.canBePlayed
                            ? () {
                                Navigator.pushNamed(
                                  context,
                                  Routes.streamPage,
                                  arguments: StreamPageArgs(movieId: movie.movieId),
                                );
                              }
                            : null,
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
                            child: RatingDurationYear(movie.imdbRating, movie.duration, movie.year),
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
                          const SizedBox(height: 160),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
