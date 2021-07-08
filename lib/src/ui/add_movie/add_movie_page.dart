import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../di/injection.dart';
import '../../state/add_movie/add_movie_bloc.dart';
import '../core/values/colors.dart';
import '../core/widgets/search_bar.dart';
import '../core/widgets/tap_outside_to_clear_focus.dart';
import 'widgets/widgets.dart';

class AddMoviePage extends StatelessWidget {
  const AddMoviePage({
    Key? key,
    required this.groupId,
  }) : super(key: key);

  final int groupId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddMovieBloc>(
      create: (_) => getIt<AddMovieBloc>()..add(AddMovieEvent.init(groupId)),
      child: const _AddMoviePageContent(),
    );
  }
}

class _AddMoviePageContent extends StatelessWidget {
  const _AddMoviePageContent({Key? key}) : super(key: key);

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
                  onChanged: (String value) => context.read<AddMovieBloc>().add(AddMovieEvent.queryChanged(value)),
                  decoration: InputDecoration(
                    hintText: appLocalizations?.addMovieHintSearchField ?? '',
                    counterText: '',
                    fillColor: Colors.white,
                    hintStyle: const TextStyle(color: colorTextSecondary),
                    border: InputBorder.none,
                  ),
                ),
                const SizedBox(height: 8),
                const Expanded(child: Movies()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
