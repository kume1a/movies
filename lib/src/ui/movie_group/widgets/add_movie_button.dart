import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

import '../../../controllers/movie_group/movie_group_controller.dart';

class AddMovieButton extends GetView<MovieGroupController> {
  const AddMovieButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? appLocalizations = AppLocalizations.of(context);

    return FloatingActionButton.extended(
      onPressed: controller.onAddMovieClicked,
      label: Obx(
        () => AnimatedSwitcher(
          switchInCurve: Curves.easeIn,
          switchOutCurve: Curves.easeOut,
          duration: const Duration(milliseconds: 150),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(
              opacity: animation,
              child: SizeTransition(
                sizeFactor: animation,
                axis: Axis.horizontal,
                child: child,
              ),
            );
          },
          child: controller.isFabExpanded.value
              ? const Icon(Icons.add, color: Colors.white)
              : Row(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(right: 4.0),
                child: Icon(Icons.add, color: Colors.white),
              ),
              Text(
                appLocalizations?.movieGroupButtonAddMovie ?? '',
                style: const TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
