import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../di/injection.dart';
import '../../state/settings/settings_bloc.dart';
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
    final AppLocalizations? appLocalizations = AppLocalizations.of(context);
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 4),
              child: Text(
                appLocalizations?.settingsHeaderLanguage ?? '',
                style: theme.textTheme.headline5?.copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            const TileLanguage(),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 4),
              child: Text(
                appLocalizations?.settingsHeaderVideoPlayer ?? '',
                style: theme.textTheme.headline5?.copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            const TileAutoPlay(),
            const TileDoubleTapToSeek(),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 4),
              child: Text(
                appLocalizations?.settingsHeaderHistory ?? '',
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
                appLocalizations?.settingsHeaderCache ?? '',
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
