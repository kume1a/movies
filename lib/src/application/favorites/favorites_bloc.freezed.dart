// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'favorites_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$FavoritesEventTearOff {
  const _$FavoritesEventTearOff();

// ignore: unused_element
  _FavoriteMoviesRequested favoriteMoviesRequested() {
    return const _FavoriteMoviesRequested();
  }
}

/// @nodoc
// ignore: unused_element
const $FavoritesEvent = _$FavoritesEventTearOff();

/// @nodoc
mixin _$FavoritesEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult favoriteMoviesRequested(),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult favoriteMoviesRequested(),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult favoriteMoviesRequested(_FavoriteMoviesRequested value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult favoriteMoviesRequested(_FavoriteMoviesRequested value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $FavoritesEventCopyWith<$Res> {
  factory $FavoritesEventCopyWith(
          FavoritesEvent value, $Res Function(FavoritesEvent) then) =
      _$FavoritesEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$FavoritesEventCopyWithImpl<$Res>
    implements $FavoritesEventCopyWith<$Res> {
  _$FavoritesEventCopyWithImpl(this._value, this._then);

  final FavoritesEvent _value;
  // ignore: unused_field
  final $Res Function(FavoritesEvent) _then;
}

/// @nodoc
abstract class _$FavoriteMoviesRequestedCopyWith<$Res> {
  factory _$FavoriteMoviesRequestedCopyWith(_FavoriteMoviesRequested value,
          $Res Function(_FavoriteMoviesRequested) then) =
      __$FavoriteMoviesRequestedCopyWithImpl<$Res>;
}

/// @nodoc
class __$FavoriteMoviesRequestedCopyWithImpl<$Res>
    extends _$FavoritesEventCopyWithImpl<$Res>
    implements _$FavoriteMoviesRequestedCopyWith<$Res> {
  __$FavoriteMoviesRequestedCopyWithImpl(_FavoriteMoviesRequested _value,
      $Res Function(_FavoriteMoviesRequested) _then)
      : super(_value, (v) => _then(v as _FavoriteMoviesRequested));

  @override
  _FavoriteMoviesRequested get _value =>
      super._value as _FavoriteMoviesRequested;
}

/// @nodoc
class _$_FavoriteMoviesRequested implements _FavoriteMoviesRequested {
  const _$_FavoriteMoviesRequested();

  @override
  String toString() {
    return 'FavoritesEvent.favoriteMoviesRequested()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _FavoriteMoviesRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult favoriteMoviesRequested(),
  }) {
    assert(favoriteMoviesRequested != null);
    return favoriteMoviesRequested();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult favoriteMoviesRequested(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (favoriteMoviesRequested != null) {
      return favoriteMoviesRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult favoriteMoviesRequested(_FavoriteMoviesRequested value),
  }) {
    assert(favoriteMoviesRequested != null);
    return favoriteMoviesRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult favoriteMoviesRequested(_FavoriteMoviesRequested value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (favoriteMoviesRequested != null) {
      return favoriteMoviesRequested(this);
    }
    return orElse();
  }
}

abstract class _FavoriteMoviesRequested implements FavoritesEvent {
  const factory _FavoriteMoviesRequested() = _$_FavoriteMoviesRequested;
}

/// @nodoc
class _$FavoritesStateTearOff {
  const _$FavoritesStateTearOff();

// ignore: unused_element
  _FavoritesState call(Option<List<MovieData>> moviesOption) {
    return _FavoritesState(
      moviesOption,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $FavoritesState = _$FavoritesStateTearOff();

/// @nodoc
mixin _$FavoritesState {
  Option<List<MovieData>> get moviesOption;

  $FavoritesStateCopyWith<FavoritesState> get copyWith;
}

/// @nodoc
abstract class $FavoritesStateCopyWith<$Res> {
  factory $FavoritesStateCopyWith(
          FavoritesState value, $Res Function(FavoritesState) then) =
      _$FavoritesStateCopyWithImpl<$Res>;
  $Res call({Option<List<MovieData>> moviesOption});
}

/// @nodoc
class _$FavoritesStateCopyWithImpl<$Res>
    implements $FavoritesStateCopyWith<$Res> {
  _$FavoritesStateCopyWithImpl(this._value, this._then);

  final FavoritesState _value;
  // ignore: unused_field
  final $Res Function(FavoritesState) _then;

  @override
  $Res call({
    Object moviesOption = freezed,
  }) {
    return _then(_value.copyWith(
      moviesOption: moviesOption == freezed
          ? _value.moviesOption
          : moviesOption as Option<List<MovieData>>,
    ));
  }
}

/// @nodoc
abstract class _$FavoritesStateCopyWith<$Res>
    implements $FavoritesStateCopyWith<$Res> {
  factory _$FavoritesStateCopyWith(
          _FavoritesState value, $Res Function(_FavoritesState) then) =
      __$FavoritesStateCopyWithImpl<$Res>;
  @override
  $Res call({Option<List<MovieData>> moviesOption});
}

/// @nodoc
class __$FavoritesStateCopyWithImpl<$Res>
    extends _$FavoritesStateCopyWithImpl<$Res>
    implements _$FavoritesStateCopyWith<$Res> {
  __$FavoritesStateCopyWithImpl(
      _FavoritesState _value, $Res Function(_FavoritesState) _then)
      : super(_value, (v) => _then(v as _FavoritesState));

  @override
  _FavoritesState get _value => super._value as _FavoritesState;

  @override
  $Res call({
    Object moviesOption = freezed,
  }) {
    return _then(_FavoritesState(
      moviesOption == freezed
          ? _value.moviesOption
          : moviesOption as Option<List<MovieData>>,
    ));
  }
}

/// @nodoc
class _$_FavoritesState implements _FavoritesState {
  const _$_FavoritesState(this.moviesOption) : assert(moviesOption != null);

  @override
  final Option<List<MovieData>> moviesOption;

  @override
  String toString() {
    return 'FavoritesState(moviesOption: $moviesOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FavoritesState &&
            (identical(other.moviesOption, moviesOption) ||
                const DeepCollectionEquality()
                    .equals(other.moviesOption, moviesOption)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(moviesOption);

  @override
  _$FavoritesStateCopyWith<_FavoritesState> get copyWith =>
      __$FavoritesStateCopyWithImpl<_FavoritesState>(this, _$identity);
}

abstract class _FavoritesState implements FavoritesState {
  const factory _FavoritesState(Option<List<MovieData>> moviesOption) =
      _$_FavoritesState;

  @override
  Option<List<MovieData>> get moviesOption;
  @override
  _$FavoritesStateCopyWith<_FavoritesState> get copyWith;
}
