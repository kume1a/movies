import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../di/injection.dart';
import '../../state/add_movie/add_movie_bloc.dart';
import 'widgets/widgets.dart';

class AddMoviePage extends StatelessWidget {
  const AddMoviePage({
    Key? key,
    required this.groupId,
  }) : super(key: key);

  final int groupId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddMovieBloc>(
      create: (_) => getIt<AddMovieBloc>()..add(AddMovieEvent.init(groupId)),
      child: const _AddMoviePageContent(),
    );
  }
}

class _AddMoviePageContent extends StatelessWidget {
  const _AddMoviePageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
