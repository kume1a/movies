import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../di/injection.dart';
import '../../../domain/movie/movie_data_model.dart';
import '../../../state/favorites/favorites_bloc.dart';
import '../../core/extensions.dart';
import '../../values/constants.dart';
import 'widgets/empty_message.dart';
import 'widgets/movie_list.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<FavoritesBloc>(
      create: (_) => getIt<FavoritesBloc>()..add(const FavoritesEvent.favoriteMoviesRequested()),
      child: FavoritesPageContent(),
    );
  }
}

class FavoritesPageContent extends StatefulWidget {
  @override
  _FavoritesPageContentState createState() => _FavoritesPageContentState();
}

class _FavoritesPageContentState extends State<FavoritesPageContent> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesBloc, FavoritesState>(
      buildWhen: (FavoritesState prev, FavoritesState curr) =>
          !prev.moviesOption.equals(curr.moviesOption),
      builder: (BuildContext context, FavoritesState state) {
        return state.moviesOption.fold(
          () => const Center(child: CircularProgressIndicator()),
          (List<MovieData> a) {
            return AnimatedSwitcher(
              duration: mediumAnimDuration,
              child: a.isNotEmpty ? MovieList(a) : EmptyFavoriteListMessage(),
            );
          },
        );
      },
    );
  }

  @override
  void didUpdateWidget(FavoritesPageContent oldWidget) {
    super.didUpdateWidget(oldWidget);
    context.read<FavoritesBloc>().add(const FavoritesEvent.favoriteMoviesRequested());
  }
}
