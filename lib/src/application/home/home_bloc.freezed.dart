// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$HomeEventTearOff {
  const _$HomeEventTearOff();

// ignore: unused_element
  _PopularMoviesFetchRequested popularMoviesFetchRequested() {
    return const _PopularMoviesFetchRequested();
  }

// ignore: unused_element
  _TopMoviesPageFetchRequested topMoviesPageFetchRequested() {
    return const _TopMoviesPageFetchRequested();
  }

// ignore: unused_element
  _MoviesPageFetchRequested moviesPageFetchRequested() {
    return const _MoviesPageFetchRequested();
  }

// ignore: unused_element
  _SavedMoviesRequested savedMoviesRequested() {
    return const _SavedMoviesRequested();
  }

// ignore: unused_element
  _GenreChanged genreChanged(Genre genre) {
    return _GenreChanged(
      genre,
    );
  }

// ignore: unused_element
  _Clear clear() {
    return const _Clear();
  }
}

/// @nodoc
// ignore: unused_element
const $HomeEvent = _$HomeEventTearOff();

/// @nodoc
mixin _$HomeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult popularMoviesFetchRequested(),
    @required TResult topMoviesPageFetchRequested(),
    @required TResult moviesPageFetchRequested(),
    @required TResult savedMoviesRequested(),
    @required TResult genreChanged(Genre genre),
    @required TResult clear(),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult popularMoviesFetchRequested(),
    TResult topMoviesPageFetchRequested(),
    TResult moviesPageFetchRequested(),
    TResult savedMoviesRequested(),
    TResult genreChanged(Genre genre),
    TResult clear(),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required
        TResult popularMoviesFetchRequested(_PopularMoviesFetchRequested value),
    @required
        TResult topMoviesPageFetchRequested(_TopMoviesPageFetchRequested value),
    @required TResult moviesPageFetchRequested(_MoviesPageFetchRequested value),
    @required TResult savedMoviesRequested(_SavedMoviesRequested value),
    @required TResult genreChanged(_GenreChanged value),
    @required TResult clear(_Clear value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult popularMoviesFetchRequested(_PopularMoviesFetchRequested value),
    TResult topMoviesPageFetchRequested(_TopMoviesPageFetchRequested value),
    TResult moviesPageFetchRequested(_MoviesPageFetchRequested value),
    TResult savedMoviesRequested(_SavedMoviesRequested value),
    TResult genreChanged(_GenreChanged value),
    TResult clear(_Clear value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $HomeEventCopyWith<$Res> {
  factory $HomeEventCopyWith(HomeEvent value, $Res Function(HomeEvent) then) =
      _$HomeEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$HomeEventCopyWithImpl<$Res> implements $HomeEventCopyWith<$Res> {
  _$HomeEventCopyWithImpl(this._value, this._then);

  final HomeEvent _value;
  // ignore: unused_field
  final $Res Function(HomeEvent) _then;
}

/// @nodoc
abstract class _$PopularMoviesFetchRequestedCopyWith<$Res> {
  factory _$PopularMoviesFetchRequestedCopyWith(
          _PopularMoviesFetchRequested value,
          $Res Function(_PopularMoviesFetchRequested) then) =
      __$PopularMoviesFetchRequestedCopyWithImpl<$Res>;
}

/// @nodoc
class __$PopularMoviesFetchRequestedCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res>
    implements _$PopularMoviesFetchRequestedCopyWith<$Res> {
  __$PopularMoviesFetchRequestedCopyWithImpl(
      _PopularMoviesFetchRequested _value,
      $Res Function(_PopularMoviesFetchRequested) _then)
      : super(_value, (v) => _then(v as _PopularMoviesFetchRequested));

  @override
  _PopularMoviesFetchRequested get _value =>
      super._value as _PopularMoviesFetchRequested;
}

/// @nodoc
class _$_PopularMoviesFetchRequested implements _PopularMoviesFetchRequested {
  const _$_PopularMoviesFetchRequested();

  @override
  String toString() {
    return 'HomeEvent.popularMoviesFetchRequested()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _PopularMoviesFetchRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult popularMoviesFetchRequested(),
    @required TResult topMoviesPageFetchRequested(),
    @required TResult moviesPageFetchRequested(),
    @required TResult savedMoviesRequested(),
    @required TResult genreChanged(Genre genre),
    @required TResult clear(),
  }) {
    assert(popularMoviesFetchRequested != null);
    assert(topMoviesPageFetchRequested != null);
    assert(moviesPageFetchRequested != null);
    assert(savedMoviesRequested != null);
    assert(genreChanged != null);
    assert(clear != null);
    return popularMoviesFetchRequested();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult popularMoviesFetchRequested(),
    TResult topMoviesPageFetchRequested(),
    TResult moviesPageFetchRequested(),
    TResult savedMoviesRequested(),
    TResult genreChanged(Genre genre),
    TResult clear(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (popularMoviesFetchRequested != null) {
      return popularMoviesFetchRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required
        TResult popularMoviesFetchRequested(_PopularMoviesFetchRequested value),
    @required
        TResult topMoviesPageFetchRequested(_TopMoviesPageFetchRequested value),
    @required TResult moviesPageFetchRequested(_MoviesPageFetchRequested value),
    @required TResult savedMoviesRequested(_SavedMoviesRequested value),
    @required TResult genreChanged(_GenreChanged value),
    @required TResult clear(_Clear value),
  }) {
    assert(popularMoviesFetchRequested != null);
    assert(topMoviesPageFetchRequested != null);
    assert(moviesPageFetchRequested != null);
    assert(savedMoviesRequested != null);
    assert(genreChanged != null);
    assert(clear != null);
    return popularMoviesFetchRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult popularMoviesFetchRequested(_PopularMoviesFetchRequested value),
    TResult topMoviesPageFetchRequested(_TopMoviesPageFetchRequested value),
    TResult moviesPageFetchRequested(_MoviesPageFetchRequested value),
    TResult savedMoviesRequested(_SavedMoviesRequested value),
    TResult genreChanged(_GenreChanged value),
    TResult clear(_Clear value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (popularMoviesFetchRequested != null) {
      return popularMoviesFetchRequested(this);
    }
    return orElse();
  }
}

abstract class _PopularMoviesFetchRequested implements HomeEvent {
  const factory _PopularMoviesFetchRequested() = _$_PopularMoviesFetchRequested;
}

/// @nodoc
abstract class _$TopMoviesPageFetchRequestedCopyWith<$Res> {
  factory _$TopMoviesPageFetchRequestedCopyWith(
          _TopMoviesPageFetchRequested value,
          $Res Function(_TopMoviesPageFetchRequested) then) =
      __$TopMoviesPageFetchRequestedCopyWithImpl<$Res>;
}

/// @nodoc
class __$TopMoviesPageFetchRequestedCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res>
    implements _$TopMoviesPageFetchRequestedCopyWith<$Res> {
  __$TopMoviesPageFetchRequestedCopyWithImpl(
      _TopMoviesPageFetchRequested _value,
      $Res Function(_TopMoviesPageFetchRequested) _then)
      : super(_value, (v) => _then(v as _TopMoviesPageFetchRequested));

  @override
  _TopMoviesPageFetchRequested get _value =>
      super._value as _TopMoviesPageFetchRequested;
}

/// @nodoc
class _$_TopMoviesPageFetchRequested implements _TopMoviesPageFetchRequested {
  const _$_TopMoviesPageFetchRequested();

  @override
  String toString() {
    return 'HomeEvent.topMoviesPageFetchRequested()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _TopMoviesPageFetchRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult popularMoviesFetchRequested(),
    @required TResult topMoviesPageFetchRequested(),
    @required TResult moviesPageFetchRequested(),
    @required TResult savedMoviesRequested(),
    @required TResult genreChanged(Genre genre),
    @required TResult clear(),
  }) {
    assert(popularMoviesFetchRequested != null);
    assert(topMoviesPageFetchRequested != null);
    assert(moviesPageFetchRequested != null);
    assert(savedMoviesRequested != null);
    assert(genreChanged != null);
    assert(clear != null);
    return topMoviesPageFetchRequested();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult popularMoviesFetchRequested(),
    TResult topMoviesPageFetchRequested(),
    TResult moviesPageFetchRequested(),
    TResult savedMoviesRequested(),
    TResult genreChanged(Genre genre),
    TResult clear(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (topMoviesPageFetchRequested != null) {
      return topMoviesPageFetchRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required
        TResult popularMoviesFetchRequested(_PopularMoviesFetchRequested value),
    @required
        TResult topMoviesPageFetchRequested(_TopMoviesPageFetchRequested value),
    @required TResult moviesPageFetchRequested(_MoviesPageFetchRequested value),
    @required TResult savedMoviesRequested(_SavedMoviesRequested value),
    @required TResult genreChanged(_GenreChanged value),
    @required TResult clear(_Clear value),
  }) {
    assert(popularMoviesFetchRequested != null);
    assert(topMoviesPageFetchRequested != null);
    assert(moviesPageFetchRequested != null);
    assert(savedMoviesRequested != null);
    assert(genreChanged != null);
    assert(clear != null);
    return topMoviesPageFetchRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult popularMoviesFetchRequested(_PopularMoviesFetchRequested value),
    TResult topMoviesPageFetchRequested(_TopMoviesPageFetchRequested value),
    TResult moviesPageFetchRequested(_MoviesPageFetchRequested value),
    TResult savedMoviesRequested(_SavedMoviesRequested value),
    TResult genreChanged(_GenreChanged value),
    TResult clear(_Clear value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (topMoviesPageFetchRequested != null) {
      return topMoviesPageFetchRequested(this);
    }
    return orElse();
  }
}

abstract class _TopMoviesPageFetchRequested implements HomeEvent {
  const factory _TopMoviesPageFetchRequested() = _$_TopMoviesPageFetchRequested;
}

/// @nodoc
abstract class _$MoviesPageFetchRequestedCopyWith<$Res> {
  factory _$MoviesPageFetchRequestedCopyWith(_MoviesPageFetchRequested value,
          $Res Function(_MoviesPageFetchRequested) then) =
      __$MoviesPageFetchRequestedCopyWithImpl<$Res>;
}

/// @nodoc
class __$MoviesPageFetchRequestedCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res>
    implements _$MoviesPageFetchRequestedCopyWith<$Res> {
  __$MoviesPageFetchRequestedCopyWithImpl(_MoviesPageFetchRequested _value,
      $Res Function(_MoviesPageFetchRequested) _then)
      : super(_value, (v) => _then(v as _MoviesPageFetchRequested));

  @override
  _MoviesPageFetchRequested get _value =>
      super._value as _MoviesPageFetchRequested;
}

/// @nodoc
class _$_MoviesPageFetchRequested implements _MoviesPageFetchRequested {
  const _$_MoviesPageFetchRequested();

  @override
  String toString() {
    return 'HomeEvent.moviesPageFetchRequested()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _MoviesPageFetchRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult popularMoviesFetchRequested(),
    @required TResult topMoviesPageFetchRequested(),
    @required TResult moviesPageFetchRequested(),
    @required TResult savedMoviesRequested(),
    @required TResult genreChanged(Genre genre),
    @required TResult clear(),
  }) {
    assert(popularMoviesFetchRequested != null);
    assert(topMoviesPageFetchRequested != null);
    assert(moviesPageFetchRequested != null);
    assert(savedMoviesRequested != null);
    assert(genreChanged != null);
    assert(clear != null);
    return moviesPageFetchRequested();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult popularMoviesFetchRequested(),
    TResult topMoviesPageFetchRequested(),
    TResult moviesPageFetchRequested(),
    TResult savedMoviesRequested(),
    TResult genreChanged(Genre genre),
    TResult clear(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (moviesPageFetchRequested != null) {
      return moviesPageFetchRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required
        TResult popularMoviesFetchRequested(_PopularMoviesFetchRequested value),
    @required
        TResult topMoviesPageFetchRequested(_TopMoviesPageFetchRequested value),
    @required TResult moviesPageFetchRequested(_MoviesPageFetchRequested value),
    @required TResult savedMoviesRequested(_SavedMoviesRequested value),
    @required TResult genreChanged(_GenreChanged value),
    @required TResult clear(_Clear value),
  }) {
    assert(popularMoviesFetchRequested != null);
    assert(topMoviesPageFetchRequested != null);
    assert(moviesPageFetchRequested != null);
    assert(savedMoviesRequested != null);
    assert(genreChanged != null);
    assert(clear != null);
    return moviesPageFetchRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult popularMoviesFetchRequested(_PopularMoviesFetchRequested value),
    TResult topMoviesPageFetchRequested(_TopMoviesPageFetchRequested value),
    TResult moviesPageFetchRequested(_MoviesPageFetchRequested value),
    TResult savedMoviesRequested(_SavedMoviesRequested value),
    TResult genreChanged(_GenreChanged value),
    TResult clear(_Clear value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (moviesPageFetchRequested != null) {
      return moviesPageFetchRequested(this);
    }
    return orElse();
  }
}

abstract class _MoviesPageFetchRequested implements HomeEvent {
  const factory _MoviesPageFetchRequested() = _$_MoviesPageFetchRequested;
}

/// @nodoc
abstract class _$SavedMoviesRequestedCopyWith<$Res> {
  factory _$SavedMoviesRequestedCopyWith(_SavedMoviesRequested value,
          $Res Function(_SavedMoviesRequested) then) =
      __$SavedMoviesRequestedCopyWithImpl<$Res>;
}

/// @nodoc
class __$SavedMoviesRequestedCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res>
    implements _$SavedMoviesRequestedCopyWith<$Res> {
  __$SavedMoviesRequestedCopyWithImpl(
      _SavedMoviesRequested _value, $Res Function(_SavedMoviesRequested) _then)
      : super(_value, (v) => _then(v as _SavedMoviesRequested));

  @override
  _SavedMoviesRequested get _value => super._value as _SavedMoviesRequested;
}

/// @nodoc
class _$_SavedMoviesRequested implements _SavedMoviesRequested {
  const _$_SavedMoviesRequested();

  @override
  String toString() {
    return 'HomeEvent.savedMoviesRequested()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _SavedMoviesRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult popularMoviesFetchRequested(),
    @required TResult topMoviesPageFetchRequested(),
    @required TResult moviesPageFetchRequested(),
    @required TResult savedMoviesRequested(),
    @required TResult genreChanged(Genre genre),
    @required TResult clear(),
  }) {
    assert(popularMoviesFetchRequested != null);
    assert(topMoviesPageFetchRequested != null);
    assert(moviesPageFetchRequested != null);
    assert(savedMoviesRequested != null);
    assert(genreChanged != null);
    assert(clear != null);
    return savedMoviesRequested();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult popularMoviesFetchRequested(),
    TResult topMoviesPageFetchRequested(),
    TResult moviesPageFetchRequested(),
    TResult savedMoviesRequested(),
    TResult genreChanged(Genre genre),
    TResult clear(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (savedMoviesRequested != null) {
      return savedMoviesRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required
        TResult popularMoviesFetchRequested(_PopularMoviesFetchRequested value),
    @required
        TResult topMoviesPageFetchRequested(_TopMoviesPageFetchRequested value),
    @required TResult moviesPageFetchRequested(_MoviesPageFetchRequested value),
    @required TResult savedMoviesRequested(_SavedMoviesRequested value),
    @required TResult genreChanged(_GenreChanged value),
    @required TResult clear(_Clear value),
  }) {
    assert(popularMoviesFetchRequested != null);
    assert(topMoviesPageFetchRequested != null);
    assert(moviesPageFetchRequested != null);
    assert(savedMoviesRequested != null);
    assert(genreChanged != null);
    assert(clear != null);
    return savedMoviesRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult popularMoviesFetchRequested(_PopularMoviesFetchRequested value),
    TResult topMoviesPageFetchRequested(_TopMoviesPageFetchRequested value),
    TResult moviesPageFetchRequested(_MoviesPageFetchRequested value),
    TResult savedMoviesRequested(_SavedMoviesRequested value),
    TResult genreChanged(_GenreChanged value),
    TResult clear(_Clear value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (savedMoviesRequested != null) {
      return savedMoviesRequested(this);
    }
    return orElse();
  }
}

abstract class _SavedMoviesRequested implements HomeEvent {
  const factory _SavedMoviesRequested() = _$_SavedMoviesRequested;
}

/// @nodoc
abstract class _$GenreChangedCopyWith<$Res> {
  factory _$GenreChangedCopyWith(
          _GenreChanged value, $Res Function(_GenreChanged) then) =
      __$GenreChangedCopyWithImpl<$Res>;
  $Res call({Genre genre});
}

/// @nodoc
class __$GenreChangedCopyWithImpl<$Res> extends _$HomeEventCopyWithImpl<$Res>
    implements _$GenreChangedCopyWith<$Res> {
  __$GenreChangedCopyWithImpl(
      _GenreChanged _value, $Res Function(_GenreChanged) _then)
      : super(_value, (v) => _then(v as _GenreChanged));

  @override
  _GenreChanged get _value => super._value as _GenreChanged;

  @override
  $Res call({
    Object genre = freezed,
  }) {
    return _then(_GenreChanged(
      genre == freezed ? _value.genre : genre as Genre,
    ));
  }
}

/// @nodoc
class _$_GenreChanged implements _GenreChanged {
  const _$_GenreChanged(this.genre) : assert(genre != null);

  @override
  final Genre genre;

  @override
  String toString() {
    return 'HomeEvent.genreChanged(genre: $genre)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GenreChanged &&
            (identical(other.genre, genre) ||
                const DeepCollectionEquality().equals(other.genre, genre)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(genre);

  @override
  _$GenreChangedCopyWith<_GenreChanged> get copyWith =>
      __$GenreChangedCopyWithImpl<_GenreChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult popularMoviesFetchRequested(),
    @required TResult topMoviesPageFetchRequested(),
    @required TResult moviesPageFetchRequested(),
    @required TResult savedMoviesRequested(),
    @required TResult genreChanged(Genre genre),
    @required TResult clear(),
  }) {
    assert(popularMoviesFetchRequested != null);
    assert(topMoviesPageFetchRequested != null);
    assert(moviesPageFetchRequested != null);
    assert(savedMoviesRequested != null);
    assert(genreChanged != null);
    assert(clear != null);
    return genreChanged(genre);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult popularMoviesFetchRequested(),
    TResult topMoviesPageFetchRequested(),
    TResult moviesPageFetchRequested(),
    TResult savedMoviesRequested(),
    TResult genreChanged(Genre genre),
    TResult clear(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (genreChanged != null) {
      return genreChanged(genre);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required
        TResult popularMoviesFetchRequested(_PopularMoviesFetchRequested value),
    @required
        TResult topMoviesPageFetchRequested(_TopMoviesPageFetchRequested value),
    @required TResult moviesPageFetchRequested(_MoviesPageFetchRequested value),
    @required TResult savedMoviesRequested(_SavedMoviesRequested value),
    @required TResult genreChanged(_GenreChanged value),
    @required TResult clear(_Clear value),
  }) {
    assert(popularMoviesFetchRequested != null);
    assert(topMoviesPageFetchRequested != null);
    assert(moviesPageFetchRequested != null);
    assert(savedMoviesRequested != null);
    assert(genreChanged != null);
    assert(clear != null);
    return genreChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult popularMoviesFetchRequested(_PopularMoviesFetchRequested value),
    TResult topMoviesPageFetchRequested(_TopMoviesPageFetchRequested value),
    TResult moviesPageFetchRequested(_MoviesPageFetchRequested value),
    TResult savedMoviesRequested(_SavedMoviesRequested value),
    TResult genreChanged(_GenreChanged value),
    TResult clear(_Clear value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (genreChanged != null) {
      return genreChanged(this);
    }
    return orElse();
  }
}

abstract class _GenreChanged implements HomeEvent {
  const factory _GenreChanged(Genre genre) = _$_GenreChanged;

  Genre get genre;
  _$GenreChangedCopyWith<_GenreChanged> get copyWith;
}

/// @nodoc
abstract class _$ClearCopyWith<$Res> {
  factory _$ClearCopyWith(_Clear value, $Res Function(_Clear) then) =
      __$ClearCopyWithImpl<$Res>;
}

/// @nodoc
class __$ClearCopyWithImpl<$Res> extends _$HomeEventCopyWithImpl<$Res>
    implements _$ClearCopyWith<$Res> {
  __$ClearCopyWithImpl(_Clear _value, $Res Function(_Clear) _then)
      : super(_value, (v) => _then(v as _Clear));

  @override
  _Clear get _value => super._value as _Clear;
}

/// @nodoc
class _$_Clear implements _Clear {
  const _$_Clear();

  @override
  String toString() {
    return 'HomeEvent.clear()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Clear);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult popularMoviesFetchRequested(),
    @required TResult topMoviesPageFetchRequested(),
    @required TResult moviesPageFetchRequested(),
    @required TResult savedMoviesRequested(),
    @required TResult genreChanged(Genre genre),
    @required TResult clear(),
  }) {
    assert(popularMoviesFetchRequested != null);
    assert(topMoviesPageFetchRequested != null);
    assert(moviesPageFetchRequested != null);
    assert(savedMoviesRequested != null);
    assert(genreChanged != null);
    assert(clear != null);
    return clear();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult popularMoviesFetchRequested(),
    TResult topMoviesPageFetchRequested(),
    TResult moviesPageFetchRequested(),
    TResult savedMoviesRequested(),
    TResult genreChanged(Genre genre),
    TResult clear(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (clear != null) {
      return clear();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required
        TResult popularMoviesFetchRequested(_PopularMoviesFetchRequested value),
    @required
        TResult topMoviesPageFetchRequested(_TopMoviesPageFetchRequested value),
    @required TResult moviesPageFetchRequested(_MoviesPageFetchRequested value),
    @required TResult savedMoviesRequested(_SavedMoviesRequested value),
    @required TResult genreChanged(_GenreChanged value),
    @required TResult clear(_Clear value),
  }) {
    assert(popularMoviesFetchRequested != null);
    assert(topMoviesPageFetchRequested != null);
    assert(moviesPageFetchRequested != null);
    assert(savedMoviesRequested != null);
    assert(genreChanged != null);
    assert(clear != null);
    return clear(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult popularMoviesFetchRequested(_PopularMoviesFetchRequested value),
    TResult topMoviesPageFetchRequested(_TopMoviesPageFetchRequested value),
    TResult moviesPageFetchRequested(_MoviesPageFetchRequested value),
    TResult savedMoviesRequested(_SavedMoviesRequested value),
    TResult genreChanged(_GenreChanged value),
    TResult clear(_Clear value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (clear != null) {
      return clear(this);
    }
    return orElse();
  }
}

abstract class _Clear implements HomeEvent {
  const factory _Clear() = _$_Clear;
}

/// @nodoc
class _$HomeStateTearOff {
  const _$HomeStateTearOff();

// ignore: unused_element
  _HomeState call(
      Option<Movies> popularMoviesOption,
      Option<Movies> topMoviesOption,
      Option<Movies> moviesOption,
      Option<List<SavedMovie>> savedMoviesOption,
      Genre genre) {
    return _HomeState(
      popularMoviesOption,
      topMoviesOption,
      moviesOption,
      savedMoviesOption,
      genre,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $HomeState = _$HomeStateTearOff();

/// @nodoc
mixin _$HomeState {
  Option<Movies> get popularMoviesOption;
  Option<Movies> get topMoviesOption;
  Option<Movies> get moviesOption;
  Option<List<SavedMovie>> get savedMoviesOption;
  Genre get genre;

  $HomeStateCopyWith<HomeState> get copyWith;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res>;
  $Res call(
      {Option<Movies> popularMoviesOption,
      Option<Movies> topMoviesOption,
      Option<Movies> moviesOption,
      Option<List<SavedMovie>> savedMoviesOption,
      Genre genre});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res> implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  final HomeState _value;
  // ignore: unused_field
  final $Res Function(HomeState) _then;

  @override
  $Res call({
    Object popularMoviesOption = freezed,
    Object topMoviesOption = freezed,
    Object moviesOption = freezed,
    Object savedMoviesOption = freezed,
    Object genre = freezed,
  }) {
    return _then(_value.copyWith(
      popularMoviesOption: popularMoviesOption == freezed
          ? _value.popularMoviesOption
          : popularMoviesOption as Option<Movies>,
      topMoviesOption: topMoviesOption == freezed
          ? _value.topMoviesOption
          : topMoviesOption as Option<Movies>,
      moviesOption: moviesOption == freezed
          ? _value.moviesOption
          : moviesOption as Option<Movies>,
      savedMoviesOption: savedMoviesOption == freezed
          ? _value.savedMoviesOption
          : savedMoviesOption as Option<List<SavedMovie>>,
      genre: genre == freezed ? _value.genre : genre as Genre,
    ));
  }
}

/// @nodoc
abstract class _$HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(
          _HomeState value, $Res Function(_HomeState) then) =
      __$HomeStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Option<Movies> popularMoviesOption,
      Option<Movies> topMoviesOption,
      Option<Movies> moviesOption,
      Option<List<SavedMovie>> savedMoviesOption,
      Genre genre});
}

/// @nodoc
class __$HomeStateCopyWithImpl<$Res> extends _$HomeStateCopyWithImpl<$Res>
    implements _$HomeStateCopyWith<$Res> {
  __$HomeStateCopyWithImpl(_HomeState _value, $Res Function(_HomeState) _then)
      : super(_value, (v) => _then(v as _HomeState));

  @override
  _HomeState get _value => super._value as _HomeState;

  @override
  $Res call({
    Object popularMoviesOption = freezed,
    Object topMoviesOption = freezed,
    Object moviesOption = freezed,
    Object savedMoviesOption = freezed,
    Object genre = freezed,
  }) {
    return _then(_HomeState(
      popularMoviesOption == freezed
          ? _value.popularMoviesOption
          : popularMoviesOption as Option<Movies>,
      topMoviesOption == freezed
          ? _value.topMoviesOption
          : topMoviesOption as Option<Movies>,
      moviesOption == freezed
          ? _value.moviesOption
          : moviesOption as Option<Movies>,
      savedMoviesOption == freezed
          ? _value.savedMoviesOption
          : savedMoviesOption as Option<List<SavedMovie>>,
      genre == freezed ? _value.genre : genre as Genre,
    ));
  }
}

/// @nodoc
class _$_HomeState implements _HomeState {
  const _$_HomeState(this.popularMoviesOption, this.topMoviesOption,
      this.moviesOption, this.savedMoviesOption, this.genre)
      : assert(popularMoviesOption != null),
        assert(topMoviesOption != null),
        assert(moviesOption != null),
        assert(savedMoviesOption != null),
        assert(genre != null);

  @override
  final Option<Movies> popularMoviesOption;
  @override
  final Option<Movies> topMoviesOption;
  @override
  final Option<Movies> moviesOption;
  @override
  final Option<List<SavedMovie>> savedMoviesOption;
  @override
  final Genre genre;

  @override
  String toString() {
    return 'HomeState(popularMoviesOption: $popularMoviesOption, topMoviesOption: $topMoviesOption, moviesOption: $moviesOption, savedMoviesOption: $savedMoviesOption, genre: $genre)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _HomeState &&
            (identical(other.popularMoviesOption, popularMoviesOption) ||
                const DeepCollectionEquality()
                    .equals(other.popularMoviesOption, popularMoviesOption)) &&
            (identical(other.topMoviesOption, topMoviesOption) ||
                const DeepCollectionEquality()
                    .equals(other.topMoviesOption, topMoviesOption)) &&
            (identical(other.moviesOption, moviesOption) ||
                const DeepCollectionEquality()
                    .equals(other.moviesOption, moviesOption)) &&
            (identical(other.savedMoviesOption, savedMoviesOption) ||
                const DeepCollectionEquality()
                    .equals(other.savedMoviesOption, savedMoviesOption)) &&
            (identical(other.genre, genre) ||
                const DeepCollectionEquality().equals(other.genre, genre)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(popularMoviesOption) ^
      const DeepCollectionEquality().hash(topMoviesOption) ^
      const DeepCollectionEquality().hash(moviesOption) ^
      const DeepCollectionEquality().hash(savedMoviesOption) ^
      const DeepCollectionEquality().hash(genre);

  @override
  _$HomeStateCopyWith<_HomeState> get copyWith =>
      __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState(
      Option<Movies> popularMoviesOption,
      Option<Movies> topMoviesOption,
      Option<Movies> moviesOption,
      Option<List<SavedMovie>> savedMoviesOption,
      Genre genre) = _$_HomeState;

  @override
  Option<Movies> get popularMoviesOption;
  @override
  Option<Movies> get topMoviesOption;
  @override
  Option<Movies> get moviesOption;
  @override
  Option<List<SavedMovie>> get savedMoviesOption;
  @override
  Genre get genre;
  @override
  _$HomeStateCopyWith<_HomeState> get copyWith;
}
