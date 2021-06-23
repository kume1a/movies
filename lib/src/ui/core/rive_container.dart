import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class RiveContainer extends StatelessWidget {
  const RiveContainer({
    required this.artboard,
    this.width = 24,
    this.height = 24,
  });

  final Artboard artboard;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Rive(artboard: artboard),
    );
  }
}
