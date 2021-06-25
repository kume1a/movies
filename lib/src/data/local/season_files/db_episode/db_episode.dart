import 'package:freezed_annotation/freezed_annotation.dart';

import '../../tables.dart';

part 'db_episode.freezed.dart';

@freezed
class DBEpisode with _$DBEpisode {
  const factory DBEpisode({
    int? id,
    required int seasonFilesId,
    required int episode,
    required String title,
    required String description,
    required dynamic rating,
    required String poster,
  }) = _DBEpisode;

  factory DBEpisode.fromMap(Map<String, dynamic> map) {
    return DBEpisode(
      id: map[TableEpisodes.columnId] as int?,
      seasonFilesId: map[TableEpisodes.columnSeasonFilesId] as int? ?? -1,
      episode: map[TableEpisodes.columnEpisode] as int? ?? -1,
      title: map[TableEpisodes.columnTitle] as String? ?? '',
      description: map[TableEpisodes.columnDescription] as String? ?? '',
      rating: map[TableEpisodes.columnRating],
      poster: map[TableEpisodes.columnPoster] as String? ?? '',
    );
  }
}
