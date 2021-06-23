import 'package:injectable/injectable.dart';

import '../../model/core/either.dart';
import '../../model/core/fetch_failure.dart';
import '../../model/schemas/search/search_results_model.dart';
import '../../model/schemas/search/search_results_schema.dart';
import '../api_service.dart';
import 'core/base_service.dart';

@lazySingleton
class SearchService extends BaseService {
  SearchService(this._apiService);

  final ApiService _apiService;

  Future<Either<FetchFailure, SearchResults>> search(String keyword, int page) async {
    final Either<FetchFailure, SearchResultsSchema> result = await safeFetch(
          () => _apiService.search(
        filterKeyword: keyword,
        filterInit: true.toString(),
        filterWithActors: 3.toString(),
        filterWithDirectors: 1.toString(),
        filterType: 'movie',
        keywords: keyword,
        page: page.toString(),
        perPage: 20.toString(),
        source: 'adjaranet',
      ),
    );

    return result.map((SearchResultsSchema r) => SearchResults.fromSchema(r));
  }
}
