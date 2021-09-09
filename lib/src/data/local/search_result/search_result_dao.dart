import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

import '../../../core/helpers/enum_to_string.dart';
import '../../model/models/search/search_result.dart';
import '../tables.dart';

@lazySingleton
class SearchResultDao {
  SearchResultDao(this._db);

  final Database _db;

  Future<void> insertSearchResult(SearchResult searchResult) async {
    await _db.rawInsert('''
      INSERT INTO ${TableSearchResults.name}
      (
        ${TableSearchResults.columnId},
        ${TableSearchResults.columnMovieId},
        ${TableSearchResults.columnSearchType},
        ${TableSearchResults.columnNameKa},
        ${TableSearchResults.columnNameEn},
        ${TableSearchResults.columnDescriptionKa},
        ${TableSearchResults.columnDescriptionEn},
        ${TableSearchResults.columnPoster},
        ${TableSearchResults.columnSecondaryPoster},
        ${TableSearchResults.columnIsTvShow},
        ${TableSearchResults.columnTimestamp}
      ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
    ''', <Object?>[
      searchResult.id,
      searchResult.movieId,
      EnumToString.convertToString(searchResult.type),
      searchResult.nameKa,
      searchResult.nameEn,
      searchResult.descriptionKa,
      searchResult.descriptionEn,
      searchResult.poster,
      searchResult.secondaryPoster,
      if (searchResult.isTvShow) 1 else 0,
      DateTime.now().millisecondsSinceEpoch,
    ]);
  }

  Future<List<SearchResult>> getSearchResults() async {
    final List<Map<String, Object?>> result = await _db.rawQuery(
      '''
      SELECT * FROM ${TableSearchResults.name}
      ORDER BY ${TableSearchResults.columnTimestamp} DESC;
    ''',
    );

    return result.map((Map<String, Object?> e) => SearchResult.fromMap(e)).toList();
  }

  Future<void> deleteSearchResults() async => _db.delete(TableSearchResults.name);
}
