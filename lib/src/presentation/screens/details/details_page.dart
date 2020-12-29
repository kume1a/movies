import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movo/src/application/details/details_bloc.dart';
import 'package:movo/src/di/injection.dart';
import 'package:movo/src/presentation/screens/details/details_page_content.dart';

class DetailsPage extends StatelessWidget {
  final int movieId;

  const DetailsPage({@required this.movieId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DetailsBloc>(
      create: (_) {
        final DetailsBloc bloc = getIt<DetailsBloc>(param1: movieId);
        return bloc
          ..add(const DetailsEvent.movieFetchRequested())
          ..add(const DetailsEvent.castPageFetchRequested());
      },
      child: DetailsPageContent(),
    );
  }
}
