import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../state/home/home_bloc.dart';
import '../core/values/text_styles.dart';
import 'widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void didUpdateWidget(HomePage oldWidget) {
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
        _scrollController.animateTo(0, duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
      },
      child: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          SliverToBoxAdapter(child: SearchHeader()),
          SliverToBoxAdapter(child: PopularMoviesList()),
          SliverToBoxAdapter(
            child: BlocBuilder<HomeBloc, HomeState>(
              buildWhen: (HomeState prev, HomeState curr) =>
                  !const DeepCollectionEquality().equals(prev.savedMovies, curr.savedMovies),
              builder: (BuildContext context, HomeState state) {
                return state.savedMovies != null
                    ? state.savedMovies!.isNotEmpty
                        ? _buildHeader('Continue Watching')
                        : const SizedBox.shrink()
                    : const SizedBox.shrink();
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
