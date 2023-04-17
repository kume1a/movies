import 'package:flutter/material.dart';

import '../routes/screens_navigator.dart';

class OptionsSelectorBottomSheet<T extends Enum> extends StatelessWidget {
  const OptionsSelectorBottomSheet({
    super.key,
    required this.options,
    required this.toStringMapper,
  });

  final List<T> options;
  final String Function(T option) toStringMapper;

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);

    return Material(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: mediaQueryData.size.height * .6,
        ),
        child: ListView.builder(
          shrinkWrap: true,
          itemBuilder: (_, int index) {
            final T option = options[index];

            return ListTile(
              title: Text(toStringMapper.call(option)),
              onTap: () => ScreensNavigator.pop(result: option),
            );
          },
          itemCount: options.length,
        ),
      ),
    );
  }
}
