import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/models/movies/movie_data.dart';
import '../../../data/model/models/movies/movies.dart';
import '../../../state/favorites/favorites_bloc.dart';
import '../../../state/home/home_bloc.dart';
import '../../core/routes/screens_navigator.dart';
import '../../core/widgets/movie_item.dart';
import '../../core/widgets/paged_list.dart';

class MoviesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (HomeState prev, HomeState curr) => prev.movies != curr.movies,
      builder: (BuildContext context, HomeState state) {
        return state.movies != null ? _buildList(state.movies!) : const SliverToBoxAdapter();
      },
    );
  }

  Widget _buildList(Movies movies) {
    return PagedList<MovieData>(
      extent: 1,
      listType: ListType.sliverBuilder,
      request: (BuildContext context) => context.read<HomeBloc>().add(const HomeEvent.moviesPageFetchRequested()),
      blankBuilder: _blankBuilder,
      itemBuilder: _itemBuilder,
      items: movies.data,
      totalCount: movies.totalCount,
      totalPages: movies.totalPages,
    );
  }

  Widget _blankBuilder(_) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 32),
      child: Center(child: CircularProgressIndicator()),
    );
  }

  Widget _itemBuilder(BuildContext context, MovieData movie) {
    return GestureDetector(
      onTap: () async {
        await ScreensNavigator.pushDetailsPage(movie.movieId);
        context.read<FavoritesBloc>().add(const FavoritesEvent.favoriteMoviesRequested());
        context.read<HomeBloc>().add(const HomeEvent.savedMoviesRequested());
      },
      child: MovieItem(
        imageUrl: movie.poster,
        name: movie.name,
        duration: movie.duration,
        plot: movie.plot,
        rating: movie.imdbRating,
        voterCount: movie.voterCount,
        releaseYear: movie.year,
      ),
    );
  }
}
