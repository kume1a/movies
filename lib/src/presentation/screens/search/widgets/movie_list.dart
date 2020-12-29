import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movo/src/application/search/search_bloc.dart';
import 'package:movo/src/domain/search/search_results_model.dart';
import 'package:movo/src/presentation/core/widgets/movie_item.dart';
import 'package:movo/src/presentation/core/widgets/paged_list.dart';
import 'package:movo/src/presentation/routes/route_args.dart';
import 'package:movo/src/presentation/routes/routes.dart';

class MovieList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (BuildContext context, SearchState state) {
        return state.searchResultsOption.fold(
          () => const SizedBox.shrink(),
          (SearchResults searchResults) => _buildList(searchResults),
        );
      },
    );
  }

  Widget _buildList(SearchResults searchResults) {
    return Expanded(
      child: PagedList<SearchResult>(
        request: (BuildContext context) =>
            context.read<SearchBloc>().add(const SearchEvent.nextPageRequested()),
        blankBuilder: _blankBuilder,
        itemBuilder: _itemBuilder,
        items: searchResults.results,
        totalCount: searchResults.totalCount,
        totalPages: searchResults.totalPages,
      ),
    );
  }

  Widget _blankBuilder(_) {
    return const MovieItem();
  }

  Widget _itemBuilder(BuildContext context, SearchResult searchResult) {
    final Widget item = MovieItem(
      imageUrl: searchResult.image,
      name: searchResult.name,
      plot: searchResult.description,
    );

    return GestureDetector(
      onTap: () {
        context.read<SearchBloc>().add(SearchEvent.searchResultSelected(searchResult));
        return Navigator.pushNamed(
          context,
          Routes.detailsPage,
          arguments: DetailsPageArgs(movieId: searchResult.movieId),
        );
      },
      child: item,
    );
  }
}
