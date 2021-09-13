import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

import '../../../controllers/add_movie/add_movie_controller.dart';
import '../../../core/extensions/model_l10n/search_result_l10n_extensions.dart';
import '../../../data/model/models/search/search_result.dart';
import '../../../data/model/models/search/search_results.dart';
import '../../core/values/colors.dart';
import '../../core/widgets/paged_list.dart';
import '../../core/widgets/safe_image.dart';

class Movies extends GetView<AddMovieController> {
  const Movies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? appLocalizations = AppLocalizations.of(context);

    return Obx(() {
      final SearchResults? searchResults = controller.searchResults.value;

      return searchResults != null
          ? PagedList<SearchResult>(
              request: (BuildContext context) => controller.onNextPageRequested(),
              blankBuilder: _blankBuilder,
              itemBuilder: (BuildContext context, SearchResult searchResult) => _itemBuilder(
                context,
                appLocalizations,
                searchResult,
                controller.groupMovieIds.contains(searchResult.movieId),
              ),
              items: searchResults.results,
              totalCount: searchResults.totalCount,
              totalPages: searchResults.totalPages,
              scrollController: controller.scrollController,
              extent: 1,
            )
          : const SizedBox.shrink();
    });
  }

  Widget _itemBuilder(
    BuildContext context,
    AppLocalizations? appLocalizations,
    SearchResult searchResult,
    bool isAdded,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: <Widget>[
          SafeImage(
            imageUrl: searchResult.image,
            width: 50,
            height: 50,
            radius: 8,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              searchResult.getName(context),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 12),
          TextButton(
            onPressed: () {
              if (isAdded) {
                controller.onRemoveClicked(searchResult);
              } else {
                controller.onAddClicked(searchResult);
              }
            },
            style: ButtonStyle(
              shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
              ),
              backgroundColor: MaterialStateProperty.all<Color>(isAdded ? colorPrimaryLight : colorAccent),
              foregroundColor: MaterialStateProperty.all<Color>(isAdded ? Colors.white70 : Colors.white),
              overlayColor: MaterialStateProperty.all<Color>(Colors.white30),
              padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.symmetric(horizontal: 18)),
            ),
            child: Text(
              isAdded ? appLocalizations?.addMovieButtonRemove ?? '' : appLocalizations?.addMovieButtonAdd ?? '',
            ),
          ),
        ],
      ),
    );
  }

  Widget _blankBuilder(_) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 32),
      child: Center(child: CircularProgressIndicator()),
    );
  }
}
