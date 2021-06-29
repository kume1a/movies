import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../state/settings/settings_bloc.dart';
import '../core/values/text_styles.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        const SizedBox(height: 24),
        // ..._themeSection(context),
        // const SizedBox(height: 32),
        ..._videoPlayerSection(context),
        const SizedBox(height: 32),
        ..._historySection(context),
        const SizedBox(height: 32),
        ..._cacheSection(context),
        const SizedBox(height: 32),
      ],
    );
  }

  // List<Widget> _themeSection(BuildContext context) {
  //   return <Widget>[
  //     Padding(
  //       padding: const EdgeInsets.only(left: 16, bottom: 4),
  //       child: Text('Theme', style: prB24),
  //     ),
  //     BlocBuilder<SettingsBloc, SettingsState>(
  //       buildWhen: (SettingsState prev, SettingsState curr) =>
  //           prev.nightModeEnabled != curr.nightModeEnabled,
  //       builder: (BuildContext context, SettingsState state) {
  //         return SwitchListTile(
  //           value: state.nightModeEnabled,
  //           title: Text('Night mode'),
  //           onChanged: (bool value) {
  //             context.read<SettingsBloc>().add(SettingsEvent.nightModeSwitched(value));
  //           },
  //         );
  //       },
  //     ),
  //   ];
  // }

  List<Widget> _videoPlayerSection(BuildContext context) {
    return <Widget>[
      const Padding(
        padding: EdgeInsets.only(left: 16, bottom: 4),
        child: Text('Video Player', style: prB24),
      ),
      BlocBuilder<SettingsBloc, SettingsState>(
        buildWhen: (SettingsState prev, SettingsState curr) => prev.autoPlayEnabled != curr.autoPlayEnabled,
        builder: (BuildContext context, SettingsState state) {
          return SwitchListTile(
            value: state.autoPlayEnabled,
            title: const Text('AutoPlay'),
            subtitle: const Text('start video automatically when loaded'),
            onChanged: (bool value) {
              context.read<SettingsBloc>().add(SettingsEvent.autoPlaySwitched(enabled: value));
            },
          );
        },
      ),
      BlocBuilder<SettingsBloc, SettingsState>(
        buildWhen: (SettingsState prev, SettingsState curr) => prev.doubleTapToSeekValue != curr.doubleTapToSeekValue,
        builder: (BuildContext context, SettingsState state) {
          return ListTile(
            title: const Text('Double-tap to seek'),
            subtitle: Text('${state.doubleTapToSeekValue} seconds'),
            onTap: () => _showSeekValueChooser(context, state.doubleTapToSeekValue),
          );
        },
      ),
    ];
  }

  List<Widget> _historySection(BuildContext context) {
    return <Widget>[
      const Padding(
        padding: EdgeInsets.only(left: 16, bottom: 4),
        child: Text('History', style: prB24),
      ),
      ListTile(
        title: const Text('Clear search history'),
        subtitle: const Text('clear searches made from this device'),
        onTap: () {
          showConfirmationDialog(
            context,
            'Clear search history?',
            "Deleted history can't be restored\nconfirm to delete",
            'DELETE SEARCH HISTORY',
            () {
              context.read<SettingsBloc>().add(const SettingsEvent.clearSearchHistoryRequested());
            },
          );
        },
      ),
      ListTile(
        title: const Text('Clear saved movies'),
        subtitle: const Text('delete saved movies from "Continue Watching"'),
        onTap: () {
          showConfirmationDialog(
            context,
            'Clear saved movies?',
            "Deleted movies can't be restored\nconfirm to delete",
            'DELETE SAVED MOVIES',
            () {
              context.read<SettingsBloc>().add(const SettingsEvent.clearWatchHistoryRequested());
            },
          );
        },
      ),
      BlocBuilder<SettingsBloc, SettingsState>(
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
      ),
      BlocBuilder<SettingsBloc, SettingsState>(
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
      ),
      ListTile(
        title: const Text('Clear favorites'),
        subtitle: const Text("make all of the movies unfavored and clear favorites' page"),
        onTap: () {
          showConfirmationDialog(
            context,
            'Delete favorite movies?',
            'This will clear the list on favorites page\nconfirm to delete',
            'DELETE FAVOURITES',
            () {
              context.read<SettingsBloc>().add(const SettingsEvent.clearFavoritesRequested());
            },
          );
        },
      ),
    ];
  }

  List<Widget> _cacheSection(BuildContext context) {
    return <Widget>[
      const Padding(
        padding: EdgeInsets.only(left: 16, bottom: 4),
        child: Text('Cache', style: prB24),
      ),
      ListTile(
        title: const Text('Clear cache'),
        subtitle: const Text('clear cached movies and season files'),
        onTap: () {
          showConfirmationDialog(
            context,
            'Clear cache?',
            'The action will delete all the cached movies and seasons',
            'DELETE CACHE',
            () {
              context.read<SettingsBloc>().add(const SettingsEvent.clearCacheRequested());
            },
          );
        },
      ),
    ];
  }

  void showConfirmationDialog(
    BuildContext context,
    String title,
    String content,
    String confirmationText,
    void Function() onConfirm,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            // ignore: deprecated_member_use
            FlatButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('CANCEL'),
            ),
            // ignore: deprecated_member_use
            FlatButton(
              onPressed: () {
                onConfirm.call();
                Navigator.pop(context);
              },
              child: Text(confirmationText),
            ),
          ],
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        );
      },
    );
  }

  void _showSeekValueChooser(BuildContext context, int currentValue) {
    final List<Widget> radioList = <int>[5, 10, 15, 30, 60, 120].map((int e) {
      return RadioListTile<int>(
        title: Text('$e sec'),
        value: e,
        onChanged: (int? value) {
          if (value != null && value != currentValue) {
            context.read<SettingsBloc>().add(SettingsEvent.doubleTapToSeekValueChanged(value));
          }
          Navigator.pop(context);
        },
        groupValue: currentValue,
        selected: currentValue == e,
      );
    }).toList();

    showDialog<double>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.only(top: 12),
          title: const Text('Double-tap to seek'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: radioList,
            ),
          ),
        );
      },
    );
  }
}
