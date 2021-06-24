import 'package:hive/hive.dart';

import '../../../local/hive_box_holder.dart';
import '../../../local/tables.dart';
import '../../schemas/movie/movie_seasons_schema.dart';

part 'season.g.dart';

@HiveType(typeId: HiveTypeIdHolder.seasonId)
class Season {
  Season({
    this.id,
    required this.movieId,
    required this.number,
    required this.name,
    required this.episodesCount,
  });

  factory Season.fromSchema(SeasonsDataSchema schema) {
    return Season(
      movieId: schema.movieId ?? 0,
      number: schema.number ?? 0,
      name: schema.name ?? '',
      episodesCount: schema.episodesCount ?? 0,
    );
  }

  factory Season.fromMap(Map<String, dynamic> map) {
    return Season(
      id: map[TableSeasons.columnId] as int?,
      movieId: map[TableSeasons.columnMovieId] as int? ?? -1,
      number: map[TableSeasons.columnNumber] as int? ?? -1,
      name: map[TableSeasons.columnName] as String? ?? '',
      episodesCount: map[TableSeasons.columnEpisodesCount] as int? ?? -1,
    );
  }

  final int? id;
  @HiveField(0)
  final int movieId;
  @HiveField(1)
  final int number;
  @HiveField(2)
  final String name;
  @HiveField(3)
  final int episodesCount;

  @override
  String toString() {
    return 'Season{movieId: $movieId, number: $number, name: $name, episodesCount: $episodesCount}';
  }
}
