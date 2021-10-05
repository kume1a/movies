import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/stream/subtitle_controller.dart';
import '../../../data/model/models/subtitles/subtitle.dart';

class SubTitleWrapper extends GetView<SubtitlesController> {
  const SubTitleWrapper({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        child,
        if (controller.showSubtitles.value)
          Obx(
            () => Positioned(
              bottom: controller.subtitleSpacingFromBottom.value + 4,
              left: 12,
              right: 12,
              child: Obx(
                () {
                  final Subtitle? subtitle = controller.subtitle.value;

                  return subtitle != null
                      ? Stack(
                          children: <Widget>[
                            Obx(
                              () => controller.subtitleBorderThickness.value > 0
                                  ? Center(
                                      child: Text(
                                        subtitle.text,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: controller.subtitleTextSize.value,
                                          foreground: Paint()
                                            ..style = PaintingStyle.stroke
                                            ..strokeWidth = controller.subtitleBorderThickness.value
                                            ..color = controller.subtitleBorderColor.value,
                                        ),
                                      ),
                                    )
                                  : const SizedBox.shrink(),
                            ),
                            Center(
                              child: Obx(
                                () => Text(
                                  subtitle.text,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: controller.subtitleTextSize.value,
                                    color: controller.subtitleTextColor.value,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      : const SizedBox.shrink();
                },
              ),
            ),
          ),
      ],
    );
  }
}
