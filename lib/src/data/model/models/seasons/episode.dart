import 'package:hive/hive.dart';

import '../../../local/hive_box_holder.dart';
import '../../schemas/core/enums.dart';
import '../../schemas/core/type_mappers.dart';
import '../../schemas/season_files/files_schema.dart';
import '../../schemas/season_files/season_files_schema.dart';
import 'episode_file.dart';

part 'episode.g.dart';

@HiveType(typeId: HiveTypeIdHolder.episodeId)
class Episode {
  Episode({
    required this.episode,
    required this.title,
    required this.description,
    required this.rating,
    required this.poster,
    required this.covers,
    required this.episodes,
  });

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

  @HiveField(0)
  final int episode;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final dynamic rating;

  @HiveField(4)
  final String poster;

  @HiveField(5)
  final Map<Resolution, String> covers;

  @HiveField(6)
  final Map<Language, List<EpisodeFile>> episodes;

  @override
  String toString() {
    return 'Episode{episode: $episode, title: $title, description: $description, rating: $rating, poster: $poster, covers: $covers, episodes: $episodes}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Episode &&
              runtimeType == other.runtimeType &&
              episode == other.episode &&
              title == other.title &&
              description == other.description &&
              rating == other.rating &&
              poster == other.poster;

  @override
  int get hashCode => episode.hashCode ^ title.hashCode ^ description.hashCode ^ rating.hashCode ^ poster.hashCode;
}