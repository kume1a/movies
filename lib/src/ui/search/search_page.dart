import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

import '../../controllers/search/search_controller.dart';
import '../core/values/colors.dart';
import '../core/widgets/search_bar.dart';
import '../core/widgets/tap_outside_to_clear_focus.dart';
import 'widgets/widgets.dart';

class SearchPage extends GetView<SearchController> {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? appLocalizations = AppLocalizations.of(context);

    return Scaffold(
      body: SafeArea(
        child: TapOutsideToClearFocus(
          child: Container(
            color: Colors.transparent,
            child: Column(
              children: <Widget>[
                const SizedBox(height: 4),
                SearchBar(
                  onBackPressed: () => Navigator.pop(context),
                  onChanged: controller.onQueryChanged,
                  decoration: InputDecoration(
                    hintText: appLocalizations?.searchFieldHint ?? '',
                    counterText: '',
                    fillColor: Colors.white,
                    hintStyle: const TextStyle(color: colorTextSecondary),
                    border: InputBorder.none,
                  ),
                ),
                const SizedBox(height: 8),
                MovieList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
