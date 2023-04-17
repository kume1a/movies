import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/add_movie/add_movie_controller.dart';
import '../../l10n/translation_keys.dart';
import '../core/routes/screens_navigator.dart';
import '../core/values/colors.dart';
import '../core/widgets/search_bar.dart';
import '../core/widgets/tap_outside_to_clear_focus.dart';
import 'widgets/widgets.dart';

class AddMoviePage extends GetView<AddMovieController> {
  const AddMoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: TapOutsideToClearFocus(
          child: ColoredBox(
            color: Colors.transparent,
            child: Column(
              children: <Widget>[
                const SizedBox(height: 4),
                SearchBar(
                  onBackPressed: () => ScreensNavigator.pop(),
                  onChanged: controller.onQueryChanged,
                  decoration: InputDecoration(
                    hintText: trAddMovieHintSearchField.tr,
                    counterText: '',
                    fillColor: Colors.white,
                    hintStyle: const TextStyle(color: colorTextSecondary),
                    border: InputBorder.none,
                  ),
                ),
                const SizedBox(height: 8),
                const Expanded(child: Movies()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
