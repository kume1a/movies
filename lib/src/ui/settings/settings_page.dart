import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../di/injection.dart';
import '../../state/settings/settings_bloc.dart';
import '../core/values/text_styles.dart';
import 'widgets/widgets.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SettingsBloc>(
      create: (_) => getIt<SettingsBloc>()..add(const SettingsEvent.init()),
      child: const _SettingsPageContent(),
    );
  }
}

class _SettingsPageContent extends StatelessWidget {
  const _SettingsPageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
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
        ),
      ),
    );
  }
}
