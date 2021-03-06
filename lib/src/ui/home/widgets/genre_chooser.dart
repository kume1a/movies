import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/enums/genre.dart';
import '../../../core/helpers/genre_helper.dart';
import '../../../state/home/home_bloc.dart';
import '../../core/values/colors.dart';
import '../../core/values/text_styles.dart';

class GenreChooser extends StatelessWidget {
  const GenreChooser({Key? key}) : super(key: key);

  static const List<Genre> _genres = Genre.values;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? appLocalizations = AppLocalizations.of(context);

    return SizedBox(
      height: 36,
      child: BlocBuilder<HomeBloc, HomeState>(
        buildWhen: (HomeState prev, HomeState curr) => prev.genre != curr.genre,
        builder: (BuildContext context, HomeState state) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _genres.length,
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            itemBuilder: (BuildContext context, int index) {
              final Genre current = _genres[index];
              final bool isActive = current == state.genre;

              return GestureDetector(
                onTap: () => context.read<HomeBloc>().add(HomeEvent.genreChanged(current)),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  decoration: BoxDecoration(
                    color: isActive ? colorAccent : colorInactive,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Center(
                    child: Text(
                      GenreHelper.convertToString(appLocalizations, _genres[index]),
                      style: isActive ? pr12 : sc12,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
