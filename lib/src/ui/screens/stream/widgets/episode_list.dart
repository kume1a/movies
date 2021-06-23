import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/model/core/option.dart';
import '../../../../data/model/schemas/actors/season_files/season_files_model.dart';
import '../../../../state/stream/stream_bloc.dart';
import '../../../core/extensions.dart';
import '../../../core/formatters.dart';
import '../../../core/widgets/safe_image.dart';
import '../../../values/text_styles.dart';

class EpisodeList extends StatelessWidget {
  static const double imageWidth = 150;
  static const double imageHeight = imageWidth / 3 * 2;
  static const double radius = 8;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StreamBloc, StreamState>(
      buildWhen: (StreamState prev, StreamState curr) =>
          prev.episode != curr.episode ||
          prev.season != curr.season ||
          prev.episodeSeason != curr.episodeSeason ||
          !prev.seasonFilesOption.equals(curr.seasonFilesOption),
      builder: (BuildContext context, StreamState state) =>
          _buildList(state.seasonFilesOption, state.episode, state.episodeSeason),
    );
  }

  Widget _buildList(Option<SeasonFiles> seasonFilesOption, int episode, int episodeSeason) {
    return seasonFilesOption.fold(
      () => const SizedBox.shrink(),
      (SeasonFiles seasonFiles) {
        return Expanded(
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return _buildItem(
                context: context,
                episode: seasonFiles.data[index],
                isSelected: episode == index + 1 && episodeSeason == seasonFiles.season,
              );
            },
            itemCount: seasonFiles.data.length,
          ),
        );
      },
    );
  }

  Widget _buildItem({
    required BuildContext context,
    required Episode episode,
    required bool isSelected,
  }) {
    final int duration = episode.episodes.values.first.first.duration;

    return GestureDetector(
      onTap: () => context.read<StreamBloc>().add(StreamEvent.episodeChanged(episode.episode)),
      child: Container(
        color: isSelected ? Colors.white.withOpacity(.04) : Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: <Widget>[
            SafeImage(
              imageUrl: episode.poster,
              height: imageHeight,
              width: imageWidth,
              radius: radius,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 12),
                child: _buildDetails(episode.episode, episode.title, duration),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildDetails(int episode, String title, int duration) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Episode $episode', style: scL14),
        const SizedBox(height: 12),
        Text(title, style: prSB18),
        const SizedBox(height: 32),
        Align(
          alignment: Alignment.bottomRight,
          child: Text(formatDurationFromSeconds(duration), style: sc10),
        )
      ],
    );
  }
}
