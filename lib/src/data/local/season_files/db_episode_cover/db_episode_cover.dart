import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/enums/resolution.dart';
import '../../../../core/helpers/enum_to_string.dart';
import '../../tables.dart';

part 'db_episode_cover.freezed.dart';

@freezed
class DBEpisodeCover with _$DBEpisodeCover {
  const factory DBEpisodeCover({
    int? id,
    required int episodeId,
    required Resolution resolution,
    required String cover,
  }) = _DBEpisodeCover;

  factory DBEpisodeCover.fromMap(Map<String, dynamic> map) {
    final String resolution = map[TableEpisodeCovers.columnResolution] as String? ?? '';

    return DBEpisodeCover(
      id: map[TableEpisodeCovers.columnId] as int?,
      episodeId: map[TableEpisodeCovers.columnEpisodeId] as int? ?? -1,
      resolution: EnumToString.fromString(Resolution.values, resolution)!,
      cover: map[TableEpisodeCovers.columnCover] as String? ??'',
    );
  }
}
