import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/enums/language.dart';
import '../../../../core/enums/quality.dart';
import '../../../../core/helpers/enum_to_string.dart';
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
    final String language = map[TableEpisodeFiles.columnLanguage] as String? ?? '';
    final String quality = map[TableEpisodeFiles.columnQuality] as String? ?? '';

    return DBEpisodeFile(
      id: map[TableEpisodeFiles.columnId] as int?,
      episodeId: map[TableEpisodeFiles.columnId] as int? ?? -1,
      language: EnumToString.fromString(Language.values, language)!,
      episodeFileId: map[TableEpisodeFiles.columnEpisodeFileId] as int? ?? -1,
      quality: EnumToString.fromString(Quality.values, quality)!,
      src: map[TableEpisodeFiles.columnSrc] as String? ?? '',
      duration: map[TableEpisodeFiles.columnDuration] as int? ?? -1,
    );
  }
}
