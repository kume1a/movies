import 'package:collection/collection.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../state/home/home_bloc.dart';
import '../core/values/text_styles.dart';
import 'widgets/widgets.dart';

class HomePage extends HookWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? appLocalizations = AppLocalizations.of(context);

    final ScrollController scrollController = useScrollController();

    return ScrollUpRefreshIndicators(
      onRefresh: () async {
        context.read<HomeBloc>()
          ..add(const HomeEvent.clear())
          ..add(const HomeEvent.popularMoviesFetchRequested())
          ..add(const HomeEvent.savedMoviesRequested())
          ..add(const HomeEvent.topMoviesPageFetchRequested())
          ..add(const HomeEvent.moviesPageFetchRequested());

        return Future<void>.delayed(const Duration(milliseconds: 500));
      },
      onScrollToUpPressed: () =>
          scrollController.animateTo(0, duration: const Duration(milliseconds: 400), curve: Curves.easeIn),
      child: CustomScrollView(
        controller: scrollController,
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                const SearchHeader(),
                const PopularMoviesList(),
                BlocBuilder<HomeBloc, HomeState>(
                  buildWhen: (HomeState prev, HomeState curr) =>
                      !const DeepCollectionEquality().equals(prev.savedMovies, curr.savedMovies),
                  builder: (BuildContext context, HomeState state) {
                    return state.savedMovies?.isNotEmpty == true
                        ? _buildHeader(appLocalizations?.homeHeaderWatchLater ?? '')
                        : const SizedBox.shrink();
                  },
                ),
                const ContinueWatchingList(),
                _buildHeader(appLocalizations?.homeHeaderTopSelection ?? ''),
                const TopSelectionList(),
                _buildHeader(appLocalizations?.homeHeaderMovies ?? ''),
                const GenreChooser(),
                const SizedBox(height: 16),
              ],
            ),
          ),
          MoviesList(),
        ],
      ),
    );
  }

  Widget _buildHeader(String header) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 36, 16, 16),
      child: Text(header, style: prB24),
    );
  }
}
