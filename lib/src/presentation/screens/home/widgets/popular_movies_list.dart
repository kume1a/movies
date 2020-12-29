import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movo/src/application/home/home_bloc.dart';
import 'package:movo/src/domain/core/enums.dart';
import 'package:movo/src/domain/movie/movie_data_model.dart';
import 'package:movo/src/domain/movies/movies_model.dart';
import 'package:movo/src/presentation/core/widgets/safe_image.dart';
import 'package:movo/src/presentation/routes/route_args.dart';
import 'package:movo/src/presentation/routes/routes.dart';
import 'package:movo/src/presentation/values/colors.dart';
import 'package:movo/src/presentation/values/text_styles.dart';

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
        buildWhen: (HomeState previous, HomeState current) {
          return previous.popularMoviesOption != current.popularMoviesOption;
        },
        builder: (BuildContext context, HomeState state) {
          return _buildList(state.popularMoviesOption);
        },
      ),
    );
  }

  Widget _buildList(Option<Movies> moviesOption) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: moviesOption.fold(() => 3, (Movies a) => a.data.length),
      itemBuilder: (BuildContext context, int index) {
        return moviesOption.fold(
          () => _blankBuilder(),
          (Movies movies) => _itemBuilder(context, movies.data[index]),
        );
      },
    );
  }

  Widget _itemBuilder(BuildContext context, MovieData movie) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.detailsPage,
          arguments: DetailsPageArgs(movieId: movie.movieId),
        );
      },
      child: Stack(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(left: _spacing),
            child: AspectRatio(
              aspectRatio: _aspectRatio,
              child: SafeImage(
                imageUrl: movie.covers[ImageSize.large],
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
