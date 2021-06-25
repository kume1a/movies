import '../../schemas/core/enums.dart';
import '../../schemas/core/type_mappers.dart';
import '../../schemas/season_files/files_schema.dart';
import '../../schemas/season_files/season_files_schema.dart';
import 'episode_file.dart';

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

  final int episode;
  final String title;
  final String description;
  final dynamic rating;
  final String poster;
  final Map<Resolution, String> covers;
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