import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/stream/stream_controller.dart';
import '../../core/values/colors.dart';
import 'subtitle_wrapper.dart';
import 'video_player/player.dart';

class VideoPlayer extends GetView<StreamController> {
  const VideoPlayer(this.id);

  final int id;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.chewieController.value != null
          ? Container(
              color: Colors.black,
              child: SubTitleWrapper(
                child: Chewie(
                  controller: controller.chewieController.value!,
                ),
              ),
            )
          : Container(color: colorPreview),
    );
  }
}
