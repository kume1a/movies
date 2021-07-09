import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../state/settings/settings_bloc.dart';
import '../../core/dialogs/clear_favorites_dialog.dart';
import '../../core/dialogs/confirmation_dialog.dart';

class TileClearSearchHistory extends StatelessWidget {
  const TileClearSearchHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? appLocalizations = AppLocalizations.of(context);

    return ListTile(
      title: Text(appLocalizations?.settingsClearSearchHistory ?? ''),
      subtitle: Text(appLocalizations?.settingsCommentClearSearchHistory ?? ''),
      onTap: () async {
        final bool didConfirm = await showConfirmationDialog(
          context,
          title: appLocalizations?.settingsClearSearchHistoryDialogHeader ?? '',
          content: appLocalizations?.settingsClearSearchHistoryDialogContent ?? '',
          confirmationText: appLocalizations?.clear ?? '',
        );

        if (didConfirm) {
          context.read<SettingsBloc>().add(const SettingsEvent.clearSearchHistoryRequested());
        }
      },
    );
  }
}

class TileClearSavedMovies extends StatelessWidget {
  const TileClearSavedMovies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? appLocalizations = AppLocalizations.of(context);

    return ListTile(
      title: Text(appLocalizations?.settingsClearSavedMovies ?? ''),
      subtitle: Text(appLocalizations?.settingsCommentClearSavedMovies ?? ''),
      onTap: () async {
        final bool didConfirm = await showConfirmationDialog(
          context,
          title: appLocalizations?.settingsClearSavedMoviesDialogHeader ?? '',
          content: appLocalizations?.settingsClearSavedMoviesDialogContent ?? '',
          confirmationText: appLocalizations?.clear ?? '',
        );

        if (didConfirm) {
          context.read<SettingsBloc>().add(const SettingsEvent.clearWatchHistoryRequested());
        }
      },
    );
  }
}

class TileRecordSearchHistory extends StatelessWidget {
  const TileRecordSearchHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? appLocalizations = AppLocalizations.of(context);

    return BlocBuilder<SettingsBloc, SettingsState>(
      buildWhen: (SettingsState prev, SettingsState curr) =>
          prev.recordSearchHistoryEnabled != curr.recordSearchHistoryEnabled,
      builder: (BuildContext context, SettingsState state) {
        return SwitchListTile(
          value: state.recordSearchHistoryEnabled,
          title: Text(appLocalizations?.settingsRecordSearchHistory ?? ''),
          onChanged: (bool value) =>
              context.read<SettingsBloc>().add(SettingsEvent.searchHistoryEnabledSwitched(enabled: value)),
        );
      },
    );
  }
}

class TileRecordWatchHistory extends StatelessWidget {
  const TileRecordWatchHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? appLocalizations = AppLocalizations.of(context);

    return BlocBuilder<SettingsBloc, SettingsState>(
      buildWhen: (SettingsState prev, SettingsState curr) =>
          prev.recordWatchHistoryEnabled != curr.recordWatchHistoryEnabled,
      builder: (BuildContext context, SettingsState state) {
        return SwitchListTile(
          value: state.recordWatchHistoryEnabled,
          title: Text(appLocalizations?.settingsRecordWatchHistory ?? ''),
          onChanged: (bool value) =>
              context.read<SettingsBloc>().add(SettingsEvent.watchHistoryEnabledSwitched(enabled: value)),
        );
      },
    );
  }
}

class TileClearFavorites extends StatelessWidget {
  const TileClearFavorites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? appLocalizations = AppLocalizations.of(context);

    return ListTile(
      title: Text(appLocalizations?.settingsClearFavorites ?? ''),
      subtitle: Text(appLocalizations?.settingsCommentClearFavorites ?? ''),
      onTap: () async {
        final ClearFavoritesResult? clearFavoritesResult = await showClearFavoritesDialog(context);

        if (clearFavoritesResult != null && clearFavoritesResult.didConfirm) {
          context
              .read<SettingsBloc>()
              .add(SettingsEvent.clearFavoritesRequested(clearGroups: clearFavoritesResult.clearMovieGroups));
        }
      },
    );
  }
}
