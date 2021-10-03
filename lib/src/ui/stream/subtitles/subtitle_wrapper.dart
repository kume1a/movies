import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/stream/subtitle_controller.dart';
import 'models/subtitle_style.dart';
import 'subtitle_text_view.dart';

class SubTitleWrapper extends GetView<SubtitlesController> {
  const SubTitleWrapper({
    Key? key,
    required this.child,
    this.subtitleStyle = const SubtitleStyle(),
  }) : super(key: key);

  final Widget child;
  final SubtitleStyle subtitleStyle;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        child,
        if (controller.showSubtitles.value)
          Positioned(
            top: subtitleStyle.position.top,
            bottom: subtitleStyle.position.bottom,
            left: subtitleStyle.position.left,
            right: subtitleStyle.position.right,
            child: SubtitleTextView(
              subtitleStyle: subtitleStyle,
            ),
          ),
      ],
    );
  }
}
