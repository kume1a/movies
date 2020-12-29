// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'search_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$SearchEventTearOff {
  const _$SearchEventTearOff();

// ignore: unused_element
  _QueryChanged queryChanged(String query) {
    return _QueryChanged(
      query,
    );
  }

// ignore: unused_element
  _NextPageRequested nextPageRequested() {
    return const _NextPageRequested();
  }

// ignore: unused_element
  _SearchResultSelected searchResultSelected(SearchResult searchResult) {
    return _SearchResultSelected(
      searchResult,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $SearchEvent = _$SearchEventTearOff();

/// @nodoc
mixin _$SearchEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult queryChanged(String query),
    @required TResult nextPageRequested(),
    @required TResult searchResultSelected(SearchResult searchResult),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult queryChanged(String query),
    TResult nextPageRequested(),
    TResult searchResultSelected(SearchResult searchResult),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult queryChanged(_QueryChanged value),
    @required TResult nextPageRequested(_NextPageRequested value),
    @required TResult searchResultSelected(_SearchResultSelected value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult queryChanged(_QueryChanged value),
    TResult nextPageRequested(_NextPageRequested value),
    TResult searchResultSelected(_SearchResultSelected value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $SearchEventCopyWith<$Res> {
  factory $SearchEventCopyWith(
          SearchEvent value, $Res Function(SearchEvent) then) =
      _$SearchEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$SearchEventCopyWithImpl<$Res> implements $SearchEventCopyWith<$Res> {
  _$SearchEventCopyWithImpl(this._value, this._then);

  final SearchEvent _value;
  // ignore: unused_field
  final $Res Function(SearchEvent) _then;
}

/// @nodoc
abstract class _$QueryChangedCopyWith<$Res> {
  factory _$QueryChangedCopyWith(
          _QueryChanged value, $Res Function(_QueryChanged) then) =
      __$QueryChangedCopyWithImpl<$Res>;
  $Res call({String query});
}

/// @nodoc
class __$QueryChangedCopyWithImpl<$Res> extends _$SearchEventCopyWithImpl<$Res>
    implements _$QueryChangedCopyWith<$Res> {
  __$QueryChangedCopyWithImpl(
      _QueryChanged _value, $Res Function(_QueryChanged) _then)
      : super(_value, (v) => _then(v as _QueryChanged));

  @override
  _QueryChanged get _value => super._value as _QueryChanged;

  @override
  $Res call({
    Object query = freezed,
  }) {
    return _then(_QueryChanged(
      query == freezed ? _value.query : query as String,
    ));
  }
}

/// @nodoc
class _$_QueryChanged implements _QueryChanged {
  const _$_QueryChanged(this.query) : assert(query != null);

  @override
  final String query;

  @override
  String toString() {
    return 'SearchEvent.queryChanged(query: $query)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _QueryChanged &&
            (identical(other.query, query) ||
                const DeepCollectionEquality().equals(other.query, query)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(query);

  @override
  _$QueryChangedCopyWith<_QueryChanged> get copyWith =>
      __$QueryChangedCopyWithImpl<_QueryChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult queryChanged(String query),
    @required TResult nextPageRequested(),
    @required TResult searchResultSelected(SearchResult searchResult),
  }) {
    assert(queryChanged != null);
    assert(nextPageRequested != null);
    assert(searchResultSelected != null);
    return queryChanged(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult queryChanged(String query),
    TResult nextPageRequested(),
    TResult searchResultSelected(SearchResult searchResult),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (queryChanged != null) {
      return queryChanged(query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult queryChanged(_QueryChanged value),
    @required TResult nextPageRequested(_NextPageRequested value),
    @required TResult searchResultSelected(_SearchResultSelected value),
  }) {
    assert(queryChanged != null);
    assert(nextPageRequested != null);
    assert(searchResultSelected != null);
    return queryChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult queryChanged(_QueryChanged value),
    TResult nextPageRequested(_NextPageRequested value),
    TResult searchResultSelected(_SearchResultSelected value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (queryChanged != null) {
      return queryChanged(this);
    }
    return orElse();
  }
}

abstract class _QueryChanged implements SearchEvent {
  const factory _QueryChanged(String query) = _$_QueryChanged;

  String get query;
  _$QueryChangedCopyWith<_QueryChanged> get copyWith;
}

/// @nodoc
abstract class _$NextPageRequestedCopyWith<$Res> {
  factory _$NextPageRequestedCopyWith(
          _NextPageRequested value, $Res Function(_NextPageRequested) then) =
      __$NextPageRequestedCopyWithImpl<$Res>;
}

/// @nodoc
class __$NextPageRequestedCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res>
    implements _$NextPageRequestedCopyWith<$Res> {
  __$NextPageRequestedCopyWithImpl(
      _NextPageRequested _value, $Res Function(_NextPageRequested) _then)
      : super(_value, (v) => _then(v as _NextPageRequested));

  @override
  _NextPageRequested get _value => super._value as _NextPageRequested;
}

/// @nodoc
class _$_NextPageRequested implements _NextPageRequested {
  const _$_NextPageRequested();

  @override
  String toString() {
    return 'SearchEvent.nextPageRequested()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _NextPageRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult queryChanged(String query),
    @required TResult nextPageRequested(),
    @required TResult searchResultSelected(SearchResult searchResult),
  }) {
    assert(queryChanged != null);
    assert(nextPageRequested != null);
    assert(searchResultSelected != null);
    return nextPageRequested();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult queryChanged(String query),
    TResult nextPageRequested(),
    TResult searchResultSelected(SearchResult searchResult),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (nextPageRequested != null) {
      return nextPageRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult queryChanged(_QueryChanged value),
    @required TResult nextPageRequested(_NextPageRequested value),
    @required TResult searchResultSelected(_SearchResultSelected value),
  }) {
    assert(queryChanged != null);
    assert(nextPageRequested != null);
    assert(searchResultSelected != null);
    return nextPageRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult queryChanged(_QueryChanged value),
    TResult nextPageRequested(_NextPageRequested value),
    TResult searchResultSelected(_SearchResultSelected value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (nextPageRequested != null) {
      return nextPageRequested(this);
    }
    return orElse();
  }
}

abstract class _NextPageRequested implements SearchEvent {
  const factory _NextPageRequested() = _$_NextPageRequested;
}

/// @nodoc
abstract class _$SearchResultSelectedCopyWith<$Res> {
  factory _$SearchResultSelectedCopyWith(_SearchResultSelected value,
          $Res Function(_SearchResultSelected) then) =
      __$SearchResultSelectedCopyWithImpl<$Res>;
  $Res call({SearchResult searchResult});
}

/// @nodoc
class __$SearchResultSelectedCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res>
    implements _$SearchResultSelectedCopyWith<$Res> {
  __$SearchResultSelectedCopyWithImpl(
      _SearchResultSelected _value, $Res Function(_SearchResultSelected) _then)
      : super(_value, (v) => _then(v as _SearchResultSelected));

  @override
  _SearchResultSelected get _value => super._value as _SearchResultSelected;

  @override
  $Res call({
    Object searchResult = freezed,
  }) {
    return _then(_SearchResultSelected(
      searchResult == freezed
          ? _value.searchResult
          : searchResult as SearchResult,
    ));
  }
}

/// @nodoc
class _$_SearchResultSelected implements _SearchResultSelected {
  const _$_SearchResultSelected(this.searchResult)
      : assert(searchResult != null);

  @override
  final SearchResult searchResult;

  @override
  String toString() {
    return 'SearchEvent.searchResultSelected(searchResult: $searchResult)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SearchResultSelected &&
            (identical(other.searchResult, searchResult) ||
                const DeepCollectionEquality()
                    .equals(other.searchResult, searchResult)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(searchResult);

  @override
  _$SearchResultSelectedCopyWith<_SearchResultSelected> get copyWith =>
      __$SearchResultSelectedCopyWithImpl<_SearchResultSelected>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult queryChanged(String query),
    @required TResult nextPageRequested(),
    @required TResult searchResultSelected(SearchResult searchResult),
  }) {
    assert(queryChanged != null);
    assert(nextPageRequested != null);
    assert(searchResultSelected != null);
    return searchResultSelected(searchResult);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult queryChanged(String query),
    TResult nextPageRequested(),
    TResult searchResultSelected(SearchResult searchResult),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (searchResultSelected != null) {
      return searchResultSelected(searchResult);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult queryChanged(_QueryChanged value),
    @required TResult nextPageRequested(_NextPageRequested value),
    @required TResult searchResultSelected(_SearchResultSelected value),
  }) {
    assert(queryChanged != null);
    assert(nextPageRequested != null);
    assert(searchResultSelected != null);
    return searchResultSelected(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult queryChanged(_QueryChanged value),
    TResult nextPageRequested(_NextPageRequested value),
    TResult searchResultSelected(_SearchResultSelected value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (searchResultSelected != null) {
      return searchResultSelected(this);
    }
    return orElse();
  }
}

abstract class _SearchResultSelected implements SearchEvent {
  const factory _SearchResultSelected(SearchResult searchResult) =
      _$_SearchResultSelected;

  SearchResult get searchResult;
  _$SearchResultSelectedCopyWith<_SearchResultSelected> get copyWith;
}

/// @nodoc
class _$SearchStateTearOff {
  const _$SearchStateTearOff();

// ignore: unused_element
  _SearchState call(String query, Option<SearchResults> searchResultsOption) {
    return _SearchState(
      query,
      searchResultsOption,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $SearchState = _$SearchStateTearOff();

/// @nodoc
mixin _$SearchState {
  String get query;
  Option<SearchResults> get searchResultsOption;

  $SearchStateCopyWith<SearchState> get copyWith;
}

/// @nodoc
abstract class $SearchStateCopyWith<$Res> {
  factory $SearchStateCopyWith(
          SearchState value, $Res Function(SearchState) then) =
      _$SearchStateCopyWithImpl<$Res>;
  $Res call({String query, Option<SearchResults> searchResultsOption});
}

/// @nodoc
class _$SearchStateCopyWithImpl<$Res> implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._value, this._then);

  final SearchState _value;
  // ignore: unused_field
  final $Res Function(SearchState) _then;

  @override
  $Res call({
    Object query = freezed,
    Object searchResultsOption = freezed,
  }) {
    return _then(_value.copyWith(
      query: query == freezed ? _value.query : query as String,
      searchResultsOption: searchResultsOption == freezed
          ? _value.searchResultsOption
          : searchResultsOption as Option<SearchResults>,
    ));
  }
}

/// @nodoc
abstract class _$SearchStateCopyWith<$Res>
    implements $SearchStateCopyWith<$Res> {
  factory _$SearchStateCopyWith(
          _SearchState value, $Res Function(_SearchState) then) =
      __$SearchStateCopyWithImpl<$Res>;
  @override
  $Res call({String query, Option<SearchResults> searchResultsOption});
}

/// @nodoc
class __$SearchStateCopyWithImpl<$Res> extends _$SearchStateCopyWithImpl<$Res>
    implements _$SearchStateCopyWith<$Res> {
  __$SearchStateCopyWithImpl(
      _SearchState _value, $Res Function(_SearchState) _then)
      : super(_value, (v) => _then(v as _SearchState));

  @override
  _SearchState get _value => super._value as _SearchState;

  @override
  $Res call({
    Object query = freezed,
    Object searchResultsOption = freezed,
  }) {
    return _then(_SearchState(
      query == freezed ? _value.query : query as String,
      searchResultsOption == freezed
          ? _value.searchResultsOption
          : searchResultsOption as Option<SearchResults>,
    ));
  }
}

/// @nodoc
class _$_SearchState implements _SearchState {
  const _$_SearchState(this.query, this.searchResultsOption)
      : assert(query != null),
        assert(searchResultsOption != null);

  @override
  final String query;
  @override
  final Option<SearchResults> searchResultsOption;

  @override
  String toString() {
    return 'SearchState(query: $query, searchResultsOption: $searchResultsOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SearchState &&
            (identical(other.query, query) ||
                const DeepCollectionEquality().equals(other.query, query)) &&
            (identical(other.searchResultsOption, searchResultsOption) ||
                const DeepCollectionEquality()
                    .equals(other.searchResultsOption, searchResultsOption)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(query) ^
      const DeepCollectionEquality().hash(searchResultsOption);

  @override
  _$SearchStateCopyWith<_SearchState> get copyWith =>
      __$SearchStateCopyWithImpl<_SearchState>(this, _$identity);
}

abstract class _SearchState implements SearchState {
  const factory _SearchState(
      String query, Option<SearchResults> searchResultsOption) = _$_SearchState;

  @override
  String get query;
  @override
  Option<SearchResults> get searchResultsOption;
  @override
  _$SearchStateCopyWith<_SearchState> get copyWith;
}
