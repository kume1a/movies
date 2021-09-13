import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/search/search_controller.dart';
import '../../../core/extensions/model_l10n/search_result_l10n_extensions.dart';
import '../../../data/model/models/search/search_result.dart';
import '../../../data/model/models/search/search_results.dart';
import '../../core/widgets/movie_item.dart';
import '../../core/widgets/paged_list.dart';

class MovieList extends GetView<SearchController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.searchResults.value != null
          ? _buildList(controller.searchResults.value!)
          : const SizedBox.shrink(),
    );
  }

  Widget _buildList(SearchResults searchResults) {
    return Expanded(
      child: PagedList<SearchResult>(
        request: (BuildContext context) => controller.onNextPageRequested(),
        blankBuilder: (_) => const MovieItem(),
        itemBuilder: _itemBuilder,
        items: searchResults.results,
        totalCount: searchResults.totalCount,
        totalPages: searchResults.totalPages,
        scrollController: controller.scrollController,
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, SearchResult searchResult) {
    return GestureDetector(
      onTap: () => controller.onSearchResultSelected(searchResult),
      child: MovieItem(
        imageUrl: searchResult.image,
        name: searchResult.getName(context),
        plot: searchResult.getDescription(context),
      ),
    );
  }
}
