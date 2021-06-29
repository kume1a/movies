import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../state/settings/settings_bloc.dart';
import 'dialog_confirmation.dart';

class TileClearCache extends StatelessWidget {
  const TileClearCache({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
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
    );
  }
}
