import 'package:freezed_annotation/freezed_annotation.dart';

import '../../schemas/season_files/season_files_schema.dart';
import 'episode.dart';

part 'season_files.freezed.dart';

@freezed
class SeasonFiles with _$SeasonFiles {
  const factory SeasonFiles({
    required int season,
    required List<Episode> data,
  }) = _SeasonFiles;

  factory SeasonFiles.fromSchema(int season, SeasonFilesSchema schema) {
    final List<Episode> episodes =
        schema.data?.map((SeasonFilesDataSchema e) => Episode.fromSchema(e)).toList() ?? List<Episode>.empty();

    return SeasonFiles(
      season: season,
      data: episodes,
    );
  }
}
