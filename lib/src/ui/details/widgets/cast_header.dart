import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../state/details/details_bloc.dart';
import '../../core/values/text_styles.dart';

class CastHeader extends StatelessWidget {
  const CastHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? appLocalizations = AppLocalizations.of(context);

    return BlocBuilder<DetailsBloc, DetailsState>(
      buildWhen: (DetailsState previous, DetailsState current) => previous.actors != current.actors,
      builder: (BuildContext context, DetailsState state) {
        return (state.actors?.actors.isNotEmpty ?? true)
            ? Text(appLocalizations?.detailsHeaderCast ?? '', style: prB22)
            : const SizedBox.shrink();
      },
    );
  }
}
