import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:movo/src/presentation/core/extensions.dart';
import 'package:movo/src/presentation/core/widgets/blank_container.dart';
import 'package:movo/src/presentation/values/colors.dart';

class SafeImage extends StatelessWidget {
  final String imageUrl;
  final String defaultAssetPath;
  final double width;
  final double height;
  final double radius;
  final Color blankColor;

  const SafeImage({
    @required this.imageUrl,
    this.width = 0,
    this.height = 0,
    this.defaultAssetPath,
    this.radius = 0,
    this.blankColor = colorPreview,
  });

  @override
  Widget build(BuildContext context) {
    if (imageUrl.isNullEmptyOrWhitespace) {
      if (defaultAssetPath != null) {
        return _image(AssetImage(defaultAssetPath));
      }

      return _blankContainer();
    }

    return _image(NetworkImage(imageUrl));
  }

  Widget _image(ImageProvider imageProvider) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Image(
        image: imageProvider,
        width: width,
        height: height,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => _blankContainer(),
      ),
    );
  }

  Widget _blankContainer() {
    return BlankContainer(
      width: width,
      height: height,
      radius: radius,
      color: blankColor,
    );
  }
}
