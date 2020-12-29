import 'package:flutter/material.dart';
import 'package:movo/src/presentation/core/formatters.dart';
import 'package:movo/src/presentation/values/colors.dart';

class RatingDuration extends StatelessWidget {
  static const TextStyle ratingDurationTextStyle = TextStyle(
    fontSize: 13,
    color: Colors.white,
    fontWeight: FontWeight.w500,
  );

  final double rating;
  final int duration;

  const RatingDuration(this.rating, this.duration);

  @override
  Widget build(BuildContext context) {
    final List<Widget> row = <Widget>[
      const Icon(Icons.star, color: colorStar),
      const SizedBox(width: 10),
      Text('$rating / 10', style: ratingDurationTextStyle),
    ];

    if (duration != 0) {
      row.addAll(<Widget>[
        const SizedBox(width: 10),
        const Icon(Icons.access_time_rounded, color: colorDisabled),
        const SizedBox(width: 10),
        Text(formatDuration(duration), style: ratingDurationTextStyle),
      ]);
    }

    return Row(children: row);
  }
}
