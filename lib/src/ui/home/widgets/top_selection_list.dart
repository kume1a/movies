import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/models/movies/movie_data.dart';
import '../../../data/model/models/movies/movies.dart';
import '../../../state/home/home_bloc.dart';
import '../../core/routes/route_args.dart';
import '../../core/routes/routes.dart';
import '../../core/values/text_styles.dart';
import '../../core/widgets/blank_container.dart';
import '../../core/widgets/paged_list.dart';
import '../../core/widgets/safe_image.dart';

class TopSelectionList extends StatelessWidget {
  static const double itemWidth = 110;
  static const double imageHeight = itemWidth / 3 * 4;
  static const double itemHeight = imageHeight + 55;
  static const double radius = 12;
  static const double spacing = 16;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: itemHeight,
      child: BlocBuilder<HomeBloc, HomeState>(
        buildWhen: (HomeState prev, HomeState cur) => prev.topMoviesOption != cur.topMoviesOption,
        builder: (BuildContext context, HomeState state) => state.topMoviesOption.fold(
          () {
            return ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, __) {
                return _blankBuilder(null);
              },
            );
          },
          (Movies a) => _buildList(a),
        ),
      ),
    );
  }

  Widget _buildList(Movies movies) {
    return PagedList<MovieData>(
      axis: Axis.horizontal,
      request: (BuildContext context) =>
          context.read<HomeBloc>().add(const HomeEvent.topMoviesPageFetchRequested()),
      blankBuilder: _blankBuilder,
      itemBuilder: _itemBuilder,
      items: movies.data,
      totalCount: movies.totalCount,
      totalPages: movies.totalPages,
      padding: const EdgeInsets.symmetric(horizontal: spacing / 2),
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: spacing / 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SafeImage(
              imageUrl: movie.poster,
              width: itemWidth,
              height: imageHeight,
              radius: radius,
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: itemWidth,
              child: Text(
                movie.name,
                style: prSB13,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _blankBuilder(_) {
    return const Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(left: 16),
        child: BlankContainer(
          width: itemWidth,
          height: imageHeight,
          radius: radius,
        ),
      ),
    );
  }
}
