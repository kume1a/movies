import 'package:hive/hive.dart';

import '../../../local/hive_box_holder.dart';
import '../../schemas/movie/movie_seasons_schema.dart';

part 'season.g.dart';

@HiveType(typeId: HiveTypeIdHolder.seasonId)
class Season {
  Season(this.movieId, this.number, this.name, this.episodesCount);

  factory Season.fromSchema(SeasonsDataSchema schema) {
    return Season(
      schema.movieId ?? 0,
      schema.number ?? 0,
      schema.name ?? '',
      schema.episodesCount ?? 0,
    );
  }

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
