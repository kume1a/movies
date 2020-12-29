import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movo/src/application/home/home_bloc.dart';
import 'package:movo/src/di/injection.dart';
import 'package:movo/src/domain/movie_position/saved_movies.dart';
import 'package:movo/src/presentation/core/extensions.dart';
import 'package:movo/src/presentation/screens/home/widgets/continue_watching_list.dart';
import 'package:movo/src/presentation/screens/home/widgets/genre_chooser.dart';
import 'package:movo/src/presentation/screens/home/widgets/movies_list.dart';
import 'package:movo/src/presentation/screens/home/widgets/popular_movies_list.dart';
import 'package:movo/src/presentation/screens/home/widgets/scroll_up_indicator.dart';
import 'package:movo/src/presentation/screens/home/widgets/search_header.dart';
import 'package:movo/src/presentation/screens/home/widgets/top_selection_list.dart';
import 'package:movo/src/presentation/values/constants.dart';
import 'package:movo/src/presentation/values/text_styles.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (_) => getIt<HomeBloc>()
        ..add(const HomeEvent.popularMoviesFetchRequested())
        ..add(const HomeEvent.savedMoviesRequested())
        ..add(const HomeEvent.topMoviesPageFetchRequested())
        ..add(const HomeEvent.moviesPageFetchRequested()),
      child: HomePageContent(),
    );
  }
}

class HomePageContent extends StatefulWidget {
  @override
  _HomePageContentState createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void didUpdateWidget(HomePageContent oldWidget) {
    super.didUpdateWidget(oldWidget);
    context.read<HomeBloc>().add(const HomeEvent.savedMoviesRequested());
  }

  @override
  Widget build(BuildContext context) {
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
      onScrollToUpPressed: () {
        _scrollController.animateTo(0, duration: longAnimDuration, curve: Curves.easeIn);
      },
      child: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          SliverToBoxAdapter(child: SearchHeader()),
          SliverToBoxAdapter(child: PopularMoviesList()),
          SliverToBoxAdapter(
            child: BlocBuilder<HomeBloc, HomeState>(
              buildWhen: (HomeState prev, HomeState curr) =>
                  !prev.savedMoviesOption.equals(curr.savedMoviesOption),
              builder: (BuildContext context, HomeState state) {
                return state.savedMoviesOption.fold(
                  () => const SizedBox.shrink(),
                  (List<SavedMovie> a) =>
                      a.isNotEmpty ? _buildHeader('Continue Watching') : const SizedBox.shrink(),
                );
              },
            ),
          ),
          SliverToBoxAdapter(child: ContinueWatchingList()),
          SliverToBoxAdapter(child: _buildHeader('Top Selection')),
          SliverToBoxAdapter(child: TopSelectionList()),
          SliverToBoxAdapter(child: _buildHeader('Movies')),
          const SliverToBoxAdapter(child: SizedBox(height: 8)),
          SliverToBoxAdapter(child: GenreChooser()),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),
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

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }
}
