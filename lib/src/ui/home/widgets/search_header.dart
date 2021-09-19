import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/main/home_controller.dart';
import '../../../l10n/translation_keys.dart';
import '../../core/values/colors.dart';

class SearchHeader extends GetView<HomeController> {
  const SearchHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                trHomeHeaderSearch.tr,
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
