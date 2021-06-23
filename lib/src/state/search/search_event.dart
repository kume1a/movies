part of 'search_bloc.dart';

@freezed
class SearchEvent with _$SearchEvent {
  const factory SearchEvent.queryChanged(String query) = _QueryChanged;
  const factory SearchEvent.nextPageRequested() = _NextPageRequested;
  const factory SearchEvent.searchResultSelected(SearchResult searchResult) = _SearchResultSelected;
}
