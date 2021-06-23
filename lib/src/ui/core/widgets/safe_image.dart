import 'package:flutter/material.dart';

import '../../values/colors.dart';
import '../extensions.dart';
import 'blank_container.dart';

class SafeImage extends StatelessWidget {
  const SafeImage({
    required this.imageUrl,
    this.width = 0,
    this.height = 0,
    this.defaultAssetPath,
    this.radius = 0,
    this.blankColor = colorPreview,
  });

  final String? imageUrl;
  final String? defaultAssetPath;
  final double width;
  final double height;
  final double radius;
  final Color blankColor;

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null || imageUrl!.isNullEmptyOrWhitespace) {
      if (defaultAssetPath != null) {
        return _image(AssetImage(defaultAssetPath!));
      }

      return _blankContainer();
    }

    return _image(NetworkImage(imageUrl!));
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
