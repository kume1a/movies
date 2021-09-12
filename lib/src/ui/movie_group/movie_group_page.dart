import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../di/injection.dart';
import '../../state/movie_group/movie_group_bloc.dart';
import '../../state/movie_group/movie_group_ui/movie_group_ui_bloc.dart';
import '../core/widgets/scroll_listener.dart';
import 'widgets/widgets.dart';

class MovieGroupPage extends StatelessWidget {
  const MovieGroupPage({Key? key}) : super(key: key);

  // TODO: 12/09/2021 add arg
  // final int groupId;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      // ignore: always_specify_types
      providers: [
        BlocProvider<MovieGroupBloc>(
          create: (_) => getIt<MovieGroupBloc>(), //..add(MovieGroupEvent.init(groupId)),
        ),
        BlocProvider<MovieGroupUiBloc>(
          create: (_) => getIt<MovieGroupUiBloc>(),
        ),
      ],
      child: const _MovieGroupPageContent(),
    );
  }
}

class _MovieGroupPageContent extends StatelessWidget {
  const _MovieGroupPageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<MovieGroupBloc, MovieGroupState>(
          builder: (BuildContext context, MovieGroupState state) {
            return Text(state.movieGroup?.name ?? '');
          },
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            ScrollListener(
              onScrollUp: () => context.read<MovieGroupUiBloc>().add(const MovieGroupUiEvent.scrolledUp()),
              onScrollDown: () => context.read<MovieGroupUiBloc>().add(const MovieGroupUiEvent.scrolledDown()),
              child: const Movies(),
            ),
            const Positioned(
              right: 16,
              bottom: 16,
              child: AddMovieButton(),
            ),
          ],
        ),
      ),
    );
  }
}
