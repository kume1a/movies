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
      id: map[TableDBEpisodes.columnId] as int?,
      seasonFilesId: map[TableDBEpisodes.columnSeasonFilesId] as int? ?? -1,
      episode: map[TableDBEpisodes.columnEpisode] as int? ?? -1,
      title: map[TableDBEpisodes.columnTitle] as String? ?? '',
      description: map[TableDBEpisodes.columnDescription] as String? ?? '',
      rating: map[TableDBEpisodes.columnRating],
      poster: map[TableDBEpisodes.columnPoster] as String? ?? '',
    );
  }
}
