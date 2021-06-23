import 'package:hive/hive.dart';

import '../../../local/hive_box_holder.dart';
import '../../schemas/season_files/season_files_schema.dart';
import 'episode.dart';

part 'season_files.g.dart';

@HiveType(typeId: HiveTypeIdHolder.seasonFilesId)
class SeasonFiles {
  SeasonFiles(this.season, this.data);

  factory SeasonFiles.fromSchema(int season, SeasonFilesSchema schema) {
    final List<Episode> episodes =
        schema.data?.map((SeasonFilesDataSchema e) => Episode.fromSchema(e)).toList() ?? List<Episode>.empty();

    return SeasonFiles(season, episodes.cast<Episode>());
  }

  @HiveField(0)
  final int season;

  @HiveField(1)
  final List<Episode> data;

  @override
  String toString() => 'SeasonFiles{data: $data}';
}

