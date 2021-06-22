import 'package:flutter/material.dart';

import '../../../routes/routes.dart';
import '../../../values/colors.dart';
import '../../../values/text_styles.dart';

class SearchHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 32, 16, 24),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, Routes.searchPage);
        },
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
