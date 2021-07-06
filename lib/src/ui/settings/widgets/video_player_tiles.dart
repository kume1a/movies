import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../state/settings/settings_bloc.dart';
import '../../core/dialogs/dtap_to_seek_value_chooser_dialog.dart';

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
          onTap: () async {
            final int? newValue = await showDoubleTapToSeekValueChooserDialog(
              context,
              currentValue: state.doubleTapToSeekValue,
            );

            if (newValue != null) {
              context.read<SettingsBloc>().add(SettingsEvent.doubleTapToSeekValueChanged(newValue));
            }
          },
        );
      },
    );
  }
}
