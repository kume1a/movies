import 'package:collection/collection.dart';
import 'package:injectable/injectable.dart';

import '../../model/core/option.dart';
import '../../model/models/seasons/episode.dart';
import '../../model/models/seasons/episode_file.dart';
import '../../model/models/seasons/season_files.dart';
import '../../model/schemas/core/enums.dart';
import 'db_episode/db_episode.dart';
import 'db_episode/db_episode_dao.dart';
import 'db_episode_cover/db_episode_cover.dart';
import 'db_episode_cover/db_episode_cover_dao.dart';
import 'db_episode_file/db_episode_file.dart';
import 'db_episode_file/db_episode_file_dao.dart';
import 'db_season_file/db_season_file.dart';
import 'db_season_file/db_season_file_dao.dart';

@lazySingleton
class SeasonFileDao {
  SeasonFileDao(
    this._episodeDao,
    this._episodeFileDao,
    this._seasonFileDao,
    this._episodeCoverDao,
  );

  final DBEpisodeDao _episodeDao;
  final DBEpisodeFileDao _episodeFileDao;
  final DBSeasonFileDao _seasonFileDao;
  final DBEpisodeCoverDao _episodeCoverDao;

  Future<Option<SeasonFiles>> getSeasonFiles(int id, int season) async {
    final DBSeasonFile? seasonFile = await _seasonFileDao.getSeasonFile(id, season);
    if (seasonFile == null) {
      return none();
    }

    final List<DBEpisode> dbEpisodes = await _episodeDao.getEpisodes(seasonFile.id!);
    final List<Episode> episodes = await Future.wait(dbEpisodes.map((DBEpisode e) async {
      final List<DBEpisodeCover> episodeCovers = await _episodeCoverDao.getEpisodeCovers(e.id!);
      final Map<Resolution, String> covers = <Resolution, String>{
        for (DBEpisodeCover a in episodeCovers) a.resolution: a.cover
      };

      final List<DBEpisodeFile> episodeFiles = await _episodeFileDao.getEpisodeFiles(e.id!);
      final Map<Language, List<EpisodeFile>> episodes =
          groupBy(episodeFiles, (DBEpisodeFile e) => e.language).map((Language key, List<DBEpisodeFile> value) {
        return MapEntry<Language, List<EpisodeFile>>(
          key,
          value.map((DBEpisodeFile e) {
            return EpisodeFile(
              id: e.id!,
              quality: e.quality,
              src: e.src,
              duration: e.duration,
            );
          }).toList(),
        );
      });

      return Episode(
        episode: e.episode,
        title: e.title,
        description: e.description,
        rating: e.rating,
        poster: e.poster,
        covers: covers,
        episodes: episodes,
      );
    }));

    return some(SeasonFiles(season: season, data: episodes));
  }

  Future<void> writeSeasonFiles(int id, SeasonFiles seasonFiles) async {
    final int seasonFilesId = int.parse('$id${seasonFiles.season}');

    await _seasonFileDao.insertSeasonFile(DBSeasonFile(
      id: seasonFilesId,
      movieId: id,
      season: seasonFiles.season,
    ));

    for (final Episode episode in seasonFiles.data) {
      final int episodeId = await _episodeDao.insertDBEpisode(DBEpisode(
        seasonFilesId: seasonFilesId,
        episode: episode.episode,
        title: episode.title,
        description: episode.description,
        rating: episode.rating,
        poster: episode.poster,
      ));

      for (final MapEntry<Resolution, String> cover in episode.covers.entries) {
        await _episodeCoverDao.insertEpisodeCover(DBEpisodeCover(
          episodeId: episodeId,
          resolution: cover.key,
          cover: cover.value,
        ));
      }

      for (final MapEntry<Language, List<EpisodeFile>> episode in episode.episodes.entries) {
        for (final EpisodeFile episodeFile in episode.value) {
          await _episodeFileDao.insertDBEpisodeFile(DBEpisodeFile(
            episodeId: episodeId,
            language: episode.key,
            episodeFileId: episodeFile.id,
            quality: episodeFile.quality,
            src: episodeFile.src,
            duration: episodeFile.duration,
          ));
        }
      }
    }
  }

  Future<void> deleteSeasonFiles() async {
    await _episodeCoverDao.deleteAll();
    await _episodeFileDao.deleteAll();
    await _episodeDao.deleteAll();
    await _seasonFileDao.deleteAll();
  }
}
