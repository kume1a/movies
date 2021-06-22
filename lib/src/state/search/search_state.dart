part of 'search_bloc.dart';

@freezed
abstract class SearchState with _$SearchState {
  const factory SearchState(
    String query,
    Option<SearchResults> searchResultsOption,
  ) = _SearchState;

  factory SearchState.initial() => SearchState('', none());
}