import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class RiveContainer extends StatelessWidget {
  final Artboard artboard;
  final double width;
  final double height;

  const RiveContainer({
    @required this.artboard,
    this.width = 24,
    this.height = 24,
  });

  @override
  Widget build(BuildContext context) {
    return artboard != null
        ? SizedBox(
            width: width,
            height: height,
            child: Rive(artboard: artboard),
          )
        : SizedBox.shrink();
  }
}
