import 'package:flutter/material.dart';

class SubtitleStyle {
  const SubtitleStyle({
    this.hasBorder = false,
    this.borderStyle = const SubtitleBorderStyle(),
    this.fontSize = 16,
    this.textColor = Colors.black,
    this.position = const SubtitlePosition(),
  });

  final bool hasBorder;
  final SubtitleBorderStyle borderStyle;
  final double fontSize;
  final Color textColor;
  final SubtitlePosition position;
}

class SubtitlePosition {
  const SubtitlePosition({
    this.left = 0,
    this.right = 0,
    this.top,
    this.bottom = 32,
  });

  final double left;
  final double right;
  final double? top;
  final double bottom;
}

class SubtitleBorderStyle {
  const SubtitleBorderStyle({
    this.strokeWidth = 2,
    this.style = PaintingStyle.stroke,
    this.color = Colors.black,
  });

  final double strokeWidth;
  final PaintingStyle style;
  final Color color;
}
