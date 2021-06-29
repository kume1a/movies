import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../state/settings/settings_bloc.dart';

class TileAutoPlay extends StatelessWidget {
  const TileAutoPlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
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
    );
  }
}

class TileDoubleTapToSeek extends StatelessWidget {
  const TileDoubleTapToSeek({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      buildWhen: (SettingsState prev, SettingsState curr) => prev.doubleTapToSeekValue != curr.doubleTapToSeekValue,
      builder: (BuildContext context, SettingsState state) {
        return ListTile(
          title: const Text('Double-tap to seek'),
          subtitle: Text('${state.doubleTapToSeekValue} seconds'),
          onTap: () => _showSeekValueChooser(context, state.doubleTapToSeekValue),
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
