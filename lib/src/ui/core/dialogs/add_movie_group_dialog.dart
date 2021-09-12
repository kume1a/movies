import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../core/routes/screens_navigator.dart';
import '../../core/widgets/tap_outside_to_clear_focus.dart';
import '../values/colors.dart';

Future<String?> showAddMovieGroupDialog(BuildContext context) async {
  return showDialog(
    context: context,
    builder: (_) => const _AddMovieGroupDialog(),
  );
}

class _AddMovieGroupDialog extends HookWidget {
  const _AddMovieGroupDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<String> text = useState('');

    final AppLocalizations? appLocalizations = AppLocalizations.of(context);

    return TapOutsideToClearFocus(
      child: Dialog(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _buildHeader(appLocalizations),
              const SizedBox(height: 32),
              _buildNameField(appLocalizations, text),
              const SizedBox(height: 64),
              Row(
                children: <Widget>[
                  Expanded(child: _buildCancelButton(appLocalizations)),
                  const SizedBox(width: 16),
                  Expanded(child: _buildSaveButton(appLocalizations, text)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(AppLocalizations? appLocalizations) {
    return Text(
      appLocalizations?.favoritesHeaderAddGroup ?? '',
      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.white),
    );
  }

  Widget _buildNameField(AppLocalizations? appLocalizations, ValueNotifier<String> text) {
    return TextField(
      decoration: InputDecoration(
        enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        hintText: appLocalizations?.favoritesAddGroupHintNameField ?? '',
      ),
      onChanged: (String value) {
        text.value = value;
      },
    );
  }

  Widget _buildCancelButton(AppLocalizations? appLocalizations) {
    return TextButton(
      onPressed: () => ScreensNavigator.pop(),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(colorPrimary),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white54),
        overlayColor: MaterialStateProperty.all<Color>(Colors.white12),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      ),
      child: Text(appLocalizations?.cancel ?? ''),
    );
  }

  Widget _buildSaveButton(AppLocalizations? appLocalizations, ValueNotifier<String> text) {
    return TextButton(
      onPressed: text.value.isNotEmpty ? () => ScreensNavigator.pop(result: text.value) : null,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith(
          (Set<MaterialState> states) =>
              states.contains(MaterialState.disabled) ? colorAccent.withOpacity(.6) : colorAccent,
        ),
        foregroundColor: MaterialStateProperty.resolveWith(
          (Set<MaterialState> states) =>
              states.contains(MaterialState.disabled) ? Colors.white.withOpacity(.6) : Colors.white,
        ),
        overlayColor: MaterialStateProperty.all<Color>(Colors.white24),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      ),
      child: Text(appLocalizations?.save ?? ''),
    );
  }
}
