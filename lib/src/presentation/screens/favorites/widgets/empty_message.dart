import 'package:flutter/material.dart';
import 'package:movo/src/presentation/values/text_styles.dart';

class EmptyFavoriteListMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.asset(
              'assets/broken_heart.png',
              width: 100,
              height: 100,
              color: Colors.white,
            ),
            const SizedBox(height: 24),
            const Text(
              "You haven't favorited anything yet",
              style: prSB26,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            const Text(
              'Browse movies and tap little heart icon to save something to this list',
              style: prL16,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
