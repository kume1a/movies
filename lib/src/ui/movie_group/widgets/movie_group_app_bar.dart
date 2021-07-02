import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../state/movie_group/movie_group_bloc.dart';


class MovieGroupAppBar extends StatelessWidget {
  const MovieGroupAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: BlocBuilder<MovieGroupBloc, MovieGroupState>(
        builder: (BuildContext context, MovieGroupState state) {
          return Text(state.movieGroup?.name ?? '');
        },
      ),
      floating: true,
    );
  }
}
