import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/models/movies/movie_data.dart';
import '../../../data/model/models/movies/movies.dart';
import '../../../data/model/schemas/core/enums.dart';
import '../../../state/favorites/favorites_bloc.dart';
import '../../../state/home/home_bloc.dart';
import '../../core/routes/screens_navigator.dart';
import '../../core/values/colors.dart';
import '../../core/values/text_styles.dart';
import '../../core/widgets/safe_image.dart';

class PopularMoviesList extends StatelessWidget {
  static const double _itemHeight = 180;
  static const double _spacing = 16;
  static const double _radius = 16;
  static const double _aspectRatio = 16 / 9;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _itemHeight,
      child: BlocBuilder<HomeBloc, HomeState>(
        buildWhen: (HomeState previous, HomeState current) => previous.popularMovies != current.popularMovies,
        builder: (BuildContext context, HomeState state) {
          return _buildList(state.popularMovies);
        },
      ),
    );
  }

  Widget _buildList(Movies? movies) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: _spacing / 2),
      scrollDirection: Axis.horizontal,
      itemCount: movies != null ? movies.data.length : 3,
      itemBuilder: (BuildContext context, int index) {
        return movies != null ? _itemBuilder(context, movies.data[index]) : _blankBuilder();
      },
    );
  }

  Widget _itemBuilder(BuildContext context, MovieData movie) {
    return GestureDetector(
      onTap: () async {
        await ScreensNavigator.pushDetailsPage(movie.movieId);
        context.read<FavoritesBloc>().add(const FavoritesEvent.favoriteMoviesRequested());
        context.read<HomeBloc>().add(const HomeEvent.savedMoviesRequested());
      },
      child: Stack(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(horizontal: _spacing / 2),
            child: AspectRatio(
              aspectRatio: _aspectRatio,
              child: SafeImage(
                imageUrl: movie.covers[ImageSize.large] ?? '',
                radius: _radius,
              ),
            ),
          ),
          Positioned(
            bottom: 12,
            left: 32,
            child: Text(movie.name, style: prB19),
          ),
        ],
      ),
    );
  }

  Widget _blankBuilder() {
    return AspectRatio(
      aspectRatio: _aspectRatio,
      child: Container(
        decoration: BoxDecoration(
          color: colorPreview,
          borderRadius: BorderRadius.circular(_radius),
        ),
        margin: const EdgeInsets.only(left: _spacing),
      ),
    );
  }
}
