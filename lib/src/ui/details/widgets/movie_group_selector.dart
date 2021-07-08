import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/models/movie_groups/movie_group.dart';
import '../../../di/injection.dart';
import '../../../state/details/movie_group_selector/movie_group_selector_bloc.dart';
import '../../core/routes/screens_navigator.dart';

Future<MovieGroup?> showMovieGroupSelector(BuildContext context, int movieId) async {
  return showModalBottomSheet<MovieGroup>(
    isScrollControlled: true,
    context: context,
    builder: (_) => _MovieGroupSelector(movieId: movieId),
  );
}

class _MovieGroupSelector extends StatelessWidget {
  const _MovieGroupSelector({
    Key? key,
    required this.movieId,
  }) : super(key: key);

  final int movieId;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? appLocalizations = AppLocalizations.of(context);

    return BlocProvider<MovieGroupSelectorBloc>(
      create: (_) => getIt<MovieGroupSelectorBloc>()..add(MovieGroupSelectorEvent.init(movieId)),
      child: BlocBuilder<MovieGroupSelectorBloc, MovieGroupSelectorState>(
        builder: (BuildContext context, MovieGroupSelectorState state) {
          return ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * .7,
            ),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: state.movieGroups?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                final MovieGroup movieGroup = state.movieGroups![index];
                final bool isSelected = movieGroup == state.selectedMovieGroup;

                return ListTile(
                  onTap: () => ScreensNavigator.pop(movieGroup),
                  title: Text(
                    movieGroup.groupId != null ? movieGroup.name : appLocalizations?.detailsOptionNoGroup ?? '',
                  ),
                  tileColor: isSelected ? Colors.white12 : null,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
