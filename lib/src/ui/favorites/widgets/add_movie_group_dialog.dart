import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../core/routes/screens_navigator.dart';
import '../../core/values/colors.dart';
import '../../core/widgets/tap_outside_to_clear_focus.dart';

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
    final TextEditingController editingController = useTextEditingController();

    return TapOutsideToClearFocus(
      child: Dialog(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _buildHeader(),
              const SizedBox(height: 32),
              _buildNameField(editingController),
              const SizedBox(height: 64),
              Row(
                children: <Widget>[
                  Expanded(child: _buildCancelButton()),
                  const SizedBox(width: 16),
                  Expanded(child: _buildSaveButton(editingController)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return const Text(
      'Add Group',
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
    );
  }

  Widget _buildNameField(TextEditingController editingController) {
    return TextField(
      controller: editingController,
      decoration: const InputDecoration(
        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        hintText: 'Name',
      ),
    );
  }

  Widget _buildCancelButton() {
    return TextButton(
      onPressed: () => ScreensNavigator.pop(),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(colorPrimary),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white54),
        overlayColor: MaterialStateProperty.all<Color>(Colors.white12),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      ),
      child: const Text('Cancel'),
    );
  }

  Widget _buildSaveButton(TextEditingController editingController) {
    return TextButton(
      onPressed: () => ScreensNavigator.pop(editingController.text),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(colorAccent),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        overlayColor: MaterialStateProperty.all<Color>(Colors.white24),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      ),
      child: const Text('Save'),
    );
  }
}
