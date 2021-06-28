import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/models/search/search_result.dart';
import '../../../data/model/models/search/search_results.dart';
import '../../../state/search/search_bloc.dart';
import '../../core/routes/route_args.dart';
import '../../core/routes/routes.dart';
import '../../core/widgets/movie_item.dart';
import '../../core/widgets/paged_list.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  late ScrollController _scrollController;

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
        return state.searchResults != null ? _buildList(state.searchResults!) : const SizedBox.shrink();
      },
    );
  }

  Widget _buildList(SearchResults searchResults) {
    return Expanded(
      child: PagedList<SearchResult>(
        request: (BuildContext context) => context.read<SearchBloc>().add(const SearchEvent.nextPageRequested()),
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
