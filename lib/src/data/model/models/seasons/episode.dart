import 'package:freezed_annotation/freezed_annotation.dart';

import '../../schemas/core/enums.dart';
import '../../schemas/core/type_mappers.dart';
import '../../schemas/season_files/files_schema.dart';
import '../../schemas/season_files/season_files_schema.dart';
import 'episode_file.dart';

part 'episode.freezed.dart';

@freezed
class Episode with _$Episode {
  const factory Episode({
    required int episode,
    required String title,
    required String description,
    required dynamic rating,
    required String poster,
    required Map<Resolution, String> covers,
    required Map<Language, List<EpisodeFile>> episodes,
  }) = _Episode;

  factory Episode.fromSchema(SeasonFilesDataSchema schema) {
    final Map<Resolution, String> covers = <Resolution, String>{
      Resolution.fhd: schema.covers?.data?.s1920 ?? '',
      Resolution.hd: schema.covers?.data?.s1050 ?? '',
      Resolution.vga: schema.covers?.data?.s510 ?? '',
    };

    final Map<Language, List<EpisodeFile>> episodes = <Language, List<EpisodeFile>>{
      if (schema.files != null)
        for (FilesSchema e in schema.files!)
          getLanguage(e.lang):
              e.files?.map((FileSchema file) => EpisodeFile.fromSchema(file)).toList() ?? List<EpisodeFile>.empty()
    };

    return Episode(
      episode: schema.episode ?? 0,
      title: schema.title ?? '',
      description: schema.description ?? '',
      rating: schema.rating ?? 0,
      poster: schema.poster ?? '',
      covers: covers,
      episodes: episodes,
    );
  }
}
