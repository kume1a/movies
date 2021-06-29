import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../core/values/text_styles.dart';
import 'widgets/widgets.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const <Widget>[
        SizedBox(height: 24),
        Padding(
          padding: EdgeInsets.only(left: 16, bottom: 4),
          child: Text('Video Player', style: prB24),
        ),
        TileAutoPlay(),
        TileDoubleTapToSeek(),
        SizedBox(height: 32),
        Padding(
          padding: EdgeInsets.only(left: 16, bottom: 4),
          child: Text('History', style: prB24),
        ),
        TileClearSearchHistory(),
        TileClearSavedMovies(),
        TileRecordSearchHistory(),
        TileRecordWatchHistory(),
        TileClearFavorites(),
        SizedBox(height: 32),
        Padding(
          padding: EdgeInsets.only(left: 16, bottom: 4),
          child: Text('Cache', style: prB24),
        ),
        TileClearCache(),
        SizedBox(height: 32),
      ],
    );
  }
}
