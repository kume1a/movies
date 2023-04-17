import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/movie_group/movie_group_controller.dart';
import '../core/widgets/scroll_listener.dart';
import 'widgets/widgets.dart';

class MovieGroupPage extends GetView<MovieGroupController> {
  const MovieGroupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => Text(controller.movieGroup.value?.name ?? ''),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            ScrollListener(
              onScrollUp: controller.onScrolledUp,
              onScrollDown: controller.onScrolledDown,
              child: const Movies(),
            ),
            const Positioned(
              right: 16,
              bottom: 16,
              child: AddMovieButton(),
            ),
          ],
        ),
      ),
    );
  }
}
