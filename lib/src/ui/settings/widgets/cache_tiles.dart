import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../state/settings/settings_bloc.dart';
import '../../core/widgets/confirmation_dialog.dart';

class TileClearCache extends StatelessWidget {
  const TileClearCache({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Clear cache'),
      subtitle: const Text('clear cached movies and season files'),
      onTap: () async {
        final bool didConfirm = await showConfirmationDialog(
          context,
          title: 'Clear cache?',
          content: 'The action will delete all the cached movies and seasons',
          confirmationText: 'DELETE CACHE',
        );

        if (didConfirm) {
          context.read<SettingsBloc>().add(const SettingsEvent.clearCacheRequested());
        }
      },
    );
  }
}
