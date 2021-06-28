import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../local/tables.dart';
import '../../schemas/movie/movie_seasons_schema.dart';

part 'season.freezed.dart';

@freezed
class Season with _$Season {
  const factory Season({
    int? id,
    required int movieId,
    required int number,
    required String name,
    required int episodesCount,
  }) = _Season;

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
}
