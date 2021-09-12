import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

import '../../../controllers/home/home_controller.dart';
import '../../core/values/colors.dart';

class SearchHeader extends GetView<HomeController> {
  const SearchHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? appLocalizations = AppLocalizations.of(context);
    final ThemeData theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 32, 16, 24),
      child: GestureDetector(
        onTap: controller.onSearchPressed,
        child: Container(
          color: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                appLocalizations?.homeHeaderSearch ?? '',
                style: theme.textTheme.headline6?.copyWith(color: colorTextSecondary, fontWeight: FontWeight.w300),
              ),
              const Divider(color: colorTextSecondary)
            ],
          ),
        ),
      ),
    );
  }
}
