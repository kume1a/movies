import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../core/extensions/model_l10n/movie_data_l10n_extensions.dart';
import '../../../data/model/models/movies/movie_data.dart';
import '../../../state/favorites/favorites_bloc.dart';
import '../../core/routes/screens_navigator.dart';
import '../../core/widgets/movie_item.dart';

class MovieList extends StatelessWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? appLocalizations = AppLocalizations.of(context);

    return BlocBuilder<FavoritesBloc, FavoritesState>(
      buildWhen: (FavoritesState previous, FavoritesState current) =>
          !const DeepCollectionEquality().equals(previous.movies, current.movies),
      builder: (BuildContext context, FavoritesState state) {
        if (state.movies == null) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.movies!.isEmpty) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(appLocalizations?.favoritesNoMovieHeader ?? '', style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 8),
                Wrap(
                  alignment: WrapAlignment.center,
                  runSpacing: 8,
                  children: <Widget>[
                    Text(appLocalizations?.favoritesClick ?? '', style: const TextStyle(fontSize: 16)),
                    const SizedBox(width: 12),
                    const Icon(Icons.library_add),
                    const SizedBox(width: 12),
                    Text(appLocalizations?.favoritesNoMoviesMessageEnd ?? '', style: const TextStyle(fontSize: 16))
                  ],
                ),
              ],
            ),
          );
        }

        return VisibilityDetector(
          key: UniqueKey(),
          onVisibilityChanged: (VisibilityInfo info) {
            if (info.visibleFraction == 1) {
              context.read<FavoritesBloc>().add(const FavoritesEvent.refreshData());
            }
          },
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: state.movies!.length,
            itemBuilder: (BuildContext context, int index) => _itemBuilder(context, state.movies![index]),
          ),
        );
      },
    );
  }

  Widget _itemBuilder(BuildContext context, MovieData movie) {
    return GestureDetector(
      onTap: () => ScreensNavigator.pushDetailsPage(movie.movieId),
      child: MovieItem(
        imageUrl: movie.poster,
        name: movie.getName(context),
        duration: movie.duration,
        plot: movie.getPlot(context),
        rating: movie.imdbRating,
        voterCount: movie.voterCount,
        releaseYear: movie.year,
      ),
    );
  }
}
