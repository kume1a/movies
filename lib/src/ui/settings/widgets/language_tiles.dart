import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../core/enums/supported_locale.dart';
import '../../../state/app/app_bloc.dart';
import '../../core/dialogs/language_selector_dilaog.dart';

class TileLanguage extends StatelessWidget {
  const TileLanguage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? appLocalizations = AppLocalizations.of(context);

    return BlocBuilder<AppBloc, AppState>(
      buildWhen: (AppState previous, AppState current) => previous.selectedLocale != current.selectedLocale,
      builder: (BuildContext context, AppState state) {
        return ListTile(
          title: Text(appLocalizations?.settingsChangeLanguage ?? ''),
          onTap: () async {
            final SupportedLocale? selectedLocale = await showLanguageSelectorDialog(
              context,
              selectedLocale: state.selectedLocale,
            );

            if (selectedLocale != null) {
              context.read<AppBloc>().add(AppEvent.localeChanged(selectedLocale));
            }
          },
        );
      },
    );
  }
}
