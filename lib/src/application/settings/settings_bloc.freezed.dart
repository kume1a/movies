// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'settings_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$SettingsEventTearOff {
  const _$SettingsEventTearOff();

// ignore: unused_element
  _Initial initial(
      {@required bool isNightModeEnabled,
      @required bool isAutoPlatEnabled,
      @required int seekValue,
      @required bool isRecordSearchHistoryEnabled,
      @required bool isRecordWatchHistoryEnabled}) {
    return _Initial(
      isNightModeEnabled: isNightModeEnabled,
      isAutoPlatEnabled: isAutoPlatEnabled,
      seekValue: seekValue,
      isRecordSearchHistoryEnabled: isRecordSearchHistoryEnabled,
      isRecordWatchHistoryEnabled: isRecordWatchHistoryEnabled,
    );
  }

// ignore: unused_element
  _NightModeSwitched nightModeSwitched({@required bool enabled}) {
    return _NightModeSwitched(
      enabled: enabled,
    );
  }

// ignore: unused_element
  _AutoPlaySwitched autoPlaySwitched({@required bool enabled}) {
    return _AutoPlaySwitched(
      enabled: enabled,
    );
  }

// ignore: unused_element
  _DoubleTapToSeekValueChanged doubleTapToSeekValueChanged(int value) {
    return _DoubleTapToSeekValueChanged(
      value,
    );
  }

// ignore: unused_element
  _ClearSearchHistoryRequested clearSearchHistoryRequested() {
    return const _ClearSearchHistoryRequested();
  }

// ignore: unused_element
  _ClearWatchHistoryRequested clearWatchHistoryRequested() {
    return const _ClearWatchHistoryRequested();
  }

// ignore: unused_element
  _SearchHistoryEnabledSwitched searchHistoryEnabledSwitched(
      {@required bool enabled}) {
    return _SearchHistoryEnabledSwitched(
      enabled: enabled,
    );
  }

// ignore: unused_element
  _WatchHistoryEnabledSwitched watchHistoryEnabledSwitched(
      {@required bool enabled}) {
    return _WatchHistoryEnabledSwitched(
      enabled: enabled,
    );
  }

// ignore: unused_element
  _ClearFavoritesRequested clearFavoritesRequested() {
    return const _ClearFavoritesRequested();
  }
}

/// @nodoc
// ignore: unused_element
const $SettingsEvent = _$SettingsEventTearOff();

