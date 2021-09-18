import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

import '../../controllers/home/home_controller.dart';
import '../core/values/colors.dart';
import '../core/widgets/scroll_up_indicator.dart';
import 'widgets/widgets.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? appLocalizations = AppLocalizations.of(context);
    final ThemeData theme = Theme.of(context);

    return RefreshIndicator(
      onRefresh: controller.onRefresh,
      backgroundColor: colorAccent,
      color: Colors.white,
      child: ScrollUpIndicator(
        onScrollToUpPressed: controller.onScrollUpPressed,
        child: CustomScrollView(
          controller: controller.scrollController,
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate(
                <Widget>[
                  const SearchHeader(),
                  const PopularMoviesList(),
                  Obx(() {
                    return controller.savedMovies.isNotEmpty == true
                        ? _buildHeader(theme, appLocalizations?.homeHeaderWatchLater ?? '')
                        : const SizedBox.shrink();
                  }),
                  const ContinueWatchingList(),
                  _buildHeader(theme, appLocalizations?.homeHeaderTopSelection ?? ''),
                  const TopSelectionList(),
                  _buildHeader(theme, appLocalizations?.homeHeaderMovies ?? ''),
                  const GenreChooser(),
                  const SizedBox(height: 8),
                ],
              ),
            ),
            MoviesList(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(ThemeData theme, String header) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 36, 16, 16),
      child: Text(header, style: theme.textTheme.headline5?.copyWith(fontWeight: FontWeight.w600)),
    );
  }
}
