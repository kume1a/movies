import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../core/enums/supported_locale.dart';
import '../../../core/extensions/build_context_extensions.dart';
import '../../../data/model/models/movie_groups/movie_group.dart';
import '../../../state/favorites/favorites_bloc.dart';
import '../../core/dialogs/add_movie_group_dialog.dart';
import '../../core/dialogs/confirmation_dialog.dart';
import '../../core/routes/screens_navigator.dart';
import '../../core/values/colors.dart';

class MovieGroups extends StatelessWidget {
  const MovieGroups({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesBloc, FavoritesState>(
      buildWhen: (FavoritesState previous, FavoritesState current) =>
          !const DeepCollectionEquality().equals(previous.movieGroups, current.movieGroups),
      builder: (BuildContext context, FavoritesState state) {
        return state.movieGroups != null
            ? VisibilityDetector(
                key: UniqueKey(),
                onVisibilityChanged: (VisibilityInfo info) {
                  if (info.visibleFraction == 1) {
                    context.read<FavoritesBloc>().add(const FavoritesEvent.refreshData());
                  }
                },
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 23),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 250,
                    mainAxisExtent: 150,
                    crossAxisSpacing: 18,
                    mainAxisSpacing: 18,
                  ),
                  itemCount: state.movieGroups!.length + 1,
                  itemBuilder: (BuildContext context, int index) {
                    final bool overListLength = index > state.movieGroups!.length - 1;
                    return overListLength
                        ? _buildAddGroupItem(context)
                        : _buildItem(context, state.movieGroups![index]);
                  },
                ),
              )
            : const Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget _buildAddGroupItem(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: ColoredBox(
        color: colorPrimaryLight,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () async {
              final String? groupName = await showAddMovieGroupDialog(context);
              if (groupName != null) {
                context.read<FavoritesBloc>().add(FavoritesEvent.groupAdded(groupName));
              }
            },
            child: const SizedBox.expand(
              child: Icon(Icons.add, size: 42),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildItem(BuildContext context, MovieGroup movieGroup) {
    const int maxMovieNameCount = 4;
    late final ListSlice<String> movieNames;
    switch (context.locale) {
      case SupportedLocale.en:
        movieNames = movieGroup.movieNamesEn.slice(
          0,
          movieGroup.movieNamesEn.length >= maxMovieNameCount ? maxMovieNameCount : movieGroup.movieNamesEn.length,
        );
        break;
      case SupportedLocale.ka:
        movieNames = movieGroup.movieNamesKa.slice(
          0,
          movieGroup.movieNamesKa.length >= maxMovieNameCount ? maxMovieNameCount : movieGroup.movieNamesKa.length,
        );
        break;
    }
    final Widget header = Align(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          movieGroup.name,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );

    final Widget content = movieNames.isNotEmpty
        ? Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                header,
                const SizedBox(height: 12),
                for (String movieName in movieNames)
                  Row(
                    children: <Widget>[
                      Container(
                        width: 5,
                        height: 5,
                        decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                        margin: const EdgeInsets.symmetric(vertical: 9),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          movieName,
                          style: const TextStyle(fontSize: 13),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          )
        : Center(child: Padding(padding: const EdgeInsets.symmetric(horizontal: 12), child: header));

    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: ColoredBox(
        color: colorPrimaryLight,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onLongPress: () async {
              final AppLocalizations? appLocalizations = AppLocalizations.of(context);
              final bool didConfirm = await showConfirmationDialog(
                context,
                title: appLocalizations?.favoritesHeaderDeleteGroup(movieGroup.name) ?? '',
                content: appLocalizations?.favoritesContentDeleteGroup(movieGroup.name) ?? '',
              );

              if (didConfirm) {
                context.read<FavoritesBloc>().add(FavoritesEvent.groupDeleted(movieGroup));
              }
            },
            onTap: () async {
              if (movieGroup.groupId != null && movieNames.isNotEmpty) {
                ScreensNavigator.pushMovieGroupPage(movieGroup.groupId!);
              }
            },
            child: SizedBox.expand(child: content),
          ),
        ),
      ),
    );
  }
}
