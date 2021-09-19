import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/details/details_controller.dart';
import '../../../core/extensions/model_l10n/actor_l10n_extensions.dart';
import '../../../data/model/models/actors/actor.dart';
import '../../../data/model/models/actors/actors.dart';
import '../../core/values/text_styles.dart';
import '../../core/widgets/blank_container.dart';
import '../../core/widgets/safe_image.dart';

class CastList extends GetView<DetailsController> {
  static const double itemWidth = 120;
  static const double itemHeight = 160;
  static const double radius = 12;
  static const double spacing = 16;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      child: Obx(() => _buildList(controller.actors.value)),
    );
  }

  Widget _buildList(Actors? actors) {
    int total = 0;
    int length = 0;
    if (actors != null) {
      total = actors.totalCount;
      length = actors.actors.length;
    }

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: spacing / 2),
      itemCount: total == length ? length : length + 10,
      itemBuilder: (BuildContext context, int index) {
        if (actors == null) {
          return _buildBlankItem();
        }
        if (index >= length) {
          controller.onCastPageFetchRequested();
          return _buildBlankItem();
        }
        return _buildItem(context, actor: actors.actors[index]);
      },
    );
  }

  Widget _buildItem(
    BuildContext context, {
    required Actor actor,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: spacing / 2),
      child: Column(
        children: <Widget>[
          SafeImage(
            imageUrl: actor.poster,
            defaultAssetPath: 'assets/default_profile.jpg',
            width: itemWidth,
            height: itemHeight,
            radius: radius,
          ),
          const SizedBox(height: 4),
          SizedBox(
            width: itemWidth,
            child: Text(
              actor.getName(),
              style: prB15,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBlankItem() {
    return const Padding(
      padding: EdgeInsets.only(left: 16.0),
      child: Align(
        alignment: Alignment.topCenter,
        child: BlankContainer(
          width: 120,
          height: 160,
          radius: radius,
        ),
      ),
    );
  }
}
