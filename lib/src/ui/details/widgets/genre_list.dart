import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/details/details_controller.dart';
import '../../../core/enums/movie_genre.dart';
import '../../../core/helpers/enum_helpers/movie_genre_helper.dart';
import '../../core/values/colors.dart';

class GenreList extends GetView<DetailsController> {
  const GenreList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 34,
      child: Obx(
        () {
          final List<MovieGenre> genres = controller.movie.value?.genres ?? List<MovieGenre>.empty();

          return ListView.builder(
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
                    MovieGenreHelper.convertToString(genres[index]),
                    style: const TextStyle(fontSize: 15, color: Colors.white),
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
