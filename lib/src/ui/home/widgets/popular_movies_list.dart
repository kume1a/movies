import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/enums/image_size.dart';
import '../../../data/model/models/movies/movie_data.dart';
import '../../../state/home/home_bloc.dart';
import '../../core/routes/screens_navigator.dart';
import '../../core/values/colors.dart';
import '../../core/values/text_styles.dart';
import '../../core/widgets/carousel.dart';
import '../../core/widgets/safe_image.dart';

class PopularMoviesList extends StatelessWidget {
  const PopularMoviesList({Key? key}) : super(key: key);

  static const double _itemHeight = 180;
  static const double _itemWidth = 180 / 9 * 16;
  static const double _radius = 16;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (HomeState previous, HomeState current) => previous.popularMovies != current.popularMovies,
      builder: (BuildContext context, HomeState state) {
        return Carousel(
          height: _itemHeight,
          itemCount: state.popularMovies != null ? state.popularMovies!.data.length : 3,
          distortionValue: .2,
          itemBuilder: (BuildContext context, int index) {
            return state.popularMovies != null
                ? _itemBuilder(context, state.popularMovies!.data[index])
                : _blankBuilder();
          },
        );
      },
    );
  }

  Widget _itemBuilder(BuildContext context, MovieData movie) {
    return GestureDetector(
      onTap: () => ScreensNavigator.pushDetailsPage(movie.movieId),
      child: Stack(
        children: <Widget>[
          Container(
            foregroundDecoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[Colors.transparent, Colors.black38],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: <double>[.7, 1],
              ),
            ),
            width: _itemWidth,
            height: _itemHeight,
            child: SafeImage(
              imageUrl: movie.covers[ImageSize.large] ?? '',
              radius: _radius,
            ),
          ),
          Positioned(
            bottom: 12,
            left: 24,
            child: Text(movie.name, style: prB19),
          ),
        ],
      ),
    );
  }

  Widget _blankBuilder() {
    return Container(
      width: _itemWidth,
      height: _itemHeight,
      decoration: BoxDecoration(
        color: colorPreview,
        borderRadius: BorderRadius.circular(_radius),
      ),
    );
  }
}
