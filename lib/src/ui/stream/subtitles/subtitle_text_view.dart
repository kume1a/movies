import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/stream/subtitle_controller.dart';
import 'models/subtitle.dart';
import 'models/subtitle_style.dart';

class SubtitleTextView extends GetView<SubtitlesController> {
  const SubtitleTextView({
    Key? key,
    required this.subtitleStyle,
  }) : super(key: key);

  final SubtitleStyle subtitleStyle;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final Subtitle? subtitle = controller.subtitle.value;

        return subtitle != null
            ? Stack(
                children: <Widget>[
                  if (subtitleStyle.hasBorder)
                    Center(
                      child: Text(
                        subtitle.text,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: subtitleStyle.fontSize,
                          foreground: Paint()
                            ..style = subtitleStyle.borderStyle.style
                            ..strokeWidth = subtitleStyle.borderStyle.strokeWidth
                            ..color = subtitleStyle.borderStyle.color,
                        ),
                      ),
                    ),
                  Center(
                    child: Text(
                      subtitle.text,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: subtitleStyle.fontSize,
                        color: subtitleStyle.textColor,
                      ),
                    ),
                  ),
                ],
              )
            : const SizedBox.shrink();
      },
    );
  }
}
