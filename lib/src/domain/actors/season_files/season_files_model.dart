import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

import '../../../infrastructure/hive_box_holder.dart';
import '../../core/enums.dart';
import '../../core/type_mappers.dart';
import 'season_files_schema.dart';

part 'season_files_model.g.dart';

@HiveType(typeId: HiveTypeIdHolder.seasonFilesId)
class SeasonFiles {
  SeasonFiles(this.season, this.data);

  factory SeasonFiles.fromSchema(int season, SeasonFilesSchema schema) {
    final List<Episode> episodes = schema.data
        .map((SeasonFilesDataSchema elementSchema) {
          if (elementSchema == null) return null;
          return Episode.fromSchema(elementSchema);
        })
        .where((Episode episode) => episode != null)
        .toList();

    return SeasonFiles(season, episodes.cast<Episode>());
  }

  @HiveField(0)
  final int season;

  @HiveField(1)
  final List<Episode> data;

  @override
  String toString() => 'SeasonFiles{data: $data}';
}

@HiveType(typeId: HiveTypeIdHolder.episodeId)
class Episode {
  Episode({
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
  int get hashCode =>
      episode.hashCode ^
      title.hashCode ^
      description.hashCode ^
      rating.hashCode ^
      poster.hashCode;
}

@HiveType(typeId: HiveTypeIdHolder.episodeFileId)
class EpisodeFile {
  EpisodeFile({
    @required this.id,
    @required this.quality,
    @required this.src,
    @required this.duration,
  });

  factory EpisodeFile.fromSchema(FileSchema schema) {
    if (schema == null) return EpisodeFile.empty();

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
