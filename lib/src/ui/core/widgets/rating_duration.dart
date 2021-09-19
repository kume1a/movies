import 'package:flutter/material.dart';

import '../formatters.dart';
import '../values/colors.dart';

class RatingDurationYear extends StatelessWidget {
  const RatingDurationYear({
    required this.rating,
    required this.duration,
    required this.releaseYear,
  });

  final double? rating;
  final int? duration;
  final int? releaseYear;

  @override
  Widget build(BuildContext context) {
    const TextStyle textStyle = TextStyle(fontSize: 13, color: Colors.white, fontWeight: FontWeight.w500);

    final List<Widget> children = <Widget>[];

    if (rating != null && rating! >= 0 && rating! <= 10) {
      children.addAll(<Widget>[
        const Icon(Icons.star, color: colorStar),
        const SizedBox(width: 10),
        Text('$rating / 10', style: textStyle),
      ]);
    }

    if (duration != null && duration! > 0) {
      children.addAll(<Widget>[
        const SizedBox(width: 10),
        const Icon(Icons.access_time_rounded, color: colorDisabled),
        const SizedBox(width: 10),
        Text(formatDuration(duration!), style: textStyle),
      ]);
    }

    if (releaseYear != null && releaseYear! > 0) {
      children.addAll(<Widget>[
        const SizedBox(width: 10),
        const Icon(Icons.date_range, color: colorDisabled),
        const SizedBox(width: 10),
        Text(releaseYear.toString(), style: textStyle),
      ]);
    }

    return children.isNotEmpty ? Row(children: children) : const SizedBox.shrink();
  }
}
