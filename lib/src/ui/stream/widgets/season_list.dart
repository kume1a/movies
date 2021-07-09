import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../state/stream/stream_bloc.dart';
import '../../core/values/text_styles.dart';

class SeasonList extends StatelessWidget {
  const SeasonList({required this.seasonNumbers});

  final List<int> seasonNumbers;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? appLocalizations = AppLocalizations.of(context);

    return SizedBox(
      height: 50,
      child: BlocBuilder<StreamBloc, StreamState>(
        buildWhen: (StreamState prev, StreamState curr) => prev.season != curr.season,
        builder: (BuildContext context, StreamState state) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: seasonNumbers.length,
            itemBuilder: (BuildContext context, int index) {
              return _buildItem(
                context,
                appLocalizations,
                seasonNumber: seasonNumbers[index],
                isActive: state.season == seasonNumbers[index],
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildItem(
    BuildContext context,
    AppLocalizations? appLocalizations, {
    required int seasonNumber,
    required bool isActive,
  }) {
    return GestureDetector(
      onTap: () => context.read<StreamBloc>().add(StreamEvent.seasonChanged(seasonNumber)),
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(left: 12, right: 8),
        child: AnimatedDefaultTextStyle(
          style: isActive ? prSB18 : scSB18,
          duration: const Duration(milliseconds: 300),
          child: Text(appLocalizations?.streamSeason(seasonNumber) ?? ''),
        ),
      ),
    );
  }
}
