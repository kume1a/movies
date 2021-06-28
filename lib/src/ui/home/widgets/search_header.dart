import 'package:flutter/material.dart';

import '../../core/routes/screens_navigator.dart';
import '../../core/values/colors.dart';
import '../../core/values/text_styles.dart';

class SearchHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 32, 16, 24),
      child: GestureDetector(
        onTap: () => ScreensNavigator.pushSearchPage(),
        child: Container(
          color: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              Text('search', style: scL16),
              SizedBox(height: 4),
              Text('Movies, Actors, Directors', style: sc22),
              Divider(color: colorTextSecondary)
            ],
          ),
        ),
      ),
    );
  }
}
