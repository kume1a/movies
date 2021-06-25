import '../../schemas/season_files/season_files_schema.dart';
import 'episode.dart';

class SeasonFiles {
  SeasonFiles(this.season, this.data);

  factory SeasonFiles.fromSchema(int season, SeasonFilesSchema schema) {
    final List<Episode> episodes =
        schema.data?.map((SeasonFilesDataSchema e) => Episode.fromSchema(e)).toList() ?? List<Episode>.empty();

    return SeasonFiles(season, episodes);
  }

  final int season;
  final List<Episode> data;

  @override
  String toString() => 'SeasonFiles{data: $data}';
}

