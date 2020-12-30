import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movo/src/application/favorites/favorites_bloc.dart';
import 'package:movo/src/di/injection.dart';
import 'package:movo/src/domain/movie/movie_data_model.dart';
import 'package:movo/src/presentation/core/extensions.dart';
import 'package:movo/src/presentation/screens/favorites/widgets/empty_message.dart';
import 'package:movo/src/presentation/screens/favorites/widgets/movie_list.dart';
import 'package:movo/src/presentation/values/constants.dart';

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
          () => Center(child: const CircularProgressIndicator()),
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
    context.read<FavoritesBloc>().add(FavoritesEvent.favoriteMoviesRequested());
  }
}
