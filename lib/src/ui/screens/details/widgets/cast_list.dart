import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/model/core/option.dart';
import '../../../../data/model/schemas/actors/actors_model.dart';
import '../../../../state/details/details_bloc.dart';
import '../../../core/widgets/blank_container.dart';
import '../../../core/widgets/safe_image.dart';
import '../../../values/text_styles.dart';

class CastList extends StatelessWidget {
  static const double itemWidth = 120;
  static const double itemHeight = 160;
  static const double radius = 12;
  static const double spacing = 16;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: BlocBuilder<DetailsBloc, DetailsState>(
        buildWhen: (DetailsState prev, DetailsState curr) => prev.actorsOption != curr.actorsOption,
        builder: (BuildContext context, DetailsState state) {
          return _buildList(state.actorsOption);
        },
      ),
    );
  }

  Widget _buildList(Option<Actors> actorsOption) {
    int total = 0;
    int length = 0;
    actorsOption.fold(
      () {},
      (Actors actors) {
        total = actors.totalCount;
        length = actors.actors.length;
      },
    );

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: spacing / 2),
      itemCount: total == length ? length : length + 10,
      itemBuilder: (BuildContext context, int index) {
        return actorsOption.fold(
          () => _buildBlankItem(),
          (Actors actors) {
            if (index >= length) {
              context.read<DetailsBloc>().add(const DetailsEvent.castPageFetchRequested());
              return _buildBlankItem();
            }
            return _buildItem(actors.actors[index]);
          },
        );
      },
    );
  }

  Widget _buildItem(Actor actor) {
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
              actor.name,
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
          )),
    );
  }
}
