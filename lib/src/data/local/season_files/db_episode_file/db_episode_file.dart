import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/helpers/enum_to_string.dart';
import '../../../model/schemas/core/enums.dart';
import '../../tables.dart';

part 'db_episode_file.freezed.dart';

@freezed
class DBEpisodeFile with _$DBEpisodeFile {
  const factory DBEpisodeFile({
    int? id,
    required int episodeId,
    required Language language,
    required int episodeFileId,
    required Quality quality,
    required String src,
    required int duration,
  }) = _DBEpisodeFile;

  factory DBEpisodeFile.fromMap(Map<String, dynamic> map) {
    final String language = map[TableDBEpisodeFiles.columnLanguage] as String? ?? '';
    final String quality = map[TableDBEpisodeFiles.columnQuality] as String? ?? '';

    return DBEpisodeFile(
      id: map[TableDBEpisodeFiles.columnId] as int?,
      episodeId: map[TableDBEpisodeFiles.columnId] as int? ?? -1,
      language: EnumToString.fromString(Language.values, language)!,
      episodeFileId: map[TableDBEpisodeFiles.columnEpisodeFileId] as int? ?? -1,
      quality: EnumToString.fromString(Quality.values, quality)!,
      src: map[TableDBEpisodeFiles.columnSrc] as String? ?? '',
      duration: map[TableDBEpisodeFiles.columnDuration] as int? ?? -1,
    );
  }
}
