import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/main/home_controller.dart';
import '../../../core/enums/genre.dart';
import '../../../core/helpers/genre_helper.dart';
import '../../core/values/colors.dart';
import '../../core/values/text_styles.dart';

class GenreChooser extends GetView<HomeController> {
  const GenreChooser({Key? key}) : super(key: key);

  static const List<Genre> _genres = Genre.values;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _genres.length,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        itemBuilder: (BuildContext context, int index) {
          final Genre current = _genres[index];

          return GestureDetector(
            onTap: () => controller.onGenreChanged(current),
            child: Obx(
              () {
                final bool isActive = current == controller.genre.value;

                return AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeIn,
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  decoration: BoxDecoration(
                    color: isActive ? colorAccent : colorInactive,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Center(
                    child: Text(
                      GenreHelper.convertToString(_genres[index]),
                      style: isActive ? pr12 : sc12,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
