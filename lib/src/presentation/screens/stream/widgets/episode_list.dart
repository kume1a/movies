import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movo/src/application/stream/stream_bloc.dart';
import 'package:movo/src/domain/actors/season_files/season_files_model.dart';
import 'package:movo/src/presentation/core/formatters.dart';
import 'package:movo/src/presentation/core/widgets/safe_image.dart';
import 'package:movo/src/presentation/values/text_styles.dart';

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
          prev.episodeSeason != curr.episodeSeason,
      builder: (BuildContext context, StreamState state) =>
          _buildList(state.seasonFilesOption, state.episode, state.episodeSeason),
    );
  }

  Widget _buildList(Option<SeasonFiles> seasonFilesOption, int episode, int season) {
    return seasonFilesOption.fold(
      () => const SizedBox.shrink(),
      (SeasonFiles seasonFiles) {
        return Expanded(
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return _buildItem(
                context,
                index,
                seasonFiles.data[index],
                episode == index && season == seasonFiles.season,
              );
            },
            itemCount: seasonFiles.data.length,
          ),
        );
      },
    );
  }

  Widget _buildItem(BuildContext context, int index, Episode episode, bool selected) {
    final int duration = episode.episodes.values.toList()[0][0].duration;

    return GestureDetector(
      onTap: () => context.read<StreamBloc>().add(StreamEvent.episodeChanged(index)),
      child: Container(
        color: selected ? Colors.white.withOpacity(.04) : Colors.transparent,
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
