import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../state/favorites/favorites_bloc.dart';
import '../../../state/home/home_bloc.dart';
import '../../../state/settings/settings_bloc.dart';
import '../../core/widgets/confirmation_dialog.dart';

class TileClearSearchHistory extends StatelessWidget {
  const TileClearSearchHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Clear search history'),
      subtitle: const Text('clear searches made from this device'),
      onTap: () async {
        final bool didConfirm = await showConfirmationDialog(
          context,
          title: 'Clear search history?',
          content: "Deleted history can't be restored.\nConfirm to delete",
          confirmationText: 'Delete',
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
    return ListTile(
      title: const Text('Clear saved movies'),
      subtitle: const Text('delete saved movies from "Continue Watching"'),
      onTap: () async {
        final bool didConfirm = await showConfirmationDialog(
          context,
          title: 'Clear saved movies?',
          content: "Deleted movies can't be restored.\nConfirm to delete",
          confirmationText: 'Delete',
        );

        if (didConfirm) {
          context.read<SettingsBloc>().add(const SettingsEvent.clearWatchHistoryRequested());
          context.read<HomeBloc>().add(const HomeEvent.savedMoviesRequested());
        }
      },
    );
  }
}

class TileRecordSearchHistory extends StatelessWidget {
  const TileRecordSearchHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      buildWhen: (SettingsState prev, SettingsState curr) =>
          prev.recordSearchHistoryEnabled != curr.recordSearchHistoryEnabled,
      builder: (BuildContext context, SettingsState state) {
        return SwitchListTile(
          value: state.recordSearchHistoryEnabled,
          title: const Text('Record search history'),
          onChanged: (bool value) {
            context.read<SettingsBloc>().add(SettingsEvent.searchHistoryEnabledSwitched(enabled: value));
          },
        );
      },
    );
  }
}

class TileRecordWatchHistory extends StatelessWidget {
  const TileRecordWatchHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      buildWhen: (SettingsState prev, SettingsState curr) =>
          prev.recordWatchHistoryEnabled != curr.recordWatchHistoryEnabled,
      builder: (BuildContext context, SettingsState state) {
        return SwitchListTile(
          value: state.recordWatchHistoryEnabled,
          title: const Text('Record watch history'),
          onChanged: (bool value) {
            context.read<SettingsBloc>().add(SettingsEvent.watchHistoryEnabledSwitched(enabled: value));
          },
        );
      },
    );
  }
}

class TileClearFavorites extends StatelessWidget {
  const TileClearFavorites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Clear favorites'),
      subtitle: const Text("make all of the movies unfavored and clear favorites' page"),
      onTap: () async {
        final bool didConfirm = await showConfirmationDialog(
          context,
          title: 'Delete favorite movies?',
          content: 'This will clear the list on favorites page.\nConfirm to delete',
          confirmationText: 'Delete',
        );

        if (didConfirm) {
          context.read<SettingsBloc>().add(const SettingsEvent.clearFavoritesRequested());
          context.read<FavoritesBloc>().add(const FavoritesEvent.refreshData());
        }
      },
    );
  }
}
