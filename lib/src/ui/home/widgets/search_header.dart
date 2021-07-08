import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../core/routes/screens_navigator.dart';
import '../../core/values/colors.dart';
import '../../core/values/text_styles.dart';

class SearchHeader extends StatelessWidget {
  const SearchHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? appLocalizations = AppLocalizations.of(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 32, 16, 24),
      child: GestureDetector(
        onTap: () => ScreensNavigator.pushSearchPage(),
        child: Container(
          color: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(appLocalizations?.search ?? '', style: scL16),
              const SizedBox(height: 4),
              Text(appLocalizations?.homeHeaderSearch ?? '', style: sc22),
              const Divider(color: colorTextSecondary)
            ],
          ),
        ),
      ),
    );
  }
}
