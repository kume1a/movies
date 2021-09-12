import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../di/injection.dart';
import '../../state/search/search_bloc.dart';
import '../core/values/colors.dart';
import '../core/widgets/search_bar.dart';
import '../core/widgets/tap_outside_to_clear_focus.dart';
import 'widgets/widgets.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchBloc>(
      create: (_) => getIt<SearchBloc>(),
      child: SearchPageContent(),
    );
  }
}

class SearchPageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppLocalizations? appLocalizations = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: colorPrimary,
      body: SafeArea(
        child: TapOutsideToClearFocus(
          child: Container(
            color: Colors.transparent,
            child: Column(
              children: <Widget>[
                const SizedBox(height: 4),
                SearchBar(
                  onBackPressed: () => Navigator.pop(context),
                  onChanged: (String value) => context.read<SearchBloc>().add(SearchEvent.queryChanged(value)),
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
