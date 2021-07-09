import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/enums/movie_genre.dart';
import '../../../core/helpers/movie_genre_helper.dart';
import '../../core/values/colors.dart';

class GenreList extends StatelessWidget {
  const GenreList({
    Key? key,
    required this.genres,
  }) : super(key: key);

  final List<MovieGenre> genres;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? appLocalizations = AppLocalizations.of(context);

    return SizedBox(
      height: 34,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        scrollDirection: Axis.horizontal,
        itemCount: genres.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            padding: const EdgeInsets.symmetric(horizontal: 18),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: colorDisabled),
            ),
            child: Center(
              child: Text(
                MovieGenreHelper.convertToString(appLocalizations, genres[index]),
                style: const TextStyle(fontSize: 15, color: Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }
}
