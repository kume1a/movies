import 'package:flutter/material.dart';
import 'package:movo/src/presentation/values/colors.dart';

class BlankContainer extends StatelessWidget {
  final double width;
  final double height;
  final double radius;
  final Color color;

  const BlankContainer({
    @required this.width,
    @required this.height,
    this.radius = 0,
    this.color = colorPreview,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: color,
      ),
    );
  }
}
