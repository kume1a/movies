import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/models/seasons/episode.dart';
import '../../../state/stream/stream_bloc.dart';
import '../../core/formatters.dart';
import '../../core/values/text_styles.dart';
import '../../core/widgets/safe_image.dart';

class EpisodeList extends StatelessWidget {
  static const double imageWidth = 150;
  static const double imageHeight = imageWidth / 3 * 2;
  static const double radius = 8;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? appLocalizations = AppLocalizations.of(context);

    return BlocBuilder<StreamBloc, StreamState>(
      buildWhen: (StreamState prev, StreamState curr) =>
          prev.episode != curr.episode ||
          prev.season != curr.season ||
          prev.episodeSeason != curr.episodeSeason ||
          prev.seasonFiles != curr.seasonFiles,
      builder: (BuildContext context, StreamState state) {
        return state.seasonFiles != null
            ? Expanded(
                child: ListView.builder(
                  itemCount: state.seasonFiles!.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _buildItem(
                      context,
                      appLocalizations,
                      episode: state.seasonFiles!.data[index],
                      isSelected: state.episode == index + 1 && state.episodeSeason == state.seasonFiles!.season,
                    );
                  },
                ),
              )
            : const SizedBox.shrink();
      },
    );
  }

  Widget _buildItem(
    BuildContext context,
    AppLocalizations? appLocalizations, {
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
                child: _buildDetails(
                  context,
                  appLocalizations,
                  episode: episode.episode,
                  title: episode.title,
                  duration: duration,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildDetails(
    BuildContext context,
    AppLocalizations? appLocalizations, {
    required int episode,
    required String title,
    required int duration,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(appLocalizations?.streamEpisode(episode) ?? '', style: scL14),
        const SizedBox(height: 12),
        Text(title, style: prSB18),
        const SizedBox(height: 32),
        Align(
          alignment: Alignment.bottomRight,
          child: Text(formatDurationFromSeconds(context, duration), style: sc10),
        )
      ],
    );
  }
}
