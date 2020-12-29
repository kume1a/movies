import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movo/src/application/settings/settings_bloc.dart';
import 'package:movo/src/di/injection.dart';
import 'package:movo/src/presentation/values/text_styles.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SettingsBloc>(
      create: (_) => getIt<SettingsBloc>(),
      child: SettingsPageContent(),
    );
  }
}

class SettingsPageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        const SizedBox(height: 24),
        ..._themeSection(context),
        const SizedBox(height: 32),
        ..._videoPlayerSection(context),
        const SizedBox(height: 32),
        ..._historySection(context),
        const SizedBox(height: 32),
      ],
    );
  }

  List<Widget> _themeSection(BuildContext context) {
    return <Widget>[
      Padding(
        padding: const EdgeInsets.only(left: 16, bottom: 4),
        child: Text('Theme', style: prB24),
      ),
      BlocBuilder<SettingsBloc, SettingsState>(
        buildWhen: (SettingsState prev, SettingsState curr) =>
            prev.nightModeEnabled != curr.nightModeEnabled,
        builder: (BuildContext context, SettingsState state) {
          return SwitchListTile(
            value: state.nightModeEnabled,
            title: Text('Night mode'),
            onChanged: (bool value) {
              context.read<SettingsBloc>().add(SettingsEvent.nightModeSwitched(value));
            },
          );
        },
      ),
    ];
  }

  List<Widget> _videoPlayerSection(BuildContext context) {
    return <Widget>[
      Padding(
        padding: const EdgeInsets.only(left: 16, bottom: 4),
        child: Text('Video Player', style: prB24),
      ),
      BlocBuilder<SettingsBloc, SettingsState>(
        buildWhen: (SettingsState prev, SettingsState curr) =>
            prev.autoPlayEnabled != curr.autoPlayEnabled,
        builder: (BuildContext context, SettingsState state) {
          return SwitchListTile(
            value: state.autoPlayEnabled,
            title: Text('AutoPlay'),
            subtitle: Text('start video automatically when loaded'),
            onChanged: (bool value) {
              context.read<SettingsBloc>().add(SettingsEvent.autoPlaySwitched(value));
            },
          );
        },
      ),
      BlocBuilder<SettingsBloc, SettingsState>(
        buildWhen: (SettingsState prev, SettingsState curr) =>
            prev.doubleTapToSeekValue != curr.doubleTapToSeekValue,
        builder: (BuildContext context, SettingsState state) {
          return ListTile(
            title: Text('Double-tap to seek'),
            subtitle: Text('${state.doubleTapToSeekValue} seconds'),
            onTap: () => _showSeekValueChooser(context, state.doubleTapToSeekValue),
          );
        },
      ),
    ];
  }

  List<Widget> _historySection(BuildContext context) {
    return <Widget>[
      Padding(
        padding: const EdgeInsets.only(left: 16, bottom: 4),
        child: Text('History', style: prB24),
      ),
      ListTile(
        title: Text('Clear search history'),
        subtitle: Text('clear searches made from this device'),
        onTap: () {
          showConfirmationDialog(
            context,
            'Clear search history?',
            'Deleted history can\'t be restored\nconfirm to delete',
            'DELETE SEARCH HISTORY',
            () {
              context.read<SettingsBloc>().add(SettingsEvent.clearSearchHistoryRequested());
            },
          );
        },
      ),
      ListTile(
        title: Text('Clear saved movies'),
        subtitle: Text('delete saved movies from \"Continue Watching\"'),
        onTap: () {
          showConfirmationDialog(
            context,
            'Clear saved movies?',
            'Deleted movies can\'t be restored\nconfirm to delete',
            'DELETE SAVED MOVIES',
            () {
              context.read<SettingsBloc>().add(SettingsEvent.clearWatchHistoryRequested());
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
            title: Text('Pause search history'),
            onChanged: (bool value) {
              context.read<SettingsBloc>().add(SettingsEvent.searchHistoryEnabledSwitched(value));
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
            title: Text('Pause watch history'),
            onChanged: (bool value) {
              context.read<SettingsBloc>().add(SettingsEvent.watchHistoryEnabledSwitched(value));
            },
          );
        },
      ),
      ListTile(
        title: Text('Clear favorites'),
        subtitle: Text('make all of the movies unfavored and clear favorites\' page'),
        onTap: () {
          showConfirmationDialog(
            context,
            'Delete favorite movies?',
            'This will clear the list on favorites page\nconfirm to delete',
            'DELETE FAVOURITES',
            () {
              context.read<SettingsBloc>().add(SettingsEvent.clearFavoritesRequested());
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
            FlatButton(
              onPressed: () => Navigator.pop(context),
              child: Text('CANCEL'),
            ),
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
        title: Text('${e} sec'),
        value: e,
        onChanged: (int value) {
          if (value != currentValue) {
            context.read<SettingsBloc>().add(SettingsEvent.doubleTapToSeekValueChanged(value));
          }
          Navigator.pop(context);
          return value;
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
          title: Text('Double-tap to seek'),
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