/// @nodoc
mixin _$SettingsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required
        TResult initial(
            bool isNightModeEnabled,
            bool isAutoPlatEnabled,
            int seekValue,
            bool isRecordSearchHistoryEnabled,
            bool isRecordWatchHistoryEnabled),
    @required TResult nightModeSwitched(bool enabled),
    @required TResult autoPlaySwitched(bool enabled),
    @required TResult doubleTapToSeekValueChanged(int value),
    @required TResult clearSearchHistoryRequested(),
    @required TResult clearWatchHistoryRequested(),
    @required TResult searchHistoryEnabledSwitched(bool enabled),
    @required TResult watchHistoryEnabledSwitched(bool enabled),
    @required TResult clearFavoritesRequested(),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(
        bool isNightModeEnabled,
        bool isAutoPlatEnabled,
        int seekValue,
        bool isRecordSearchHistoryEnabled,
        bool isRecordWatchHistoryEnabled),
    TResult nightModeSwitched(bool enabled),
    TResult autoPlaySwitched(bool enabled),
    TResult doubleTapToSeekValueChanged(int value),
    TResult clearSearchHistoryRequested(),
    TResult clearWatchHistoryRequested(),
    TResult searchHistoryEnabledSwitched(bool enabled),
    TResult watchHistoryEnabledSwitched(bool enabled),
    TResult clearFavoritesRequested(),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult nightModeSwitched(_NightModeSwitched value),
    @required TResult autoPlaySwitched(_AutoPlaySwitched value),
    @required
        TResult doubleTapToSeekValueChanged(_DoubleTapToSeekValueChanged value),
    @required
        TResult clearSearchHistoryRequested(_ClearSearchHistoryRequested value),
    @required
        TResult clearWatchHistoryRequested(_ClearWatchHistoryRequested value),
    @required
        TResult searchHistoryEnabledSwitched(
            _SearchHistoryEnabledSwitched value),
    @required
        TResult watchHistoryEnabledSwitched(_WatchHistoryEnabledSwitched value),
    @required TResult clearFavoritesRequested(_ClearFavoritesRequested value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult nightModeSwitched(_NightModeSwitched value),
    TResult autoPlaySwitched(_AutoPlaySwitched value),
    TResult doubleTapToSeekValueChanged(_DoubleTapToSeekValueChanged value),
    TResult clearSearchHistoryRequested(_ClearSearchHistoryRequested value),
    TResult clearWatchHistoryRequested(_ClearWatchHistoryRequested value),
    TResult searchHistoryEnabledSwitched(_SearchHistoryEnabledSwitched value),
    TResult watchHistoryEnabledSwitched(_WatchHistoryEnabledSwitched value),
    TResult clearFavoritesRequested(_ClearFavoritesRequested value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $SettingsEventCopyWith<$Res> {
  factory $SettingsEventCopyWith(
          SettingsEvent value, $Res Function(SettingsEvent) then) =
      _$SettingsEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$SettingsEventCopyWithImpl<$Res>
    implements $SettingsEventCopyWith<$Res> {
  _$SettingsEventCopyWithImpl(this._value, this._then);

  final SettingsEvent _value;
  // ignore: unused_field
  final $Res Function(SettingsEvent) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
  $Res call(
      {bool isNightModeEnabled,
      bool isAutoPlatEnabled,
      int seekValue,
      bool isRecordSearchHistoryEnabled,
      bool isRecordWatchHistoryEnabled});
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$SettingsEventCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;

  @override
  $Res call({
    Object isNightModeEnabled = freezed,
    Object isAutoPlatEnabled = freezed,
    Object seekValue = freezed,
    Object isRecordSearchHistoryEnabled = freezed,
    Object isRecordWatchHistoryEnabled = freezed,
  }) {
    return _then(_Initial(
      isNightModeEnabled: isNightModeEnabled == freezed
          ? _value.isNightModeEnabled
          : isNightModeEnabled as bool,
      isAutoPlatEnabled: isAutoPlatEnabled == freezed
          ? _value.isAutoPlatEnabled
          : isAutoPlatEnabled as bool,
      seekValue: seekValue == freezed ? _value.seekValue : seekValue as int,
      isRecordSearchHistoryEnabled: isRecordSearchHistoryEnabled == freezed
          ? _value.isRecordSearchHistoryEnabled
          : isRecordSearchHistoryEnabled as bool,
      isRecordWatchHistoryEnabled: isRecordWatchHistoryEnabled == freezed
          ? _value.isRecordWatchHistoryEnabled
          : isRecordWatchHistoryEnabled as bool,
    ));
  }
}

/// @nodoc
class _$_Initial implements _Initial {
  const _$_Initial(
      {@required this.isNightModeEnabled,
      @required this.isAutoPlatEnabled,
      @required this.seekValue,
      @required this.isRecordSearchHistoryEnabled,
      @required this.isRecordWatchHistoryEnabled})
      : assert(isNightModeEnabled != null),
        assert(isAutoPlatEnabled != null),
        assert(seekValue != null),
        assert(isRecordSearchHistoryEnabled != null),
        assert(isRecordWatchHistoryEnabled != null);

  @override
  final bool isNightModeEnabled;
  @override
  final bool isAutoPlatEnabled;
  @override
  final int seekValue;
  @override
  final bool isRecordSearchHistoryEnabled;
  @override
  final bool isRecordWatchHistoryEnabled;

  @override
  String toString() {
    return 'SettingsEvent.initial(isNightModeEnabled: $isNightModeEnabled, isAutoPlatEnabled: $isAutoPlatEnabled, seekValue: $seekValue, isRecordSearchHistoryEnabled: $isRecordSearchHistoryEnabled, isRecordWatchHistoryEnabled: $isRecordWatchHistoryEnabled)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Initial &&
            (identical(other.isNightModeEnabled, isNightModeEnabled) ||
                const DeepCollectionEquality()
                    .equals(other.isNightModeEnabled, isNightModeEnabled)) &&
            (identical(other.isAutoPlatEnabled, isAutoPlatEnabled) ||
                const DeepCollectionEquality()
                    .equals(other.isAutoPlatEnabled, isAutoPlatEnabled)) &&
            (identical(other.seekValue, seekValue) ||
                const DeepCollectionEquality()
                    .equals(other.seekValue, seekValue)) &&
            (identical(other.isRecordSearchHistoryEnabled,
                    isRecordSearchHistoryEnabled) ||
                const DeepCollectionEquality().equals(
                    other.isRecordSearchHistoryEnabled,
                    isRecordSearchHistoryEnabled)) &&
            (identical(other.isRecordWatchHistoryEnabled,
                    isRecordWatchHistoryEnabled) ||
                const DeepCollectionEquality().equals(
                    other.isRecordWatchHistoryEnabled,
                    isRecordWatchHistoryEnabled)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isNightModeEnabled) ^
      const DeepCollectionEquality().hash(isAutoPlatEnabled) ^
      const DeepCollectionEquality().hash(seekValue) ^
      const DeepCollectionEquality().hash(isRecordSearchHistoryEnabled) ^
      const DeepCollectionEquality().hash(isRecordWatchHistoryEnabled);

  @override
  _$InitialCopyWith<_Initial> get copyWith =>
      __$InitialCopyWithImpl<_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required
        TResult initial(
            bool isNightModeEnabled,
            bool isAutoPlatEnabled,
            int seekValue,
            bool isRecordSearchHistoryEnabled,
            bool isRecordWatchHistoryEnabled),
    @required TResult nightModeSwitched(bool enabled),
    @required TResult autoPlaySwitched(bool enabled),
    @required TResult doubleTapToSeekValueChanged(int value),
    @required TResult clearSearchHistoryRequested(),
    @required TResult clearWatchHistoryRequested(),
    @required TResult searchHistoryEnabledSwitched(bool enabled),
    @required TResult watchHistoryEnabledSwitched(bool enabled),
    @required TResult clearFavoritesRequested(),
  }) {
    assert(initial != null);
    assert(nightModeSwitched != null);
    assert(autoPlaySwitched != null);
    assert(doubleTapToSeekValueChanged != null);
    assert(clearSearchHistoryRequested != null);
    assert(clearWatchHistoryRequested != null);
    assert(searchHistoryEnabledSwitched != null);
    assert(watchHistoryEnabledSwitched != null);
    assert(clearFavoritesRequested != null);
    return initial(isNightModeEnabled, isAutoPlatEnabled, seekValue,
        isRecordSearchHistoryEnabled, isRecordWatchHistoryEnabled);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(
        bool isNightModeEnabled,
        bool isAutoPlatEnabled,
        int seekValue,
        bool isRecordSearchHistoryEnabled,
        bool isRecordWatchHistoryEnabled),
    TResult nightModeSwitched(bool enabled),
    TResult autoPlaySwitched(bool enabled),
    TResult doubleTapToSeekValueChanged(int value),
    TResult clearSearchHistoryRequested(),
    TResult clearWatchHistoryRequested(),
    TResult searchHistoryEnabledSwitched(bool enabled),
    TResult watchHistoryEnabledSwitched(bool enabled),
    TResult clearFavoritesRequested(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(isNightModeEnabled, isAutoPlatEnabled, seekValue,
          isRecordSearchHistoryEnabled, isRecordWatchHistoryEnabled);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult nightModeSwitched(_NightModeSwitched value),
    @required TResult autoPlaySwitched(_AutoPlaySwitched value),
    @required
        TResult doubleTapToSeekValueChanged(_DoubleTapToSeekValueChanged value),
    @required
        TResult clearSearchHistoryRequested(_ClearSearchHistoryRequested value),
    @required
        TResult clearWatchHistoryRequested(_ClearWatchHistoryRequested value),
    @required
        TResult searchHistoryEnabledSwitched(
            _SearchHistoryEnabledSwitched value),
    @required
        TResult watchHistoryEnabledSwitched(_WatchHistoryEnabledSwitched value),
    @required TResult clearFavoritesRequested(_ClearFavoritesRequested value),
  }) {
    assert(initial != null);
    assert(nightModeSwitched != null);
    assert(autoPlaySwitched != null);
    assert(doubleTapToSeekValueChanged != null);
    assert(clearSearchHistoryRequested != null);
    assert(clearWatchHistoryRequested != null);
    assert(searchHistoryEnabledSwitched != null);
    assert(watchHistoryEnabledSwitched != null);
    assert(clearFavoritesRequested != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult nightModeSwitched(_NightModeSwitched value),
    TResult autoPlaySwitched(_AutoPlaySwitched value),
    TResult doubleTapToSeekValueChanged(_DoubleTapToSeekValueChanged value),
    TResult clearSearchHistoryRequested(_ClearSearchHistoryRequested value),
    TResult clearWatchHistoryRequested(_ClearWatchHistoryRequested value),
    TResult searchHistoryEnabledSwitched(_SearchHistoryEnabledSwitched value),
    TResult watchHistoryEnabledSwitched(_WatchHistoryEnabledSwitched value),
    TResult clearFavoritesRequested(_ClearFavoritesRequested value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements SettingsEvent {
  const factory _Initial(
      {@required bool isNightModeEnabled,
      @required bool isAutoPlatEnabled,
      @required int seekValue,
      @required bool isRecordSearchHistoryEnabled,
      @required bool isRecordWatchHistoryEnabled}) = _$_Initial;

  bool get isNightModeEnabled;
  bool get isAutoPlatEnabled;
  int get seekValue;
  bool get isRecordSearchHistoryEnabled;
  bool get isRecordWatchHistoryEnabled;
  _$InitialCopyWith<_Initial> get copyWith;
}

/// @nodoc
abstract class _$NightModeSwitchedCopyWith<$Res> {
  factory _$NightModeSwitchedCopyWith(
          _NightModeSwitched value, $Res Function(_NightModeSwitched) then) =
      __$NightModeSwitchedCopyWithImpl<$Res>;
  $Res call({bool enabled});
}

/// @nodoc
class __$NightModeSwitchedCopyWithImpl<$Res>
    extends _$SettingsEventCopyWithImpl<$Res>
    implements _$NightModeSwitchedCopyWith<$Res> {
  __$NightModeSwitchedCopyWithImpl(
      _NightModeSwitched _value, $Res Function(_NightModeSwitched) _then)
      : super(_value, (v) => _then(v as _NightModeSwitched));

  @override
  _NightModeSwitched get _value => super._value as _NightModeSwitched;

  @override
  $Res call({
    Object enabled = freezed,
  }) {
    return _then(_NightModeSwitched(
      enabled: enabled == freezed ? _value.enabled : enabled as bool,
    ));
  }
}

/// @nodoc
class _$_NightModeSwitched implements _NightModeSwitched {
  const _$_NightModeSwitched({@required this.enabled})
      : assert(enabled != null);

  @override
  final bool enabled;

  @override
  String toString() {
    return 'SettingsEvent.nightModeSwitched(enabled: $enabled)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _NightModeSwitched &&
            (identical(other.enabled, enabled) ||
                const DeepCollectionEquality().equals(other.enabled, enabled)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(enabled);

  @override
  _$NightModeSwitchedCopyWith<_NightModeSwitched> get copyWith =>
      __$NightModeSwitchedCopyWithImpl<_NightModeSwitched>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required
        TResult initial(
            bool isNightModeEnabled,
            bool isAutoPlatEnabled,
            int seekValue,
            bool isRecordSearchHistoryEnabled,
            bool isRecordWatchHistoryEnabled),
    @required TResult nightModeSwitched(bool enabled),
    @required TResult autoPlaySwitched(bool enabled),
    @required TResult doubleTapToSeekValueChanged(int value),
    @required TResult clearSearchHistoryRequested(),
    @required TResult clearWatchHistoryRequested(),
    @required TResult searchHistoryEnabledSwitched(bool enabled),
    @required TResult watchHistoryEnabledSwitched(bool enabled),
    @required TResult clearFavoritesRequested(),
  }) {
    assert(initial != null);
    assert(nightModeSwitched != null);
    assert(autoPlaySwitched != null);
    assert(doubleTapToSeekValueChanged != null);
    assert(clearSearchHistoryRequested != null);
    assert(clearWatchHistoryRequested != null);
    assert(searchHistoryEnabledSwitched != null);
    assert(watchHistoryEnabledSwitched != null);
    assert(clearFavoritesRequested != null);
    return nightModeSwitched(enabled);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(
        bool isNightModeEnabled,
        bool isAutoPlatEnabled,
        int seekValue,
        bool isRecordSearchHistoryEnabled,
        bool isRecordWatchHistoryEnabled),
    TResult nightModeSwitched(bool enabled),
    TResult autoPlaySwitched(bool enabled),
    TResult doubleTapToSeekValueChanged(int value),
    TResult clearSearchHistoryRequested(),
    TResult clearWatchHistoryRequested(),
    TResult searchHistoryEnabledSwitched(bool enabled),
    TResult watchHistoryEnabledSwitched(bool enabled),
    TResult clearFavoritesRequested(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (nightModeSwitched != null) {
      return nightModeSwitched(enabled);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult nightModeSwitched(_NightModeSwitched value),
    @required TResult autoPlaySwitched(_AutoPlaySwitched value),
    @required
        TResult doubleTapToSeekValueChanged(_DoubleTapToSeekValueChanged value),
    @required
        TResult clearSearchHistoryRequested(_ClearSearchHistoryRequested value),
    @required
        TResult clearWatchHistoryRequested(_ClearWatchHistoryRequested value),
    @required
        TResult searchHistoryEnabledSwitched(
            _SearchHistoryEnabledSwitched value),
    @required
        TResult watchHistoryEnabledSwitched(_WatchHistoryEnabledSwitched value),
    @required TResult clearFavoritesRequested(_ClearFavoritesRequested value),
  }) {
    assert(initial != null);
    assert(nightModeSwitched != null);
    assert(autoPlaySwitched != null);
    assert(doubleTapToSeekValueChanged != null);
    assert(clearSearchHistoryRequested != null);
    assert(clearWatchHistoryRequested != null);
    assert(searchHistoryEnabledSwitched != null);
    assert(watchHistoryEnabledSwitched != null);
    assert(clearFavoritesRequested != null);
    return nightModeSwitched(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult nightModeSwitched(_NightModeSwitched value),
    TResult autoPlaySwitched(_AutoPlaySwitched value),
    TResult doubleTapToSeekValueChanged(_DoubleTapToSeekValueChanged value),
    TResult clearSearchHistoryRequested(_ClearSearchHistoryRequested value),
    TResult clearWatchHistoryRequested(_ClearWatchHistoryRequested value),
    TResult searchHistoryEnabledSwitched(_SearchHistoryEnabledSwitched value),
    TResult watchHistoryEnabledSwitched(_WatchHistoryEnabledSwitched value),
    TResult clearFavoritesRequested(_ClearFavoritesRequested value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (nightModeSwitched != null) {
      return nightModeSwitched(this);
    }
    return orElse();
  }
}

abstract class _NightModeSwitched implements SettingsEvent {
  const factory _NightModeSwitched({@required bool enabled}) =
      _$_NightModeSwitched;

  bool get enabled;
  _$NightModeSwitchedCopyWith<_NightModeSwitched> get copyWith;
}

/// @nodoc
abstract class _$AutoPlaySwitchedCopyWith<$Res> {
  factory _$AutoPlaySwitchedCopyWith(
          _AutoPlaySwitched value, $Res Function(_AutoPlaySwitched) then) =
      __$AutoPlaySwitchedCopyWithImpl<$Res>;
  $Res call({bool enabled});
}

/// @nodoc
class __$AutoPlaySwitchedCopyWithImpl<$Res>
    extends _$SettingsEventCopyWithImpl<$Res>
    implements _$AutoPlaySwitchedCopyWith<$Res> {
  __$AutoPlaySwitchedCopyWithImpl(
      _AutoPlaySwitched _value, $Res Function(_AutoPlaySwitched) _then)
      : super(_value, (v) => _then(v as _AutoPlaySwitched));

  @override
  _AutoPlaySwitched get _value => super._value as _AutoPlaySwitched;

  @override
  $Res call({
    Object enabled = freezed,
  }) {
    return _then(_AutoPlaySwitched(
      enabled: enabled == freezed ? _value.enabled : enabled as bool,
    ));
  }
}

/// @nodoc
class _$_AutoPlaySwitched implements _AutoPlaySwitched {
  const _$_AutoPlaySwitched({@required this.enabled}) : assert(enabled != null);

  @override
  final bool enabled;

  @override
  String toString() {
    return 'SettingsEvent.autoPlaySwitched(enabled: $enabled)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AutoPlaySwitched &&
            (identical(other.enabled, enabled) ||
                const DeepCollectionEquality().equals(other.enabled, enabled)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(enabled);

  @override
  _$AutoPlaySwitchedCopyWith<_AutoPlaySwitched> get copyWith =>
      __$AutoPlaySwitchedCopyWithImpl<_AutoPlaySwitched>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required
        TResult initial(
            bool isNightModeEnabled,
            bool isAutoPlatEnabled,
            int seekValue,
            bool isRecordSearchHistoryEnabled,
            bool isRecordWatchHistoryEnabled),
    @required TResult nightModeSwitched(bool enabled),
    @required TResult autoPlaySwitched(bool enabled),
    @required TResult doubleTapToSeekValueChanged(int value),
    @required TResult clearSearchHistoryRequested(),
    @required TResult clearWatchHistoryRequested(),
    @required TResult searchHistoryEnabledSwitched(bool enabled),
    @required TResult watchHistoryEnabledSwitched(bool enabled),
    @required TResult clearFavoritesRequested(),
  }) {
    assert(initial != null);
    assert(nightModeSwitched != null);
    assert(autoPlaySwitched != null);
    assert(doubleTapToSeekValueChanged != null);
    assert(clearSearchHistoryRequested != null);
    assert(clearWatchHistoryRequested != null);
    assert(searchHistoryEnabledSwitched != null);
    assert(watchHistoryEnabledSwitched != null);
    assert(clearFavoritesRequested != null);
    return autoPlaySwitched(enabled);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(
        bool isNightModeEnabled,
        bool isAutoPlatEnabled,
        int seekValue,
        bool isRecordSearchHistoryEnabled,
        bool isRecordWatchHistoryEnabled),
    TResult nightModeSwitched(bool enabled),
    TResult autoPlaySwitched(bool enabled),
    TResult doubleTapToSeekValueChanged(int value),
    TResult clearSearchHistoryRequested(),
    TResult clearWatchHistoryRequested(),
    TResult searchHistoryEnabledSwitched(bool enabled),
    TResult watchHistoryEnabledSwitched(bool enabled),
    TResult clearFavoritesRequested(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (autoPlaySwitched != null) {
      return autoPlaySwitched(enabled);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult nightModeSwitched(_NightModeSwitched value),
    @required TResult autoPlaySwitched(_AutoPlaySwitched value),
    @required
        TResult doubleTapToSeekValueChanged(_DoubleTapToSeekValueChanged value),
    @required
        TResult clearSearchHistoryRequested(_ClearSearchHistoryRequested value),
    @required
        TResult clearWatchHistoryRequested(_ClearWatchHistoryRequested value),
    @required
        TResult searchHistoryEnabledSwitched(
            _SearchHistoryEnabledSwitched value),
    @required
        TResult watchHistoryEnabledSwitched(_WatchHistoryEnabledSwitched value),
    @required TResult clearFavoritesRequested(_ClearFavoritesRequested value),
  }) {
    assert(initial != null);
    assert(nightModeSwitched != null);
    assert(autoPlaySwitched != null);
    assert(doubleTapToSeekValueChanged != null);
    assert(clearSearchHistoryRequested != null);
    assert(clearWatchHistoryRequested != null);
    assert(searchHistoryEnabledSwitched != null);
    assert(watchHistoryEnabledSwitched != null);
    assert(clearFavoritesRequested != null);
    return autoPlaySwitched(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult nightModeSwitched(_NightModeSwitched value),
    TResult autoPlaySwitched(_AutoPlaySwitched value),
    TResult doubleTapToSeekValueChanged(_DoubleTapToSeekValueChanged value),
    TResult clearSearchHistoryRequested(_ClearSearchHistoryRequested value),
    TResult clearWatchHistoryRequested(_ClearWatchHistoryRequested value),
    TResult searchHistoryEnabledSwitched(_SearchHistoryEnabledSwitched value),
    TResult watchHistoryEnabledSwitched(_WatchHistoryEnabledSwitched value),
    TResult clearFavoritesRequested(_ClearFavoritesRequested value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (autoPlaySwitched != null) {
      return autoPlaySwitched(this);
    }
    return orElse();
  }
}

abstract class _AutoPlaySwitched implements SettingsEvent {
  const factory _AutoPlaySwitched({@required bool enabled}) =
      _$_AutoPlaySwitched;

  bool get enabled;
  _$AutoPlaySwitchedCopyWith<_AutoPlaySwitched> get copyWith;
}

/// @nodoc
abstract class _$DoubleTapToSeekValueChangedCopyWith<$Res> {
  factory _$DoubleTapToSeekValueChangedCopyWith(
          _DoubleTapToSeekValueChanged value,
          $Res Function(_DoubleTapToSeekValueChanged) then) =
      __$DoubleTapToSeekValueChangedCopyWithImpl<$Res>;
  $Res call({int value});
}

/// @nodoc
class __$DoubleTapToSeekValueChangedCopyWithImpl<$Res>
    extends _$SettingsEventCopyWithImpl<$Res>
    implements _$DoubleTapToSeekValueChangedCopyWith<$Res> {
  __$DoubleTapToSeekValueChangedCopyWithImpl(
      _DoubleTapToSeekValueChanged _value,
      $Res Function(_DoubleTapToSeekValueChanged) _then)
      : super(_value, (v) => _then(v as _DoubleTapToSeekValueChanged));

  @override
  _DoubleTapToSeekValueChanged get _value =>
      super._value as _DoubleTapToSeekValueChanged;

  @override
  $Res call({
    Object value = freezed,
  }) {
    return _then(_DoubleTapToSeekValueChanged(
      value == freezed ? _value.value : value as int,
    ));
  }
}

/// @nodoc
class _$_DoubleTapToSeekValueChanged implements _DoubleTapToSeekValueChanged {
  const _$_DoubleTapToSeekValueChanged(this.value) : assert(value != null);

  @override
  final int value;

  @override
  String toString() {
    return 'SettingsEvent.doubleTapToSeekValueChanged(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DoubleTapToSeekValueChanged &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @override
  _$DoubleTapToSeekValueChangedCopyWith<_DoubleTapToSeekValueChanged>
      get copyWith => __$DoubleTapToSeekValueChangedCopyWithImpl<
          _DoubleTapToSeekValueChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required
        TResult initial(
            bool isNightModeEnabled,
            bool isAutoPlatEnabled,
            int seekValue,
            bool isRecordSearchHistoryEnabled,
            bool isRecordWatchHistoryEnabled),
    @required TResult nightModeSwitched(bool enabled),
    @required TResult autoPlaySwitched(bool enabled),
    @required TResult doubleTapToSeekValueChanged(int value),
    @required TResult clearSearchHistoryRequested(),
    @required TResult clearWatchHistoryRequested(),
    @required TResult searchHistoryEnabledSwitched(bool enabled),
    @required TResult watchHistoryEnabledSwitched(bool enabled),
    @required TResult clearFavoritesRequested(),
  }) {
    assert(initial != null);
    assert(nightModeSwitched != null);
    assert(autoPlaySwitched != null);
    assert(doubleTapToSeekValueChanged != null);
    assert(clearSearchHistoryRequested != null);
    assert(clearWatchHistoryRequested != null);
    assert(searchHistoryEnabledSwitched != null);
    assert(watchHistoryEnabledSwitched != null);
    assert(clearFavoritesRequested != null);
    return doubleTapToSeekValueChanged(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(
        bool isNightModeEnabled,
        bool isAutoPlatEnabled,
        int seekValue,
        bool isRecordSearchHistoryEnabled,
        bool isRecordWatchHistoryEnabled),
    TResult nightModeSwitched(bool enabled),
    TResult autoPlaySwitched(bool enabled),
    TResult doubleTapToSeekValueChanged(int value),
    TResult clearSearchHistoryRequested(),
    TResult clearWatchHistoryRequested(),
    TResult searchHistoryEnabledSwitched(bool enabled),
    TResult watchHistoryEnabledSwitched(bool enabled),
    TResult clearFavoritesRequested(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (doubleTapToSeekValueChanged != null) {
      return doubleTapToSeekValueChanged(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult nightModeSwitched(_NightModeSwitched value),
    @required TResult autoPlaySwitched(_AutoPlaySwitched value),
    @required
        TResult doubleTapToSeekValueChanged(_DoubleTapToSeekValueChanged value),
    @required
        TResult clearSearchHistoryRequested(_ClearSearchHistoryRequested value),
    @required
        TResult clearWatchHistoryRequested(_ClearWatchHistoryRequested value),
    @required
        TResult searchHistoryEnabledSwitched(
            _SearchHistoryEnabledSwitched value),
    @required
        TResult watchHistoryEnabledSwitched(_WatchHistoryEnabledSwitched value),
    @required TResult clearFavoritesRequested(_ClearFavoritesRequested value),
  }) {
    assert(initial != null);
    assert(nightModeSwitched != null);
    assert(autoPlaySwitched != null);
    assert(doubleTapToSeekValueChanged != null);
    assert(clearSearchHistoryRequested != null);
    assert(clearWatchHistoryRequested != null);
    assert(searchHistoryEnabledSwitched != null);
    assert(watchHistoryEnabledSwitched != null);
    assert(clearFavoritesRequested != null);
    return doubleTapToSeekValueChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult nightModeSwitched(_NightModeSwitched value),
    TResult autoPlaySwitched(_AutoPlaySwitched value),
    TResult doubleTapToSeekValueChanged(_DoubleTapToSeekValueChanged value),
    TResult clearSearchHistoryRequested(_ClearSearchHistoryRequested value),
    TResult clearWatchHistoryRequested(_ClearWatchHistoryRequested value),
    TResult searchHistoryEnabledSwitched(_SearchHistoryEnabledSwitched value),
    TResult watchHistoryEnabledSwitched(_WatchHistoryEnabledSwitched value),
    TResult clearFavoritesRequested(_ClearFavoritesRequested value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (doubleTapToSeekValueChanged != null) {
      return doubleTapToSeekValueChanged(this);
    }
    return orElse();
  }
}

abstract class _DoubleTapToSeekValueChanged implements SettingsEvent {
  const factory _DoubleTapToSeekValueChanged(int value) =
      _$_DoubleTapToSeekValueChanged;

  int get value;
  _$DoubleTapToSeekValueChangedCopyWith<_DoubleTapToSeekValueChanged>
      get copyWith;
}

/// @nodoc
abstract class _$ClearSearchHistoryRequestedCopyWith<$Res> {
  factory _$ClearSearchHistoryRequestedCopyWith(
          _ClearSearchHistoryRequested value,
          $Res Function(_ClearSearchHistoryRequested) then) =
      __$ClearSearchHistoryRequestedCopyWithImpl<$Res>;
}

/// @nodoc
class __$ClearSearchHistoryRequestedCopyWithImpl<$Res>
    extends _$SettingsEventCopyWithImpl<$Res>
    implements _$ClearSearchHistoryRequestedCopyWith<$Res> {
  __$ClearSearchHistoryRequestedCopyWithImpl(
      _ClearSearchHistoryRequested _value,
      $Res Function(_ClearSearchHistoryRequested) _then)
      : super(_value, (v) => _then(v as _ClearSearchHistoryRequested));

  @override
  _ClearSearchHistoryRequested get _value =>
      super._value as _ClearSearchHistoryRequested;
}

/// @nodoc
class _$_ClearSearchHistoryRequested implements _ClearSearchHistoryRequested {
  const _$_ClearSearchHistoryRequested();

  @override
  String toString() {
    return 'SettingsEvent.clearSearchHistoryRequested()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _ClearSearchHistoryRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required
        TResult initial(
            bool isNightModeEnabled,
            bool isAutoPlatEnabled,
            int seekValue,
            bool isRecordSearchHistoryEnabled,
            bool isRecordWatchHistoryEnabled),
    @required TResult nightModeSwitched(bool enabled),
    @required TResult autoPlaySwitched(bool enabled),
    @required TResult doubleTapToSeekValueChanged(int value),
    @required TResult clearSearchHistoryRequested(),
    @required TResult clearWatchHistoryRequested(),
    @required TResult searchHistoryEnabledSwitched(bool enabled),
    @required TResult watchHistoryEnabledSwitched(bool enabled),
    @required TResult clearFavoritesRequested(),
  }) {
    assert(initial != null);
    assert(nightModeSwitched != null);
    assert(autoPlaySwitched != null);
    assert(doubleTapToSeekValueChanged != null);
    assert(clearSearchHistoryRequested != null);
    assert(clearWatchHistoryRequested != null);
    assert(searchHistoryEnabledSwitched != null);
    assert(watchHistoryEnabledSwitched != null);
    assert(clearFavoritesRequested != null);
    return clearSearchHistoryRequested();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(
        bool isNightModeEnabled,
        bool isAutoPlatEnabled,
        int seekValue,
        bool isRecordSearchHistoryEnabled,
        bool isRecordWatchHistoryEnabled),
    TResult nightModeSwitched(bool enabled),
    TResult autoPlaySwitched(bool enabled),
    TResult doubleTapToSeekValueChanged(int value),
    TResult clearSearchHistoryRequested(),
    TResult clearWatchHistoryRequested(),
    TResult searchHistoryEnabledSwitched(bool enabled),
    TResult watchHistoryEnabledSwitched(bool enabled),
    TResult clearFavoritesRequested(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (clearSearchHistoryRequested != null) {
      return clearSearchHistoryRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult nightModeSwitched(_NightModeSwitched value),
    @required TResult autoPlaySwitched(_AutoPlaySwitched value),
    @required
        TResult doubleTapToSeekValueChanged(_DoubleTapToSeekValueChanged value),
    @required
        TResult clearSearchHistoryRequested(_ClearSearchHistoryRequested value),
    @required
        TResult clearWatchHistoryRequested(_ClearWatchHistoryRequested value),
    @required
        TResult searchHistoryEnabledSwitched(
            _SearchHistoryEnabledSwitched value),
    @required
        TResult watchHistoryEnabledSwitched(_WatchHistoryEnabledSwitched value),
    @required TResult clearFavoritesRequested(_ClearFavoritesRequested value),
  }) {
    assert(initial != null);
    assert(nightModeSwitched != null);
    assert(autoPlaySwitched != null);
    assert(doubleTapToSeekValueChanged != null);
    assert(clearSearchHistoryRequested != null);
    assert(clearWatchHistoryRequested != null);
    assert(searchHistoryEnabledSwitched != null);
    assert(watchHistoryEnabledSwitched != null);
    assert(clearFavoritesRequested != null);
    return clearSearchHistoryRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult nightModeSwitched(_NightModeSwitched value),
    TResult autoPlaySwitched(_AutoPlaySwitched value),
    TResult doubleTapToSeekValueChanged(_DoubleTapToSeekValueChanged value),
    TResult clearSearchHistoryRequested(_ClearSearchHistoryRequested value),
    TResult clearWatchHistoryRequested(_ClearWatchHistoryRequested value),
    TResult searchHistoryEnabledSwitched(_SearchHistoryEnabledSwitched value),
    TResult watchHistoryEnabledSwitched(_WatchHistoryEnabledSwitched value),
    TResult clearFavoritesRequested(_ClearFavoritesRequested value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (clearSearchHistoryRequested != null) {
      return clearSearchHistoryRequested(this);
    }
    return orElse();
  }
}

abstract class _ClearSearchHistoryRequested implements SettingsEvent {
  const factory _ClearSearchHistoryRequested() = _$_ClearSearchHistoryRequested;
}

/// @nodoc
abstract class _$ClearWatchHistoryRequestedCopyWith<$Res> {
  factory _$ClearWatchHistoryRequestedCopyWith(
          _ClearWatchHistoryRequested value,
          $Res Function(_ClearWatchHistoryRequested) then) =
      __$ClearWatchHistoryRequestedCopyWithImpl<$Res>;
}

/// @nodoc
class __$ClearWatchHistoryRequestedCopyWithImpl<$Res>
    extends _$SettingsEventCopyWithImpl<$Res>
    implements _$ClearWatchHistoryRequestedCopyWith<$Res> {
  __$ClearWatchHistoryRequestedCopyWithImpl(_ClearWatchHistoryRequested _value,
      $Res Function(_ClearWatchHistoryRequested) _then)
      : super(_value, (v) => _then(v as _ClearWatchHistoryRequested));

  @override
  _ClearWatchHistoryRequested get _value =>
      super._value as _ClearWatchHistoryRequested;
}

/// @nodoc
class _$_ClearWatchHistoryRequested implements _ClearWatchHistoryRequested {
  const _$_ClearWatchHistoryRequested();

  @override
  String toString() {
    return 'SettingsEvent.clearWatchHistoryRequested()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _ClearWatchHistoryRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required
        TResult initial(
            bool isNightModeEnabled,
            bool isAutoPlatEnabled,
            int seekValue,
            bool isRecordSearchHistoryEnabled,
            bool isRecordWatchHistoryEnabled),
    @required TResult nightModeSwitched(bool enabled),
    @required TResult autoPlaySwitched(bool enabled),
    @required TResult doubleTapToSeekValueChanged(int value),
    @required TResult clearSearchHistoryRequested(),
    @required TResult clearWatchHistoryRequested(),
    @required TResult searchHistoryEnabledSwitched(bool enabled),
    @required TResult watchHistoryEnabledSwitched(bool enabled),
    @required TResult clearFavoritesRequested(),
  }) {
    assert(initial != null);
    assert(nightModeSwitched != null);
    assert(autoPlaySwitched != null);
    assert(doubleTapToSeekValueChanged != null);
    assert(clearSearchHistoryRequested != null);
    assert(clearWatchHistoryRequested != null);
    assert(searchHistoryEnabledSwitched != null);
    assert(watchHistoryEnabledSwitched != null);
    assert(clearFavoritesRequested != null);
    return clearWatchHistoryRequested();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(
        bool isNightModeEnabled,
        bool isAutoPlatEnabled,
        int seekValue,
        bool isRecordSearchHistoryEnabled,
        bool isRecordWatchHistoryEnabled),
    TResult nightModeSwitched(bool enabled),
    TResult autoPlaySwitched(bool enabled),
    TResult doubleTapToSeekValueChanged(int value),
    TResult clearSearchHistoryRequested(),
    TResult clearWatchHistoryRequested(),
    TResult searchHistoryEnabledSwitched(bool enabled),
    TResult watchHistoryEnabledSwitched(bool enabled),
    TResult clearFavoritesRequested(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (clearWatchHistoryRequested != null) {
      return clearWatchHistoryRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult nightModeSwitched(_NightModeSwitched value),
    @required TResult autoPlaySwitched(_AutoPlaySwitched value),
    @required
        TResult doubleTapToSeekValueChanged(_DoubleTapToSeekValueChanged value),
    @required
        TResult clearSearchHistoryRequested(_ClearSearchHistoryRequested value),
    @required
        TResult clearWatchHistoryRequested(_ClearWatchHistoryRequested value),
    @required
        TResult searchHistoryEnabledSwitched(
            _SearchHistoryEnabledSwitched value),
    @required
        TResult watchHistoryEnabledSwitched(_WatchHistoryEnabledSwitched value),
    @required TResult clearFavoritesRequested(_ClearFavoritesRequested value),
  }) {
    assert(initial != null);
    assert(nightModeSwitched != null);
    assert(autoPlaySwitched != null);
    assert(doubleTapToSeekValueChanged != null);
    assert(clearSearchHistoryRequested != null);
    assert(clearWatchHistoryRequested != null);
    assert(searchHistoryEnabledSwitched != null);
    assert(watchHistoryEnabledSwitched != null);
    assert(clearFavoritesRequested != null);
    return clearWatchHistoryRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult nightModeSwitched(_NightModeSwitched value),
    TResult autoPlaySwitched(_AutoPlaySwitched value),
    TResult doubleTapToSeekValueChanged(_DoubleTapToSeekValueChanged value),
    TResult clearSearchHistoryRequested(_ClearSearchHistoryRequested value),
    TResult clearWatchHistoryRequested(_ClearWatchHistoryRequested value),
    TResult searchHistoryEnabledSwitched(_SearchHistoryEnabledSwitched value),
    TResult watchHistoryEnabledSwitched(_WatchHistoryEnabledSwitched value),
    TResult clearFavoritesRequested(_ClearFavoritesRequested value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (clearWatchHistoryRequested != null) {
      return clearWatchHistoryRequested(this);
    }
    return orElse();
  }
}

abstract class _ClearWatchHistoryRequested implements SettingsEvent {
  const factory _ClearWatchHistoryRequested() = _$_ClearWatchHistoryRequested;
}

/// @nodoc
abstract class _$SearchHistoryEnabledSwitchedCopyWith<$Res> {
  factory _$SearchHistoryEnabledSwitchedCopyWith(
          _SearchHistoryEnabledSwitched value,
          $Res Function(_SearchHistoryEnabledSwitched) then) =
      __$SearchHistoryEnabledSwitchedCopyWithImpl<$Res>;
  $Res call({bool enabled});
}

/// @nodoc
class __$SearchHistoryEnabledSwitchedCopyWithImpl<$Res>
    extends _$SettingsEventCopyWithImpl<$Res>
    implements _$SearchHistoryEnabledSwitchedCopyWith<$Res> {
  __$SearchHistoryEnabledSwitchedCopyWithImpl(
      _SearchHistoryEnabledSwitched _value,
      $Res Function(_SearchHistoryEnabledSwitched) _then)
      : super(_value, (v) => _then(v as _SearchHistoryEnabledSwitched));

  @override
  _SearchHistoryEnabledSwitched get _value =>
      super._value as _SearchHistoryEnabledSwitched;

  @override
  $Res call({
    Object enabled = freezed,
  }) {
    return _then(_SearchHistoryEnabledSwitched(
      enabled: enabled == freezed ? _value.enabled : enabled as bool,
    ));
  }
}

/// @nodoc
class _$_SearchHistoryEnabledSwitched implements _SearchHistoryEnabledSwitched {
  const _$_SearchHistoryEnabledSwitched({@required this.enabled})
      : assert(enabled != null);

  @override
  final bool enabled;

  @override
  String toString() {
    return 'SettingsEvent.searchHistoryEnabledSwitched(enabled: $enabled)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SearchHistoryEnabledSwitched &&
            (identical(other.enabled, enabled) ||
                const DeepCollectionEquality().equals(other.enabled, enabled)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(enabled);

  @override
  _$SearchHistoryEnabledSwitchedCopyWith<_SearchHistoryEnabledSwitched>
      get copyWith => __$SearchHistoryEnabledSwitchedCopyWithImpl<
          _SearchHistoryEnabledSwitched>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required
        TResult initial(
            bool isNightModeEnabled,
            bool isAutoPlatEnabled,
            int seekValue,
            bool isRecordSearchHistoryEnabled,
            bool isRecordWatchHistoryEnabled),
    @required TResult nightModeSwitched(bool enabled),
    @required TResult autoPlaySwitched(bool enabled),
    @required TResult doubleTapToSeekValueChanged(int value),
    @required TResult clearSearchHistoryRequested(),
    @required TResult clearWatchHistoryRequested(),
    @required TResult searchHistoryEnabledSwitched(bool enabled),
    @required TResult watchHistoryEnabledSwitched(bool enabled),
    @required TResult clearFavoritesRequested(),
  }) {
    assert(initial != null);
    assert(nightModeSwitched != null);
    assert(autoPlaySwitched != null);
    assert(doubleTapToSeekValueChanged != null);
    assert(clearSearchHistoryRequested != null);
    assert(clearWatchHistoryRequested != null);
    assert(searchHistoryEnabledSwitched != null);
    assert(watchHistoryEnabledSwitched != null);
    assert(clearFavoritesRequested != null);
    return searchHistoryEnabledSwitched(enabled);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(
        bool isNightModeEnabled,
        bool isAutoPlatEnabled,
        int seekValue,
        bool isRecordSearchHistoryEnabled,
        bool isRecordWatchHistoryEnabled),
    TResult nightModeSwitched(bool enabled),
    TResult autoPlaySwitched(bool enabled),
    TResult doubleTapToSeekValueChanged(int value),
    TResult clearSearchHistoryRequested(),
    TResult clearWatchHistoryRequested(),
    TResult searchHistoryEnabledSwitched(bool enabled),
    TResult watchHistoryEnabledSwitched(bool enabled),
    TResult clearFavoritesRequested(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (searchHistoryEnabledSwitched != null) {
      return searchHistoryEnabledSwitched(enabled);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult nightModeSwitched(_NightModeSwitched value),
    @required TResult autoPlaySwitched(_AutoPlaySwitched value),
    @required
        TResult doubleTapToSeekValueChanged(_DoubleTapToSeekValueChanged value),
    @required
        TResult clearSearchHistoryRequested(_ClearSearchHistoryRequested value),
    @required
        TResult clearWatchHistoryRequested(_ClearWatchHistoryRequested value),
    @required
        TResult searchHistoryEnabledSwitched(
            _SearchHistoryEnabledSwitched value),
    @required
        TResult watchHistoryEnabledSwitched(_WatchHistoryEnabledSwitched value),
    @required TResult clearFavoritesRequested(_ClearFavoritesRequested value),
  }) {
    assert(initial != null);
    assert(nightModeSwitched != null);
    assert(autoPlaySwitched != null);
    assert(doubleTapToSeekValueChanged != null);
    assert(clearSearchHistoryRequested != null);
    assert(clearWatchHistoryRequested != null);
    assert(searchHistoryEnabledSwitched != null);
    assert(watchHistoryEnabledSwitched != null);
    assert(clearFavoritesRequested != null);
    return searchHistoryEnabledSwitched(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult nightModeSwitched(_NightModeSwitched value),
    TResult autoPlaySwitched(_AutoPlaySwitched value),
    TResult doubleTapToSeekValueChanged(_DoubleTapToSeekValueChanged value),
    TResult clearSearchHistoryRequested(_ClearSearchHistoryRequested value),
    TResult clearWatchHistoryRequested(_ClearWatchHistoryRequested value),
    TResult searchHistoryEnabledSwitched(_SearchHistoryEnabledSwitched value),
    TResult watchHistoryEnabledSwitched(_WatchHistoryEnabledSwitched value),
    TResult clearFavoritesRequested(_ClearFavoritesRequested value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (searchHistoryEnabledSwitched != null) {
      return searchHistoryEnabledSwitched(this);
    }
    return orElse();
  }
}

abstract class _SearchHistoryEnabledSwitched implements SettingsEvent {
  const factory _SearchHistoryEnabledSwitched({@required bool enabled}) =
      _$_SearchHistoryEnabledSwitched;

  bool get enabled;
  _$SearchHistoryEnabledSwitchedCopyWith<_SearchHistoryEnabledSwitched>
      get copyWith;
}

/// @nodoc
abstract class _$WatchHistoryEnabledSwitchedCopyWith<$Res> {
  factory _$WatchHistoryEnabledSwitchedCopyWith(
          _WatchHistoryEnabledSwitched value,
          $Res Function(_WatchHistoryEnabledSwitched) then) =
      __$WatchHistoryEnabledSwitchedCopyWithImpl<$Res>;
  $Res call({bool enabled});
}

/// @nodoc
class __$WatchHistoryEnabledSwitchedCopyWithImpl<$Res>
    extends _$SettingsEventCopyWithImpl<$Res>
    implements _$WatchHistoryEnabledSwitchedCopyWith<$Res> {
  __$WatchHistoryEnabledSwitchedCopyWithImpl(
      _WatchHistoryEnabledSwitched _value,
      $Res Function(_WatchHistoryEnabledSwitched) _then)
      : super(_value, (v) => _then(v as _WatchHistoryEnabledSwitched));

  @override
  _WatchHistoryEnabledSwitched get _value =>
      super._value as _WatchHistoryEnabledSwitched;

  @override
  $Res call({
    Object enabled = freezed,
  }) {
    return _then(_WatchHistoryEnabledSwitched(
      enabled: enabled == freezed ? _value.enabled : enabled as bool,
    ));
  }
}

/// @nodoc
class _$_WatchHistoryEnabledSwitched implements _WatchHistoryEnabledSwitched {
  const _$_WatchHistoryEnabledSwitched({@required this.enabled})
      : assert(enabled != null);

  @override
  final bool enabled;

  @override
  String toString() {
    return 'SettingsEvent.watchHistoryEnabledSwitched(enabled: $enabled)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _WatchHistoryEnabledSwitched &&
            (identical(other.enabled, enabled) ||
                const DeepCollectionEquality().equals(other.enabled, enabled)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(enabled);

  @override
  _$WatchHistoryEnabledSwitchedCopyWith<_WatchHistoryEnabledSwitched>
      get copyWith => __$WatchHistoryEnabledSwitchedCopyWithImpl<
          _WatchHistoryEnabledSwitched>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required
        TResult initial(
            bool isNightModeEnabled,
            bool isAutoPlatEnabled,
            int seekValue,
            bool isRecordSearchHistoryEnabled,
            bool isRecordWatchHistoryEnabled),
    @required TResult nightModeSwitched(bool enabled),
    @required TResult autoPlaySwitched(bool enabled),
    @required TResult doubleTapToSeekValueChanged(int value),
    @required TResult clearSearchHistoryRequested(),
    @required TResult clearWatchHistoryRequested(),
    @required TResult searchHistoryEnabledSwitched(bool enabled),
    @required TResult watchHistoryEnabledSwitched(bool enabled),
    @required TResult clearFavoritesRequested(),
  }) {
    assert(initial != null);
    assert(nightModeSwitched != null);
    assert(autoPlaySwitched != null);
    assert(doubleTapToSeekValueChanged != null);
    assert(clearSearchHistoryRequested != null);
    assert(clearWatchHistoryRequested != null);
    assert(searchHistoryEnabledSwitched != null);
    assert(watchHistoryEnabledSwitched != null);
    assert(clearFavoritesRequested != null);
    return watchHistoryEnabledSwitched(enabled);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(
        bool isNightModeEnabled,
        bool isAutoPlatEnabled,
        int seekValue,
        bool isRecordSearchHistoryEnabled,
        bool isRecordWatchHistoryEnabled),
    TResult nightModeSwitched(bool enabled),
    TResult autoPlaySwitched(bool enabled),
    TResult doubleTapToSeekValueChanged(int value),
    TResult clearSearchHistoryRequested(),
    TResult clearWatchHistoryRequested(),
    TResult searchHistoryEnabledSwitched(bool enabled),
    TResult watchHistoryEnabledSwitched(bool enabled),
    TResult clearFavoritesRequested(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (watchHistoryEnabledSwitched != null) {
      return watchHistoryEnabledSwitched(enabled);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult nightModeSwitched(_NightModeSwitched value),
    @required TResult autoPlaySwitched(_AutoPlaySwitched value),
    @required
        TResult doubleTapToSeekValueChanged(_DoubleTapToSeekValueChanged value),
    @required
        TResult clearSearchHistoryRequested(_ClearSearchHistoryRequested value),
    @required
        TResult clearWatchHistoryRequested(_ClearWatchHistoryRequested value),
    @required
        TResult searchHistoryEnabledSwitched(
            _SearchHistoryEnabledSwitched value),
    @required
        TResult watchHistoryEnabledSwitched(_WatchHistoryEnabledSwitched value),
    @required TResult clearFavoritesRequested(_ClearFavoritesRequested value),
  }) {
    assert(initial != null);
    assert(nightModeSwitched != null);
    assert(autoPlaySwitched != null);
    assert(doubleTapToSeekValueChanged != null);
    assert(clearSearchHistoryRequested != null);
    assert(clearWatchHistoryRequested != null);
    assert(searchHistoryEnabledSwitched != null);
    assert(watchHistoryEnabledSwitched != null);
    assert(clearFavoritesRequested != null);
    return watchHistoryEnabledSwitched(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult nightModeSwitched(_NightModeSwitched value),
    TResult autoPlaySwitched(_AutoPlaySwitched value),
    TResult doubleTapToSeekValueChanged(_DoubleTapToSeekValueChanged value),
    TResult clearSearchHistoryRequested(_ClearSearchHistoryRequested value),
    TResult clearWatchHistoryRequested(_ClearWatchHistoryRequested value),
    TResult searchHistoryEnabledSwitched(_SearchHistoryEnabledSwitched value),
    TResult watchHistoryEnabledSwitched(_WatchHistoryEnabledSwitched value),
    TResult clearFavoritesRequested(_ClearFavoritesRequested value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (watchHistoryEnabledSwitched != null) {
      return watchHistoryEnabledSwitched(this);
    }
    return orElse();
  }
}

abstract class _WatchHistoryEnabledSwitched implements SettingsEvent {
  const factory _WatchHistoryEnabledSwitched({@required bool enabled}) =
      _$_WatchHistoryEnabledSwitched;

  bool get enabled;
  _$WatchHistoryEnabledSwitchedCopyWith<_WatchHistoryEnabledSwitched>
      get copyWith;
}

/// @nodoc
abstract class _$ClearFavoritesRequestedCopyWith<$Res> {
  factory _$ClearFavoritesRequestedCopyWith(_ClearFavoritesRequested value,
          $Res Function(_ClearFavoritesRequested) then) =
      __$ClearFavoritesRequestedCopyWithImpl<$Res>;
}

/// @nodoc
class __$ClearFavoritesRequestedCopyWithImpl<$Res>
    extends _$SettingsEventCopyWithImpl<$Res>
    implements _$ClearFavoritesRequestedCopyWith<$Res> {
  __$ClearFavoritesRequestedCopyWithImpl(_ClearFavoritesRequested _value,
      $Res Function(_ClearFavoritesRequested) _then)
      : super(_value, (v) => _then(v as _ClearFavoritesRequested));

  @override
  _ClearFavoritesRequested get _value =>
      super._value as _ClearFavoritesRequested;
}

/// @nodoc
class _$_ClearFavoritesRequested implements _ClearFavoritesRequested {
  const _$_ClearFavoritesRequested();

  @override
  String toString() {
    return 'SettingsEvent.clearFavoritesRequested()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _ClearFavoritesRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required
        TResult initial(
            bool isNightModeEnabled,
            bool isAutoPlatEnabled,
            int seekValue,
            bool isRecordSearchHistoryEnabled,
            bool isRecordWatchHistoryEnabled),
    @required TResult nightModeSwitched(bool enabled),
    @required TResult autoPlaySwitched(bool enabled),
    @required TResult doubleTapToSeekValueChanged(int value),
    @required TResult clearSearchHistoryRequested(),
    @required TResult clearWatchHistoryRequested(),
    @required TResult searchHistoryEnabledSwitched(bool enabled),
    @required TResult watchHistoryEnabledSwitched(bool enabled),
    @required TResult clearFavoritesRequested(),
  }) {
    assert(initial != null);
    assert(nightModeSwitched != null);
    assert(autoPlaySwitched != null);
    assert(doubleTapToSeekValueChanged != null);
    assert(clearSearchHistoryRequested != null);
    assert(clearWatchHistoryRequested != null);
    assert(searchHistoryEnabledSwitched != null);
    assert(watchHistoryEnabledSwitched != null);
    assert(clearFavoritesRequested != null);
    return clearFavoritesRequested();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(
        bool isNightModeEnabled,
        bool isAutoPlatEnabled,
        int seekValue,
        bool isRecordSearchHistoryEnabled,
        bool isRecordWatchHistoryEnabled),
    TResult nightModeSwitched(bool enabled),
    TResult autoPlaySwitched(bool enabled),
    TResult doubleTapToSeekValueChanged(int value),
    TResult clearSearchHistoryRequested(),
    TResult clearWatchHistoryRequested(),
    TResult searchHistoryEnabledSwitched(bool enabled),
    TResult watchHistoryEnabledSwitched(bool enabled),
    TResult clearFavoritesRequested(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (clearFavoritesRequested != null) {
      return clearFavoritesRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult nightModeSwitched(_NightModeSwitched value),
    @required TResult autoPlaySwitched(_AutoPlaySwitched value),
    @required
        TResult doubleTapToSeekValueChanged(_DoubleTapToSeekValueChanged value),
    @required
        TResult clearSearchHistoryRequested(_ClearSearchHistoryRequested value),
    @required
        TResult clearWatchHistoryRequested(_ClearWatchHistoryRequested value),
    @required
        TResult searchHistoryEnabledSwitched(
            _SearchHistoryEnabledSwitched value),
    @required
        TResult watchHistoryEnabledSwitched(_WatchHistoryEnabledSwitched value),
    @required TResult clearFavoritesRequested(_ClearFavoritesRequested value),
  }) {
    assert(initial != null);
    assert(nightModeSwitched != null);
    assert(autoPlaySwitched != null);
    assert(doubleTapToSeekValueChanged != null);
    assert(clearSearchHistoryRequested != null);
    assert(clearWatchHistoryRequested != null);
    assert(searchHistoryEnabledSwitched != null);
    assert(watchHistoryEnabledSwitched != null);
    assert(clearFavoritesRequested != null);
    return clearFavoritesRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult nightModeSwitched(_NightModeSwitched value),
    TResult autoPlaySwitched(_AutoPlaySwitched value),
    TResult doubleTapToSeekValueChanged(_DoubleTapToSeekValueChanged value),
    TResult clearSearchHistoryRequested(_ClearSearchHistoryRequested value),
    TResult clearWatchHistoryRequested(_ClearWatchHistoryRequested value),
    TResult searchHistoryEnabledSwitched(_SearchHistoryEnabledSwitched value),
    TResult watchHistoryEnabledSwitched(_WatchHistoryEnabledSwitched value),
    TResult clearFavoritesRequested(_ClearFavoritesRequested value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (clearFavoritesRequested != null) {
      return clearFavoritesRequested(this);
    }
    return orElse();
  }
}

abstract class _ClearFavoritesRequested implements SettingsEvent {
  const factory _ClearFavoritesRequested() = _$_ClearFavoritesRequested;
}

/// @nodoc
class _$SettingsStateTearOff {
  const _$SettingsStateTearOff();

// ignore: unused_element
  _SettingsState call(
      {@required bool nightModeEnabled,
      @required bool autoPlayEnabled,
      @required int doubleTapToSeekValue,
      @required bool recordSearchHistoryEnabled,
      @required bool recordWatchHistoryEnabled}) {
    return _SettingsState(
      nightModeEnabled: nightModeEnabled,
      autoPlayEnabled: autoPlayEnabled,
      doubleTapToSeekValue: doubleTapToSeekValue,
      recordSearchHistoryEnabled: recordSearchHistoryEnabled,
      recordWatchHistoryEnabled: recordWatchHistoryEnabled,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $SettingsState = _$SettingsStateTearOff();

/// @nodoc
mixin _$SettingsState {
  bool get nightModeEnabled;
  bool get autoPlayEnabled;
  int get doubleTapToSeekValue;
  bool get recordSearchHistoryEnabled;
  bool get recordWatchHistoryEnabled;

  $SettingsStateCopyWith<SettingsState> get copyWith;
}

/// @nodoc
abstract class $SettingsStateCopyWith<$Res> {
  factory $SettingsStateCopyWith(
          SettingsState value, $Res Function(SettingsState) then) =
      _$SettingsStateCopyWithImpl<$Res>;
  $Res call(
      {bool nightModeEnabled,
      bool autoPlayEnabled,
      int doubleTapToSeekValue,
      bool recordSearchHistoryEnabled,
      bool recordWatchHistoryEnabled});
}

/// @nodoc
class _$SettingsStateCopyWithImpl<$Res>
    implements $SettingsStateCopyWith<$Res> {
  _$SettingsStateCopyWithImpl(this._value, this._then);

  final SettingsState _value;
  // ignore: unused_field
  final $Res Function(SettingsState) _then;

  @override
  $Res call({
    Object nightModeEnabled = freezed,
    Object autoPlayEnabled = freezed,
    Object doubleTapToSeekValue = freezed,
    Object recordSearchHistoryEnabled = freezed,
    Object recordWatchHistoryEnabled = freezed,
  }) {
    return _then(_value.copyWith(
      nightModeEnabled: nightModeEnabled == freezed
          ? _value.nightModeEnabled
          : nightModeEnabled as bool,
      autoPlayEnabled: autoPlayEnabled == freezed
          ? _value.autoPlayEnabled
          : autoPlayEnabled as bool,
      doubleTapToSeekValue: doubleTapToSeekValue == freezed
          ? _value.doubleTapToSeekValue
          : doubleTapToSeekValue as int,
      recordSearchHistoryEnabled: recordSearchHistoryEnabled == freezed
          ? _value.recordSearchHistoryEnabled
          : recordSearchHistoryEnabled as bool,
      recordWatchHistoryEnabled: recordWatchHistoryEnabled == freezed
          ? _value.recordWatchHistoryEnabled
          : recordWatchHistoryEnabled as bool,
    ));
  }
}

/// @nodoc
abstract class _$SettingsStateCopyWith<$Res>
    implements $SettingsStateCopyWith<$Res> {
  factory _$SettingsStateCopyWith(
          _SettingsState value, $Res Function(_SettingsState) then) =
      __$SettingsStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool nightModeEnabled,
      bool autoPlayEnabled,
      int doubleTapToSeekValue,
      bool recordSearchHistoryEnabled,
      bool recordWatchHistoryEnabled});
}

/// @nodoc
class __$SettingsStateCopyWithImpl<$Res>
    extends _$SettingsStateCopyWithImpl<$Res>
    implements _$SettingsStateCopyWith<$Res> {
  __$SettingsStateCopyWithImpl(
      _SettingsState _value, $Res Function(_SettingsState) _then)
      : super(_value, (v) => _then(v as _SettingsState));

  @override
  _SettingsState get _value => super._value as _SettingsState;

  @override
  $Res call({
    Object nightModeEnabled = freezed,
    Object autoPlayEnabled = freezed,
    Object doubleTapToSeekValue = freezed,
    Object recordSearchHistoryEnabled = freezed,
    Object recordWatchHistoryEnabled = freezed,
  }) {
    return _then(_SettingsState(
      nightModeEnabled: nightModeEnabled == freezed
          ? _value.nightModeEnabled
          : nightModeEnabled as bool,
      autoPlayEnabled: autoPlayEnabled == freezed
          ? _value.autoPlayEnabled
          : autoPlayEnabled as bool,
      doubleTapToSeekValue: doubleTapToSeekValue == freezed
          ? _value.doubleTapToSeekValue
          : doubleTapToSeekValue as int,
      recordSearchHistoryEnabled: recordSearchHistoryEnabled == freezed
          ? _value.recordSearchHistoryEnabled
          : recordSearchHistoryEnabled as bool,
      recordWatchHistoryEnabled: recordWatchHistoryEnabled == freezed
          ? _value.recordWatchHistoryEnabled
          : recordWatchHistoryEnabled as bool,
    ));
  }
}

/// @nodoc
class _$_SettingsState implements _SettingsState {
  const _$_SettingsState(
      {@required this.nightModeEnabled,
      @required this.autoPlayEnabled,
      @required this.doubleTapToSeekValue,
      @required this.recordSearchHistoryEnabled,
      @required this.recordWatchHistoryEnabled})
      : assert(nightModeEnabled != null),
        assert(autoPlayEnabled != null),
        assert(doubleTapToSeekValue != null),
        assert(recordSearchHistoryEnabled != null),
        assert(recordWatchHistoryEnabled != null);

  @override
  final bool nightModeEnabled;
  @override
  final bool autoPlayEnabled;
  @override
  final int doubleTapToSeekValue;
  @override
  final bool recordSearchHistoryEnabled;
  @override
  final bool recordWatchHistoryEnabled;

  @override
  String toString() {
    return 'SettingsState(nightModeEnabled: $nightModeEnabled, autoPlayEnabled: $autoPlayEnabled, doubleTapToSeekValue: $doubleTapToSeekValue, recordSearchHistoryEnabled: $recordSearchHistoryEnabled, recordWatchHistoryEnabled: $recordWatchHistoryEnabled)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SettingsState &&
            (identical(other.nightModeEnabled, nightModeEnabled) ||
                const DeepCollectionEquality()
                    .equals(other.nightModeEnabled, nightModeEnabled)) &&
            (identical(other.autoPlayEnabled, autoPlayEnabled) ||
                const DeepCollectionEquality()
                    .equals(other.autoPlayEnabled, autoPlayEnabled)) &&
            (identical(other.doubleTapToSeekValue, doubleTapToSeekValue) ||
                const DeepCollectionEquality().equals(
                    other.doubleTapToSeekValue, doubleTapToSeekValue)) &&
            (identical(other.recordSearchHistoryEnabled,
                    recordSearchHistoryEnabled) ||
                const DeepCollectionEquality().equals(
                    other.recordSearchHistoryEnabled,
                    recordSearchHistoryEnabled)) &&
            (identical(other.recordWatchHistoryEnabled,
                    recordWatchHistoryEnabled) ||
                const DeepCollectionEquality().equals(
                    other.recordWatchHistoryEnabled,
                    recordWatchHistoryEnabled)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(nightModeEnabled) ^
      const DeepCollectionEquality().hash(autoPlayEnabled) ^
      const DeepCollectionEquality().hash(doubleTapToSeekValue) ^
      const DeepCollectionEquality().hash(recordSearchHistoryEnabled) ^
      const DeepCollectionEquality().hash(recordWatchHistoryEnabled);

  @override
  _$SettingsStateCopyWith<_SettingsState> get copyWith =>
      __$SettingsStateCopyWithImpl<_SettingsState>(this, _$identity);
}

abstract class _SettingsState implements SettingsState {
  const factory _SettingsState(
      {@required bool nightModeEnabled,
      @required bool autoPlayEnabled,
      @required int doubleTapToSeekValue,
      @required bool recordSearchHistoryEnabled,
      @required bool recordWatchHistoryEnabled}) = _$_SettingsState;

  @override
  bool get nightModeEnabled;
  @override
  bool get autoPlayEnabled;
  @override
  int get doubleTapToSeekValue;
  @override
  bool get recordSearchHistoryEnabled;
  @override
  bool get recordWatchHistoryEnabled;
  @override
  _$SettingsStateCopyWith<_SettingsState> get copyWith;
}
