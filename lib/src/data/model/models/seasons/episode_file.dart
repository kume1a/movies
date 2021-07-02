import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/enums/quality.dart';
import '../../schemas/core/type_mappers.dart';
import '../../schemas/season_files/files_schema.dart';

part 'episode_file.freezed.dart';

@freezed
class EpisodeFile with _$EpisodeFile {
  const factory EpisodeFile({
    required int id,
    required Quality quality,
    required String src,
    required int duration,
  }) = _EpisodeFile;

  factory EpisodeFile.fromSchema(FileSchema schema) {
    return EpisodeFile(
      id: schema.id ?? 0,
      quality: getQuality(schema.quality),
      src: schema.src ?? '',
      duration: schema.duration ?? 0,
    );
  }

  factory EpisodeFile.empty() {
    return const EpisodeFile(
      id: 0,
      quality: Quality.high,
      src: '',
      duration: 0,
    );
  }
}
