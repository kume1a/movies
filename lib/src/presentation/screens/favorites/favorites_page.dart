import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movo/src/application/favorites/favorites_bloc.dart';
import 'package:movo/src/di/injection.dart';
import 'package:movo/src/presentation/screens/favorites/widgets/movie_list.dart';

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
    return MovieList();
  }

  @override
  void didUpdateWidget(FavoritesPageContent oldWidget) {
    super.didUpdateWidget(oldWidget);
    context.read<FavoritesBloc>().add(FavoritesEvent.favoriteMoviesRequested());
  }
}
