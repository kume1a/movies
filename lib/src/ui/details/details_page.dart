import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../di/injection.dart';
import '../../state/details/details_bloc.dart';
import '../core/routes/route_args.dart';
import '../core/routes/routes.dart';
import '../core/values/colors.dart';
import '../core/values/text_styles.dart';
import '../core/widgets/rating_duration.dart';
import 'widgets/widgets.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({required this.movieId});

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
          prev.movie != curr.movie || prev.moviePosition != curr.moviePosition,
      builder: (BuildContext context, DetailsState state) {
        if (state.movie == null) {
          return const SizedBox.shrink();
        }

        final double w = MediaQuery.of(context).size.width;
        final Widget fab = state.moviePosition != null
            ? FloatingActionButton.extended(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    Routes.streamPage,
                    arguments: StreamPageArgs(
                      movieId: state.moviePosition!.movieId,
                      season: state.moviePosition!.season,
                      episode: state.moviePosition!.episode,
                      startAt: Duration(milliseconds: state.moviePosition!.leftAt),
                    ),
                  );
                },
                backgroundColor: colorAccent,
                icon: const Icon(Icons.play_arrow_rounded, color: Colors.white),
                label: const Text('continue', style: prB15),
              )
            : const SizedBox.shrink();

        return Scaffold(
          backgroundColor: colorPrimary,
          floatingActionButton: AnimatedOpacity(
            duration: const Duration(seconds: 1),
            opacity: state.moviePosition != null ? 1 : 0,
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
                    src: state.movie!.availableImage ?? '',
                    onBackPressed: () => Navigator.pop(context),
                    onPlayPressed: state.movie!.canBePlayed
                        ? () {
                            Navigator.pushNamed(
                              context,
                              Routes.streamPage,
                              arguments: StreamPageArgs(movieId: state.movie!.movieId),
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
                        child: Text(state.movie!.name, style: prB32),
                      ),
                      const SizedBox(height: 4),
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: RatingDurationYear(state.movie!.imdbRating, state.movie!.duration, state.movie!.year),
                      ),
                      const SizedBox(height: 18),
                      GenreList(state.movie!.genres),
                      const SizedBox(height: 32),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(state.movie!.plot, style: pr15),
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
  }
}
