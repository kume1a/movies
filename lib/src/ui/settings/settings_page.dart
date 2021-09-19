import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../l10n/translation_keys.dart';
import 'widgets/widgets.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 4),
              child: Text(
                trSettingsHeaderLanguage.tr,
                style: theme.textTheme.headline5?.copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            const TileLanguage(),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 4),
              child: Text(
                trSettingsHeaderVideoPlayer.tr,
                style: theme.textTheme.headline5?.copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            const TileAutoPlay(),
            const TileDoubleTapToSeek(),
            const TileSaveMovieInterval(),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 4),
              child: Text(
                trSettingsHeaderHistory.tr,
                style: theme.textTheme.headline5?.copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            const TileClearSearchHistory(),
            const TileClearSavedMovies(),
            const TileRecordSearchHistory(),
            const TileRecordWatchHistory(),
            const TileClearFavorites(),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 4),
              child: Text(
                trSettingsHeaderCache.tr,
                style: theme.textTheme.headline5?.copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            const TileClearCache(),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
