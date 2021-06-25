import '../../schemas/core/enums.dart';
import '../../schemas/core/type_mappers.dart';
import '../../schemas/season_files/files_schema.dart';

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

  final int id;
  final Quality quality;
  final String src;
  final int duration;

  @override
  String toString() {
    return 'EpisodeFile{id: $id, quality: $quality, src: $src, duration: $duration}';
  }
}
