import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../state/settings/settings_bloc.dart';
import '../../core/dialogs/dtap_to_seek_value_chooser_dialog.dart';

class TileAutoPlay extends StatelessWidget {
  const TileAutoPlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? appLocalizations = AppLocalizations.of(context);

    return BlocBuilder<SettingsBloc, SettingsState>(
      buildWhen: (SettingsState prev, SettingsState curr) => prev.autoPlayEnabled != curr.autoPlayEnabled,
      builder: (BuildContext context, SettingsState state) {
        return SwitchListTile(
          value: state.autoPlayEnabled,
          title: Text(appLocalizations?.settingsAutoplay ?? ''),
          subtitle: Text(appLocalizations?.settingsCommentAutoplay ?? ''),
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
    final AppLocalizations? appLocalizations = AppLocalizations.of(context);

    return BlocBuilder<SettingsBloc, SettingsState>(
      buildWhen: (SettingsState prev, SettingsState curr) => prev.doubleTapToSeekValue != curr.doubleTapToSeekValue,
      builder: (BuildContext context, SettingsState state) {
        return ListTile(
          title: Text(appLocalizations?.settingsDoubleTapToSeek ?? ''),
          subtitle: Text(appLocalizations?.settingsCommentDoubleTapToSeek(state.doubleTapToSeekValue) ?? ''),
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
