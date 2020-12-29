import 'package:flutter/material.dart';
import 'package:movo/src/presentation/values/colors.dart';

class GenreList extends StatelessWidget {
  static const TextStyle genreDescTextStyle = TextStyle(
    fontSize: 15,
    color: Colors.white,
  );

  final List<String> genres;

  const GenreList(this.genres);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 34,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: genres.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.only(left: 16),
            padding: const EdgeInsets.symmetric(horizontal: 18),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: colorDisabled),
            ),
            child: Center(
              child: Text(genres[index], style: genreDescTextStyle),
            ),
          );
        },
      ),
    );
  }
}
