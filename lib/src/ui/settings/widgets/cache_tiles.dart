import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../state/settings/settings_bloc.dart';
import '../../core/dialogs/confirmation_dialog.dart';

class TileClearCache extends StatelessWidget {
  const TileClearCache({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? appLocalizations = AppLocalizations.of(context);

    return ListTile(
      title: Text(appLocalizations?.settingsClearCache ?? ''),
      subtitle: Text(appLocalizations?.settingsCommentClearCache ?? ''),
      onTap: () async {
        final bool didConfirm = await showConfirmationDialog(
          context,
          title: appLocalizations?.settingsClearCacheDialogHeader ?? '',
          content: appLocalizations?.settingsClearCacheDialogContent ?? '',
          confirmationText: appLocalizations?.clear ?? '',
        );

        if (didConfirm) {
          context.read<SettingsBloc>().add(const SettingsEvent.clearCacheRequested());
        }
      },
    );
  }
}
