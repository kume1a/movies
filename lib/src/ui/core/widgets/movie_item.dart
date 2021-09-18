import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../formatters.dart';
import '../values/colors.dart';
import 'safe_image.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({
    this.imageUrl = '',
    this.name = '',
    this.duration = -1,
    this.plot = '',
    this.rating = -1,
    this.voterCount = -1,
    this.releaseYear = -1,
  });

  static const double imageWidth = 120;
  static const double imageHeight = imageWidth / 9 * 16;
  static const double radius = 6;

  final String? imageUrl;
  final String name;
  final int duration;
  final String plot;
  final double rating;
  final int voterCount;
  final int releaseYear;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? appLocalizations = AppLocalizations.of(context);

    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: <Widget>[
          SafeImage(
            imageUrl: imageUrl,
            width: imageWidth,
            height: imageHeight,
            radius: radius,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  name,
                  style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold, color: Colors.white),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                if (duration != -1)
                  Text(
                    formatDuration(context, duration),
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w300, color: colorTextSecondary),
                  ),
                const SizedBox(height: 16),
                Text(
                  plot,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w300, color: Colors.white),
                ),
                const SizedBox(height: 18),
                if (rating != -1)
                  Row(
                    children: <Widget>[
                      const Icon(Icons.star, color: colorStar),
                      const SizedBox(width: 4),
                      RichText(
                        text: TextSpan(
                          children: <InlineSpan>[
                            TextSpan(
                              text: rating.toString(),
                              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                            const TextSpan(
                              text: ' /10',
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    if (voterCount != -1)
                      Text(
                        appLocalizations?.reviews(formatBigNumber(voterCount)) ?? '',
                        style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: colorTextSecondary),
                      ),
                    if (releaseYear > 0)
                      Text(
                        releaseYear.toString(),
                        style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: colorTextSecondary),
                      ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
