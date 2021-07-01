import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../di/injection.dart';
import '../../state/movie_group/movie_group_bloc.dart';
import 'widgets/widgets.dart';

class MovieGroupPage extends StatelessWidget {
  const MovieGroupPage({
    Key? key,
    required this.groupId,
  }) : super(key: key);

  final int groupId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MovieGroupBloc>(
      create: (_) => getIt<MovieGroupBloc>()..add(MovieGroupEvent.init(groupId)),
      child: const _MovieGroupPageContent(),
    );
  }
}

class _MovieGroupPageContent extends StatelessWidget {
  const _MovieGroupPageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            MovieGroupAppBar(),
            Movies(),
          ],
        ),
      ),
    );
  }
}
