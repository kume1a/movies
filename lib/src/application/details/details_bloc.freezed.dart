// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'details_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$DetailsEventTearOff {
  const _$DetailsEventTearOff();

// ignore: unused_element
  _MovieFetchRequested movieFetchRequested() {
    return const _MovieFetchRequested();
  }

// ignore: unused_element
  _CastPageFetchRequested castPageFetchRequested() {
    return const _CastPageFetchRequested();
  }

// ignore: unused_element
  _FavoriteToggled favoriteToggled() {
    return const _FavoriteToggled();
  }
}

/// @nodoc
// ignore: unused_element
const $DetailsEvent = _$DetailsEventTearOff();

/// @nodoc
mixin _$DetailsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult movieFetchRequested(),
    @required TResult castPageFetchRequested(),
    @required TResult favoriteToggled(),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult movieFetchRequested(),
    TResult castPageFetchRequested(),
    TResult favoriteToggled(),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult movieFetchRequested(_MovieFetchRequested value),
    @required TResult castPageFetchRequested(_CastPageFetchRequested value),
    @required TResult favoriteToggled(_FavoriteToggled value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult movieFetchRequested(_MovieFetchRequested value),
    TResult castPageFetchRequested(_CastPageFetchRequested value),
    TResult favoriteToggled(_FavoriteToggled value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $DetailsEventCopyWith<$Res> {
  factory $DetailsEventCopyWith(
          DetailsEvent value, $Res Function(DetailsEvent) then) =
      _$DetailsEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$DetailsEventCopyWithImpl<$Res> implements $DetailsEventCopyWith<$Res> {
  _$DetailsEventCopyWithImpl(this._value, this._then);

  final DetailsEvent _value;
  // ignore: unused_field
  final $Res Function(DetailsEvent) _then;
}

/// @nodoc
abstract class _$MovieFetchRequestedCopyWith<$Res> {
  factory _$MovieFetchRequestedCopyWith(_MovieFetchRequested value,
          $Res Function(_MovieFetchRequested) then) =
      __$MovieFetchRequestedCopyWithImpl<$Res>;
}

/// @nodoc
class __$MovieFetchRequestedCopyWithImpl<$Res>
    extends _$DetailsEventCopyWithImpl<$Res>
    implements _$MovieFetchRequestedCopyWith<$Res> {
  __$MovieFetchRequestedCopyWithImpl(
      _MovieFetchRequested _value, $Res Function(_MovieFetchRequested) _then)
      : super(_value, (v) => _then(v as _MovieFetchRequested));

  @override
  _MovieFetchRequested get _value => super._value as _MovieFetchRequested;
}

/// @nodoc
class _$_MovieFetchRequested implements _MovieFetchRequested {
  const _$_MovieFetchRequested();

  @override
  String toString() {
    return 'DetailsEvent.movieFetchRequested()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _MovieFetchRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult movieFetchRequested(),
    @required TResult castPageFetchRequested(),
    @required TResult favoriteToggled(),
  }) {
    assert(movieFetchRequested != null);
    assert(castPageFetchRequested != null);
    assert(favoriteToggled != null);
    return movieFetchRequested();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult movieFetchRequested(),
    TResult castPageFetchRequested(),
    TResult favoriteToggled(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (movieFetchRequested != null) {
      return movieFetchRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult movieFetchRequested(_MovieFetchRequested value),
    @required TResult castPageFetchRequested(_CastPageFetchRequested value),
    @required TResult favoriteToggled(_FavoriteToggled value),
  }) {
    assert(movieFetchRequested != null);
    assert(castPageFetchRequested != null);
    assert(favoriteToggled != null);
    return movieFetchRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult movieFetchRequested(_MovieFetchRequested value),
    TResult castPageFetchRequested(_CastPageFetchRequested value),
    TResult favoriteToggled(_FavoriteToggled value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (movieFetchRequested != null) {
      return movieFetchRequested(this);
    }
    return orElse();
  }
}

abstract class _MovieFetchRequested implements DetailsEvent {
  const factory _MovieFetchRequested() = _$_MovieFetchRequested;
}

/// @nodoc
abstract class _$CastPageFetchRequestedCopyWith<$Res> {
  factory _$CastPageFetchRequestedCopyWith(_CastPageFetchRequested value,
          $Res Function(_CastPageFetchRequested) then) =
      __$CastPageFetchRequestedCopyWithImpl<$Res>;
}

/// @nodoc
class __$CastPageFetchRequestedCopyWithImpl<$Res>
    extends _$DetailsEventCopyWithImpl<$Res>
    implements _$CastPageFetchRequestedCopyWith<$Res> {
  __$CastPageFetchRequestedCopyWithImpl(_CastPageFetchRequested _value,
      $Res Function(_CastPageFetchRequested) _then)
      : super(_value, (v) => _then(v as _CastPageFetchRequested));

  @override
  _CastPageFetchRequested get _value => super._value as _CastPageFetchRequested;
}

/// @nodoc
class _$_CastPageFetchRequested implements _CastPageFetchRequested {
  const _$_CastPageFetchRequested();

  @override
  String toString() {
    return 'DetailsEvent.castPageFetchRequested()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _CastPageFetchRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult movieFetchRequested(),
    @required TResult castPageFetchRequested(),
    @required TResult favoriteToggled(),
  }) {
    assert(movieFetchRequested != null);
    assert(castPageFetchRequested != null);
    assert(favoriteToggled != null);
    return castPageFetchRequested();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult movieFetchRequested(),
    TResult castPageFetchRequested(),
    TResult favoriteToggled(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (castPageFetchRequested != null) {
      return castPageFetchRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult movieFetchRequested(_MovieFetchRequested value),
    @required TResult castPageFetchRequested(_CastPageFetchRequested value),
    @required TResult favoriteToggled(_FavoriteToggled value),
  }) {
    assert(movieFetchRequested != null);
    assert(castPageFetchRequested != null);
    assert(favoriteToggled != null);
    return castPageFetchRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult movieFetchRequested(_MovieFetchRequested value),
    TResult castPageFetchRequested(_CastPageFetchRequested value),
    TResult favoriteToggled(_FavoriteToggled value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (castPageFetchRequested != null) {
      return castPageFetchRequested(this);
    }
    return orElse();
  }
}

abstract class _CastPageFetchRequested implements DetailsEvent {
  const factory _CastPageFetchRequested() = _$_CastPageFetchRequested;
}

/// @nodoc
abstract class _$FavoriteToggledCopyWith<$Res> {
  factory _$FavoriteToggledCopyWith(
          _FavoriteToggled value, $Res Function(_FavoriteToggled) then) =
      __$FavoriteToggledCopyWithImpl<$Res>;
}

/// @nodoc
class __$FavoriteToggledCopyWithImpl<$Res>
    extends _$DetailsEventCopyWithImpl<$Res>
    implements _$FavoriteToggledCopyWith<$Res> {
  __$FavoriteToggledCopyWithImpl(
      _FavoriteToggled _value, $Res Function(_FavoriteToggled) _then)
      : super(_value, (v) => _then(v as _FavoriteToggled));

  @override
  _FavoriteToggled get _value => super._value as _FavoriteToggled;
}

/// @nodoc
class _$_FavoriteToggled implements _FavoriteToggled {
  const _$_FavoriteToggled();

  @override
  String toString() {
    return 'DetailsEvent.favoriteToggled()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _FavoriteToggled);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult movieFetchRequested(),
    @required TResult castPageFetchRequested(),
    @required TResult favoriteToggled(),
  }) {
    assert(movieFetchRequested != null);
    assert(castPageFetchRequested != null);
    assert(favoriteToggled != null);
    return favoriteToggled();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult movieFetchRequested(),
    TResult castPageFetchRequested(),
    TResult favoriteToggled(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (favoriteToggled != null) {
      return favoriteToggled();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult movieFetchRequested(_MovieFetchRequested value),
    @required TResult castPageFetchRequested(_CastPageFetchRequested value),
    @required TResult favoriteToggled(_FavoriteToggled value),
  }) {
    assert(movieFetchRequested != null);
    assert(castPageFetchRequested != null);
    assert(favoriteToggled != null);
    return favoriteToggled(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult movieFetchRequested(_MovieFetchRequested value),
    TResult castPageFetchRequested(_CastPageFetchRequested value),
    TResult favoriteToggled(_FavoriteToggled value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (favoriteToggled != null) {
      return favoriteToggled(this);
    }
    return orElse();
  }
}

abstract class _FavoriteToggled implements DetailsEvent {
  const factory _FavoriteToggled() = _$_FavoriteToggled;
}

/// @nodoc
class _$DetailsStateTearOff {
  const _$DetailsStateTearOff();

// ignore: unused_element
  _DetailsState call(Option<MovieData> movieOption, Option<Actors> actorsOption,
      bool favorite) {
    return _DetailsState(
      movieOption,
      actorsOption,
      favorite,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $DetailsState = _$DetailsStateTearOff();

/// @nodoc
mixin _$DetailsState {
  Option<MovieData> get movieOption;
  Option<Actors> get actorsOption;
  bool get favorite;

  $DetailsStateCopyWith<DetailsState> get copyWith;
}

/// @nodoc
abstract class $DetailsStateCopyWith<$Res> {
  factory $DetailsStateCopyWith(
          DetailsState value, $Res Function(DetailsState) then) =
      _$DetailsStateCopyWithImpl<$Res>;
  $Res call(
      {Option<MovieData> movieOption,
      Option<Actors> actorsOption,
      bool favorite});
}

/// @nodoc
class _$DetailsStateCopyWithImpl<$Res> implements $DetailsStateCopyWith<$Res> {
  _$DetailsStateCopyWithImpl(this._value, this._then);

  final DetailsState _value;
  // ignore: unused_field
  final $Res Function(DetailsState) _then;

  @override
  $Res call({
    Object movieOption = freezed,
    Object actorsOption = freezed,
    Object favorite = freezed,
  }) {
    return _then(_value.copyWith(
      movieOption: movieOption == freezed
          ? _value.movieOption
          : movieOption as Option<MovieData>,
      actorsOption: actorsOption == freezed
          ? _value.actorsOption
          : actorsOption as Option<Actors>,
      favorite: favorite == freezed ? _value.favorite : favorite as bool,
    ));
  }
}

/// @nodoc
abstract class _$DetailsStateCopyWith<$Res>
    implements $DetailsStateCopyWith<$Res> {
  factory _$DetailsStateCopyWith(
          _DetailsState value, $Res Function(_DetailsState) then) =
      __$DetailsStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Option<MovieData> movieOption,
      Option<Actors> actorsOption,
      bool favorite});
}

/// @nodoc
class __$DetailsStateCopyWithImpl<$Res> extends _$DetailsStateCopyWithImpl<$Res>
    implements _$DetailsStateCopyWith<$Res> {
  __$DetailsStateCopyWithImpl(
      _DetailsState _value, $Res Function(_DetailsState) _then)
      : super(_value, (v) => _then(v as _DetailsState));

  @override
  _DetailsState get _value => super._value as _DetailsState;

  @override
  $Res call({
    Object movieOption = freezed,
    Object actorsOption = freezed,
    Object favorite = freezed,
  }) {
    return _then(_DetailsState(
      movieOption == freezed
          ? _value.movieOption
          : movieOption as Option<MovieData>,
      actorsOption == freezed
          ? _value.actorsOption
          : actorsOption as Option<Actors>,
      favorite == freezed ? _value.favorite : favorite as bool,
    ));
  }
}

/// @nodoc
class _$_DetailsState implements _DetailsState {
  const _$_DetailsState(this.movieOption, this.actorsOption, this.favorite)
      : assert(movieOption != null),
        assert(actorsOption != null),
        assert(favorite != null);

  @override
  final Option<MovieData> movieOption;
  @override
  final Option<Actors> actorsOption;
  @override
  final bool favorite;

  @override
  String toString() {
    return 'DetailsState(movieOption: $movieOption, actorsOption: $actorsOption, favorite: $favorite)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DetailsState &&
            (identical(other.movieOption, movieOption) ||
                const DeepCollectionEquality()
                    .equals(other.movieOption, movieOption)) &&
            (identical(other.actorsOption, actorsOption) ||
                const DeepCollectionEquality()
                    .equals(other.actorsOption, actorsOption)) &&
            (identical(other.favorite, favorite) ||
                const DeepCollectionEquality()
                    .equals(other.favorite, favorite)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(movieOption) ^
      const DeepCollectionEquality().hash(actorsOption) ^
      const DeepCollectionEquality().hash(favorite);

  @override
  _$DetailsStateCopyWith<_DetailsState> get copyWith =>
      __$DetailsStateCopyWithImpl<_DetailsState>(this, _$identity);
}

abstract class _DetailsState implements DetailsState {
  const factory _DetailsState(Option<MovieData> movieOption,
      Option<Actors> actorsOption, bool favorite) = _$_DetailsState;

  @override
  Option<MovieData> get movieOption;
  @override
  Option<Actors> get actorsOption;
  @override
  bool get favorite;
  @override
  _$DetailsStateCopyWith<_DetailsState> get copyWith;
}
