import 'package:meta/meta.dart';
import 'package:movo/src/domain/actors/season_files/season_files_schema.dart';
import 'package:movo/src/domain/core/enums.dart';
import 'package:movo/src/domain/core/type_mappers.dart';

class SeasonFiles {
  final int season;
  final List<Episode> data;

  SeasonFiles._(this.season, this.data);

  factory SeasonFiles.fromSchema(int season, SeasonFilesSchema schema) {
    final List<Episode> episodes = schema.data
        .map((SeasonFilesDataSchema elementSchema) {
          if (elementSchema == null) return null;
          return Episode.fromSchema(elementSchema);
        })
        .where((Episode episode) => episode != null)
        .toList();

    return SeasonFiles._(season, episodes.cast<Episode>());
  }

  @override
  String toString() => 'SeasonFiles{data: $data}';
}

class Episode {
  final int episode;
  final String title;
  final String description;
  final dynamic rating;
  final String poster;
  final Map<Resolution, String> covers;
  final Map<Language, List<EpisodeFile>> episodes;

  Episode._({
    @required this.episode,
    @required this.title,
    @required this.description,
    @required this.rating,
    @required this.poster,
    @required this.covers,
    @required this.episodes,
  });

  factory Episode.fromSchema(SeasonFilesDataSchema schema) {
    final Map<Resolution, String> covers = <Resolution, String>{
      Resolution.fhd: schema.covers?.data?.s1920 ?? '',
      Resolution.hd: schema.covers?.data?.s1050 ?? '',
      Resolution.vga: schema.covers?.data?.s510 ?? '',
    };

    final Map<Language, List<EpisodeFile>> episodes = <Language, List<EpisodeFile>>{
      for (FilesSchema e in schema.files)
        getLanguage(e?.lang):
            e?.files?.map((FileSchema file) => EpisodeFile.fromSchema(file))?.toList() ??
                List<EpisodeFile>.empty()
    };

    return Episode._(
      episode: schema.episode ?? 0,
      title: schema.title ?? '',
      description: schema.description ?? '',
      rating: schema.rating ?? 0,
      poster: schema.poster ?? '',
      covers: covers,
      episodes: episodes,
    );
  }

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
  int get hashCode =>
      episode.hashCode ^
      title.hashCode ^
      description.hashCode ^
      rating.hashCode ^
      poster.hashCode;
}

class EpisodeFile {
  final int id;
  final Quality quality;
  final String src;
  final int duration;

  EpisodeFile._({
    @required this.id,
    @required this.quality,
    @required this.src,
    @required this.duration,
  });

  factory EpisodeFile.fromSchema(FileSchema schema) {
    if (schema == null) return EpisodeFile.empty();

    return EpisodeFile._(
      id: schema.id ?? 0,
      quality: getQuality(schema.quality),
      src: schema.src ?? '',
      duration: schema.duration ?? 0,
    );
  }

  factory EpisodeFile.empty() {
    return EpisodeFile._(id: 0, quality: Quality.high, src: '', duration: 0);
  }

  @override
  String toString() {
    return 'EpisodeFile{id: $id, quality: $quality, src: $src, duration: $duration}';
  }
}
