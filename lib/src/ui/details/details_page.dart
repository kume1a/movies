import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../di/injection.dart';
import '../../state/details/details_bloc.dart';
import '../core/routes/screens_navigator.dart';
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
          ..add(const DetailsEvent.castPageFetchRequested());
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
        final double w = MediaQuery.of(context).size.width;
        final Widget fab = state.movie != null && state.moviePosition != null
            ? FloatingActionButton.extended(
                onPressed: () => ScreensNavigator.pushStreamPage(
                  movieId: state.moviePosition!.movieId,
                  episode: state.moviePosition!.season,
                  season: state.moviePosition!.season,
                  leftAt: state.moviePosition!.leftAt,
                ),
                backgroundColor: colorAccent,
                icon: const Icon(Icons.play_arrow_rounded, color: Colors.white),
                label: const Text('Continue', style: prB15),
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
                    src: state.movie?.availableImage ?? '',
                    canBePlayed: state.movie?.canBePlayed ?? true,
                    onPlayPressed: () {
                      if (state.movie != null) {
                        ScreensNavigator.pushStreamPage(movieId: state.movie!.movieId);
                      }
                    },
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(state.movie?.name ?? '', style: prB32),
                      ),
                      const SizedBox(height: 4),
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: RatingDurationYear(
                          rating: state.movie?.imdbRating,
                          duration: state.movie?.duration,
                          releaseYear: state.movie?.year,
                        ),
                      ),
                      const SizedBox(height: 18),
                      GenreList(genres: state.movie?.genres ?? List<String>.empty()),
                      const SizedBox(height: 32),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(state.movie?.plot ?? '', style: pr15),
                      ),
                      const SizedBox(height: 32),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: CastHeader(),
                      ),
                      const SizedBox(height: 16),
                      CastList(),
                      const SizedBox(height: 260),
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
