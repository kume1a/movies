import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../di/injection.dart';
import '../../state/favorites/favorites_bloc.dart';
import '../core/values/constants.dart';
import 'widgets/widgets.dart';

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
      buildWhen: (FavoritesState prev, FavoritesState curr) => prev.movies != curr.movies,
      builder: (BuildContext context, FavoritesState state) {
        return state.movies != null
            ? AnimatedSwitcher(
                duration: mediumAnimDuration,
                child: state.movies!.isNotEmpty ? MovieList(state.movies!) : EmptyFavoriteListMessage(),
              )
            : const Center(child: CircularProgressIndicator());
      },
    );
  }

  @override
  void didUpdateWidget(FavoritesPageContent oldWidget) {
    super.didUpdateWidget(oldWidget);
    context.read<FavoritesBloc>().add(const FavoritesEvent.favoriteMoviesRequested());
  }
}
