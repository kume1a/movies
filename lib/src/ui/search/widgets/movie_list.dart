import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../core/extensions/search_result_l10n_extensions.dart';
import '../../../data/model/models/search/search_result.dart';
import '../../../data/model/models/search/search_results.dart';
import '../../../state/search/search_bloc.dart';
import '../../core/routes/screens_navigator.dart';
import '../../core/widgets/movie_item.dart';
import '../../core/widgets/paged_list.dart';

class MovieList extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = useScrollController();

    return BlocConsumer<SearchBloc, SearchState>(
      listenWhen: (SearchState previous, SearchState current) => previous.query != current.query,
      listener: (BuildContext context, SearchState state) {
        if (scrollController.hasClients) {
          scrollController.jumpTo(0);
        }
      },
      builder: (BuildContext context, SearchState state) {
        return state.searchResults != null
            ? _buildList(scrollController, state.searchResults!)
            : const SizedBox.shrink();
      },
    );
  }

  Widget _buildList(ScrollController scrollController, SearchResults searchResults) {
    return Expanded(
      child: PagedList<SearchResult>(
        request: (BuildContext context) => context.read<SearchBloc>().add(const SearchEvent.nextPageRequested()),
        blankBuilder: (_) => const MovieItem(),
        itemBuilder: _itemBuilder,
        items: searchResults.results,
        totalCount: searchResults.totalCount,
        totalPages: searchResults.totalPages,
        scrollController: scrollController,
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, SearchResult searchResult) {
    return GestureDetector(
      onTap: () {
        context.read<SearchBloc>().add(SearchEvent.searchResultSelected(searchResult));
        ScreensNavigator.pushDetailsPage(searchResult.movieId);
      },
      child: MovieItem(
        imageUrl: searchResult.image,
        name: searchResult.getName(context),
        plot: searchResult.getDescription(context),
      ),
    );
  }
}
