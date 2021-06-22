import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/schemas/search/search_results_model.dart';
import '../../../../state/search/search_bloc.dart';
import '../../../core/widgets/movie_item.dart';
import '../../../core/widgets/paged_list.dart';
import '../../../routes/route_args.dart';
import '../../../routes/routes.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchBloc, SearchState>(
      listenWhen: (SearchState previous, SearchState current) => previous.query != current.query,
      listener: (BuildContext context, SearchState state) {
        if (_scrollController.hasClients) {
          _scrollController.jumpTo(0);
        }
      },
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
        scrollController: _scrollController,
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
        Navigator.pushNamed(
          context,
          Routes.detailsPage,
          arguments: DetailsPageArgs(movieId: searchResult.movieId),
        );
      },
      child: item,
    );
  }
}
