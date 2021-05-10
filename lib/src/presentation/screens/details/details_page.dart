import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movo/src/application/details/details_bloc.dart';
import 'package:movo/src/di/injection.dart';
import 'package:movo/src/domain/movie/movie_data_model.dart';
import 'package:movo/src/domain/movie_position/movie_position_model.dart';
import 'package:movo/src/presentation/core/extensions.dart';
import 'package:movo/src/presentation/core/widgets/genre_list.dart';
import 'package:movo/src/presentation/core/widgets/rating_duration.dart';
import 'package:movo/src/presentation/routes/route_args.dart';
import 'package:movo/src/presentation/routes/routes.dart';
import 'package:movo/src/presentation/screens/details/widgets/cast_list.dart';
import 'package:movo/src/presentation/screens/details/widgets/image_header.dart';
import 'package:movo/src/presentation/values/colors.dart';
import 'package:movo/src/presentation/values/text_styles.dart';

class DetailsPage extends StatelessWidget {
  final int movieId;

  const DetailsPage({@required this.movieId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DetailsBloc>(
      create: (_) {
        final DetailsBloc bloc = getIt<DetailsBloc>(param1: movieId);
        return bloc
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
