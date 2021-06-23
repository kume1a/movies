import 'package:hive/hive.dart';

import '../../../local/hive_box_holder.dart';
import '../../schemas/core/enums.dart';
import '../../schemas/core/type_mappers.dart';
import '../../schemas/season_files/files_schema.dart';

part 'episode_file.g.dart';

@HiveType(typeId: HiveTypeIdHolder.episodeFileId)
class EpisodeFile {
  EpisodeFile({
    required this.id,
    required this.quality,
    required this.src,
    required this.duration,
  });

  factory EpisodeFile.fromSchema(FileSchema schema) {
    return EpisodeFile(
      id: schema.id ?? 0,
      quality: getQuality(schema.quality),
      src: schema.src ?? '',
      duration: schema.duration ?? 0,
    );
  }

  factory EpisodeFile.empty() {
    return EpisodeFile(id: 0, quality: Quality.high, src: '', duration: 0);
  }

  @HiveField(0)
  final int id;

  @HiveField(1)
  final Quality quality;

  @HiveField(2)
  final String src;

  @HiveField(3)
  final int duration;

  @override
  String toString() {
    return 'EpisodeFile{id: $id, quality: $quality, src: $src, duration: $duration}';
  }
}
