import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/stream/stream_controller.dart';
import '../../../data/model/models/seasons/episode.dart';
import '../../../data/model/models/seasons/season_files.dart';
import '../../../l10n/parameterized_translations.dart';
import '../../core/formatters.dart';
import '../../core/values/text_styles.dart';
import '../../core/widgets/safe_image.dart';

const double _imageWidth = 150;
const double _imageHeight = _imageWidth / 3 * 2;
const double _radius = 8;

class EpisodeList extends GetView<StreamController> {
  const EpisodeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final SeasonFiles? seasonFiles = controller.seasonFiles.value;

      return seasonFiles != null
          ? Expanded(
              child: ListView.builder(
                itemCount: seasonFiles.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Obx(
                    () => _EpisodeItem(
                      episode: seasonFiles.data[index],
                      isSelected:
                          controller.episode.value == index + 1 && controller.episodeSeason.value == seasonFiles.season,
                    ),
                  );
                },
              ),
            )
          : const SizedBox.shrink();
    });
  }
}

class _EpisodeItem extends GetView<StreamController> {
  const _EpisodeItem({
    Key? key,
    required this.episode,
    required this.isSelected,
  }) : super(key: key);

  final Episode episode;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final int duration = episode.episodes.values.first.first.duration;

    return GestureDetector(
      onTap: () => controller.onEpisodeChanged(episode.episode),
      child: Container(
        color: isSelected ? Colors.white.withOpacity(.04) : Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: <Widget>[
            SafeImage(
              imageUrl: episode.poster,
              height: _imageHeight,
              width: _imageWidth,
              radius: _radius,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 12),
                child: _buildDetails(
                  context,
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
    BuildContext context, {
    required int episode,
    required String title,
    required int duration,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(ParameterizedTranslations.streamEpisode(episode), style: scL14),
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
