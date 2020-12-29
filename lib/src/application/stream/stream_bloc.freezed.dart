// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'stream_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$StreamEventTearOff {
  const _$StreamEventTearOff();

// ignore: unused_element
  _SettingsFetched settingsFetched(StreamSettings settings) {
    return _SettingsFetched(
      settings,
    );
  }

// ignore: unused_element
  _SeasonChanged seasonChanged(int season) {
    return _SeasonChanged(
      season,
    );
  }

// ignore: unused_element
  _EpisodeChanged episodeChanged(int episode) {
    return _EpisodeChanged(
      episode,
    );
  }

// ignore: unused_element
  _LanguageChanged languageChanged(Language language) {
    return _LanguageChanged(
      language,
    );
  }

// ignore: unused_element
  _QualityChanged qualityChanged(Quality quality) {
    return _QualityChanged(
      quality,
    );
  }

// ignore: unused_element
  _FetchRelatedRequested fetchRelatedRequested() {
    return const _FetchRelatedRequested();
  }

// ignore: unused_element
  _StartPositionChanged startPositionChanged(Duration position) {
    return _StartPositionChanged(
      position,
    );
  }

// ignore: unused_element
  _OnPositionTick onPositionTick(Duration position) {
    return _OnPositionTick(
      position,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $StreamEvent = _$StreamEventTearOff();

/// @nodoc
mixin _$StreamEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult settingsFetched(StreamSettings settings),
    @required TResult seasonChanged(int season),
    @required TResult episodeChanged(int episode),
    @required TResult languageChanged(Language language),
    @required TResult qualityChanged(Quality quality),
    @required TResult fetchRelatedRequested(),
    @required TResult startPositionChanged(Duration position),
    @required TResult onPositionTick(Duration position),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult settingsFetched(StreamSettings settings),
    TResult seasonChanged(int season),
    TResult episodeChanged(int episode),
    TResult languageChanged(Language language),
    TResult qualityChanged(Quality quality),
    TResult fetchRelatedRequested(),
    TResult startPositionChanged(Duration position),
    TResult onPositionTick(Duration position),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult settingsFetched(_SettingsFetched value),
    @required TResult seasonChanged(_SeasonChanged value),
    @required TResult episodeChanged(_EpisodeChanged value),
    @required TResult languageChanged(_LanguageChanged value),
    @required TResult qualityChanged(_QualityChanged value),
    @required TResult fetchRelatedRequested(_FetchRelatedRequested value),
    @required TResult startPositionChanged(_StartPositionChanged value),
    @required TResult onPositionTick(_OnPositionTick value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult settingsFetched(_SettingsFetched value),
    TResult seasonChanged(_SeasonChanged value),
    TResult episodeChanged(_EpisodeChanged value),
    TResult languageChanged(_LanguageChanged value),
    TResult qualityChanged(_QualityChanged value),
    TResult fetchRelatedRequested(_FetchRelatedRequested value),
    TResult startPositionChanged(_StartPositionChanged value),
    TResult onPositionTick(_OnPositionTick value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $StreamEventCopyWith<$Res> {
  factory $StreamEventCopyWith(
          StreamEvent value, $Res Function(StreamEvent) then) =
      _$StreamEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$StreamEventCopyWithImpl<$Res> implements $StreamEventCopyWith<$Res> {
  _$StreamEventCopyWithImpl(this._value, this._then);

  final StreamEvent _value;
  // ignore: unused_field
  final $Res Function(StreamEvent) _then;
}

/// @nodoc
abstract class _$SettingsFetchedCopyWith<$Res> {
  factory _$SettingsFetchedCopyWith(
          _SettingsFetched value, $Res Function(_SettingsFetched) then) =
      __$SettingsFetchedCopyWithImpl<$Res>;
  $Res call({StreamSettings settings});
}

/// @nodoc
class __$SettingsFetchedCopyWithImpl<$Res>
    extends _$StreamEventCopyWithImpl<$Res>
    implements _$SettingsFetchedCopyWith<$Res> {
  __$SettingsFetchedCopyWithImpl(
      _SettingsFetched _value, $Res Function(_SettingsFetched) _then)
      : super(_value, (v) => _then(v as _SettingsFetched));

  @override
  _SettingsFetched get _value => super._value as _SettingsFetched;

  @override
  $Res call({
    Object settings = freezed,
  }) {
    return _then(_SettingsFetched(
      settings == freezed ? _value.settings : settings as StreamSettings,
    ));
  }
}

/// @nodoc
class _$_SettingsFetched
    with DiagnosticableTreeMixin
    implements _SettingsFetched {
  const _$_SettingsFetched(this.settings) : assert(settings != null);

  @override
  final StreamSettings settings;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StreamEvent.settingsFetched(settings: $settings)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StreamEvent.settingsFetched'))
      ..add(DiagnosticsProperty('settings', settings));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SettingsFetched &&
            (identical(other.settings, settings) ||
                const DeepCollectionEquality()
                    .equals(other.settings, settings)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(settings);

  @override
  _$SettingsFetchedCopyWith<_SettingsFetched> get copyWith =>
      __$SettingsFetchedCopyWithImpl<_SettingsFetched>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult settingsFetched(StreamSettings settings),
    @required TResult seasonChanged(int season),
    @required TResult episodeChanged(int episode),
    @required TResult languageChanged(Language language),
    @required TResult qualityChanged(Quality quality),
    @required TResult fetchRelatedRequested(),
    @required TResult startPositionChanged(Duration position),
    @required TResult onPositionTick(Duration position),
  }) {
    assert(settingsFetched != null);
    assert(seasonChanged != null);
    assert(episodeChanged != null);
    assert(languageChanged != null);
    assert(qualityChanged != null);
    assert(fetchRelatedRequested != null);
    assert(startPositionChanged != null);
    assert(onPositionTick != null);
    return settingsFetched(settings);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult settingsFetched(StreamSettings settings),
    TResult seasonChanged(int season),
    TResult episodeChanged(int episode),
    TResult languageChanged(Language language),
    TResult qualityChanged(Quality quality),
    TResult fetchRelatedRequested(),
    TResult startPositionChanged(Duration position),
    TResult onPositionTick(Duration position),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (settingsFetched != null) {
      return settingsFetched(settings);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult settingsFetched(_SettingsFetched value),
    @required TResult seasonChanged(_SeasonChanged value),
    @required TResult episodeChanged(_EpisodeChanged value),
    @required TResult languageChanged(_LanguageChanged value),
    @required TResult qualityChanged(_QualityChanged value),
    @required TResult fetchRelatedRequested(_FetchRelatedRequested value),
    @required TResult startPositionChanged(_StartPositionChanged value),
    @required TResult onPositionTick(_OnPositionTick value),
  }) {
    assert(settingsFetched != null);
    assert(seasonChanged != null);
    assert(episodeChanged != null);
    assert(languageChanged != null);
    assert(qualityChanged != null);
    assert(fetchRelatedRequested != null);
    assert(startPositionChanged != null);
    assert(onPositionTick != null);
    return settingsFetched(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult settingsFetched(_SettingsFetched value),
    TResult seasonChanged(_SeasonChanged value),
    TResult episodeChanged(_EpisodeChanged value),
    TResult languageChanged(_LanguageChanged value),
    TResult qualityChanged(_QualityChanged value),
    TResult fetchRelatedRequested(_FetchRelatedRequested value),
    TResult startPositionChanged(_StartPositionChanged value),
    TResult onPositionTick(_OnPositionTick value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (settingsFetched != null) {
      return settingsFetched(this);
    }
    return orElse();
  }
}

abstract class _SettingsFetched implements StreamEvent {
  const factory _SettingsFetched(StreamSettings settings) = _$_SettingsFetched;

  StreamSettings get settings;
  _$SettingsFetchedCopyWith<_SettingsFetched> get copyWith;
}

/// @nodoc
abstract class _$SeasonChangedCopyWith<$Res> {
  factory _$SeasonChangedCopyWith(
          _SeasonChanged value, $Res Function(_SeasonChanged) then) =
      __$SeasonChangedCopyWithImpl<$Res>;
  $Res call({int season});
}

/// @nodoc
class __$SeasonChangedCopyWithImpl<$Res> extends _$StreamEventCopyWithImpl<$Res>
    implements _$SeasonChangedCopyWith<$Res> {
  __$SeasonChangedCopyWithImpl(
      _SeasonChanged _value, $Res Function(_SeasonChanged) _then)
      : super(_value, (v) => _then(v as _SeasonChanged));

  @override
  _SeasonChanged get _value => super._value as _SeasonChanged;

  @override
  $Res call({
    Object season = freezed,
  }) {
    return _then(_SeasonChanged(
      season == freezed ? _value.season : season as int,
    ));
  }
}

/// @nodoc
class _$_SeasonChanged with DiagnosticableTreeMixin implements _SeasonChanged {
  const _$_SeasonChanged(this.season) : assert(season != null);

  @override
  final int season;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StreamEvent.seasonChanged(season: $season)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StreamEvent.seasonChanged'))
      ..add(DiagnosticsProperty('season', season));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SeasonChanged &&
            (identical(other.season, season) ||
                const DeepCollectionEquality().equals(other.season, season)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(season);

  @override
  _$SeasonChangedCopyWith<_SeasonChanged> get copyWith =>
      __$SeasonChangedCopyWithImpl<_SeasonChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult settingsFetched(StreamSettings settings),
    @required TResult seasonChanged(int season),
    @required TResult episodeChanged(int episode),
    @required TResult languageChanged(Language language),
    @required TResult qualityChanged(Quality quality),
    @required TResult fetchRelatedRequested(),
    @required TResult startPositionChanged(Duration position),
    @required TResult onPositionTick(Duration position),
  }) {
    assert(settingsFetched != null);
    assert(seasonChanged != null);
    assert(episodeChanged != null);
    assert(languageChanged != null);
    assert(qualityChanged != null);
    assert(fetchRelatedRequested != null);
    assert(startPositionChanged != null);
    assert(onPositionTick != null);
    return seasonChanged(season);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult settingsFetched(StreamSettings settings),
    TResult seasonChanged(int season),
    TResult episodeChanged(int episode),
    TResult languageChanged(Language language),
    TResult qualityChanged(Quality quality),
    TResult fetchRelatedRequested(),
    TResult startPositionChanged(Duration position),
    TResult onPositionTick(Duration position),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (seasonChanged != null) {
      return seasonChanged(season);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult settingsFetched(_SettingsFetched value),
    @required TResult seasonChanged(_SeasonChanged value),
    @required TResult episodeChanged(_EpisodeChanged value),
    @required TResult languageChanged(_LanguageChanged value),
    @required TResult qualityChanged(_QualityChanged value),
    @required TResult fetchRelatedRequested(_FetchRelatedRequested value),
    @required TResult startPositionChanged(_StartPositionChanged value),
    @required TResult onPositionTick(_OnPositionTick value),
  }) {
    assert(settingsFetched != null);
    assert(seasonChanged != null);
    assert(episodeChanged != null);
    assert(languageChanged != null);
    assert(qualityChanged != null);
    assert(fetchRelatedRequested != null);
    assert(startPositionChanged != null);
    assert(onPositionTick != null);
    return seasonChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult settingsFetched(_SettingsFetched value),
    TResult seasonChanged(_SeasonChanged value),
    TResult episodeChanged(_EpisodeChanged value),
    TResult languageChanged(_LanguageChanged value),
    TResult qualityChanged(_QualityChanged value),
    TResult fetchRelatedRequested(_FetchRelatedRequested value),
    TResult startPositionChanged(_StartPositionChanged value),
    TResult onPositionTick(_OnPositionTick value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (seasonChanged != null) {
      return seasonChanged(this);
    }
    return orElse();
  }
}

abstract class _SeasonChanged implements StreamEvent {
  const factory _SeasonChanged(int season) = _$_SeasonChanged;

  int get season;
  _$SeasonChangedCopyWith<_SeasonChanged> get copyWith;
}

/// @nodoc
abstract class _$EpisodeChangedCopyWith<$Res> {
  factory _$EpisodeChangedCopyWith(
          _EpisodeChanged value, $Res Function(_EpisodeChanged) then) =
      __$EpisodeChangedCopyWithImpl<$Res>;
  $Res call({int episode});
}

/// @nodoc
class __$EpisodeChangedCopyWithImpl<$Res>
    extends _$StreamEventCopyWithImpl<$Res>
    implements _$EpisodeChangedCopyWith<$Res> {
  __$EpisodeChangedCopyWithImpl(
      _EpisodeChanged _value, $Res Function(_EpisodeChanged) _then)
      : super(_value, (v) => _then(v as _EpisodeChanged));

  @override
  _EpisodeChanged get _value => super._value as _EpisodeChanged;

  @override
  $Res call({
    Object episode = freezed,
  }) {
    return _then(_EpisodeChanged(
      episode == freezed ? _value.episode : episode as int,
    ));
  }
}

/// @nodoc
class _$_EpisodeChanged
    with DiagnosticableTreeMixin
    implements _EpisodeChanged {
  const _$_EpisodeChanged(this.episode) : assert(episode != null);

  @override
  final int episode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StreamEvent.episodeChanged(episode: $episode)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StreamEvent.episodeChanged'))
      ..add(DiagnosticsProperty('episode', episode));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _EpisodeChanged &&
            (identical(other.episode, episode) ||
                const DeepCollectionEquality().equals(other.episode, episode)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(episode);

  @override
  _$EpisodeChangedCopyWith<_EpisodeChanged> get copyWith =>
      __$EpisodeChangedCopyWithImpl<_EpisodeChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult settingsFetched(StreamSettings settings),
    @required TResult seasonChanged(int season),
    @required TResult episodeChanged(int episode),
    @required TResult languageChanged(Language language),
    @required TResult qualityChanged(Quality quality),
    @required TResult fetchRelatedRequested(),
    @required TResult startPositionChanged(Duration position),
    @required TResult onPositionTick(Duration position),
  }) {
    assert(settingsFetched != null);
    assert(seasonChanged != null);
    assert(episodeChanged != null);
    assert(languageChanged != null);
    assert(qualityChanged != null);
    assert(fetchRelatedRequested != null);
    assert(startPositionChanged != null);
    assert(onPositionTick != null);
    return episodeChanged(episode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult settingsFetched(StreamSettings settings),
    TResult seasonChanged(int season),
    TResult episodeChanged(int episode),
    TResult languageChanged(Language language),
    TResult qualityChanged(Quality quality),
    TResult fetchRelatedRequested(),
    TResult startPositionChanged(Duration position),
    TResult onPositionTick(Duration position),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (episodeChanged != null) {
      return episodeChanged(episode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult settingsFetched(_SettingsFetched value),
    @required TResult seasonChanged(_SeasonChanged value),
    @required TResult episodeChanged(_EpisodeChanged value),
    @required TResult languageChanged(_LanguageChanged value),
    @required TResult qualityChanged(_QualityChanged value),
    @required TResult fetchRelatedRequested(_FetchRelatedRequested value),
    @required TResult startPositionChanged(_StartPositionChanged value),
    @required TResult onPositionTick(_OnPositionTick value),
  }) {
    assert(settingsFetched != null);
    assert(seasonChanged != null);
    assert(episodeChanged != null);
    assert(languageChanged != null);
    assert(qualityChanged != null);
    assert(fetchRelatedRequested != null);
    assert(startPositionChanged != null);
    assert(onPositionTick != null);
    return episodeChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult settingsFetched(_SettingsFetched value),
    TResult seasonChanged(_SeasonChanged value),
    TResult episodeChanged(_EpisodeChanged value),
    TResult languageChanged(_LanguageChanged value),
    TResult qualityChanged(_QualityChanged value),
    TResult fetchRelatedRequested(_FetchRelatedRequested value),
    TResult startPositionChanged(_StartPositionChanged value),
    TResult onPositionTick(_OnPositionTick value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (episodeChanged != null) {
      return episodeChanged(this);
    }
    return orElse();
  }
}

abstract class _EpisodeChanged implements StreamEvent {
  const factory _EpisodeChanged(int episode) = _$_EpisodeChanged;

  int get episode;
  _$EpisodeChangedCopyWith<_EpisodeChanged> get copyWith;
}

/// @nodoc
abstract class _$LanguageChangedCopyWith<$Res> {
  factory _$LanguageChangedCopyWith(
          _LanguageChanged value, $Res Function(_LanguageChanged) then) =
      __$LanguageChangedCopyWithImpl<$Res>;
  $Res call({Language language});
}

/// @nodoc
class __$LanguageChangedCopyWithImpl<$Res>
    extends _$StreamEventCopyWithImpl<$Res>
    implements _$LanguageChangedCopyWith<$Res> {
  __$LanguageChangedCopyWithImpl(
      _LanguageChanged _value, $Res Function(_LanguageChanged) _then)
      : super(_value, (v) => _then(v as _LanguageChanged));

  @override
  _LanguageChanged get _value => super._value as _LanguageChanged;

  @override
  $Res call({
    Object language = freezed,
  }) {
    return _then(_LanguageChanged(
      language == freezed ? _value.language : language as Language,
    ));
  }
}

/// @nodoc
class _$_LanguageChanged
    with DiagnosticableTreeMixin
    implements _LanguageChanged {
  const _$_LanguageChanged(this.language) : assert(language != null);

  @override
  final Language language;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StreamEvent.languageChanged(language: $language)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StreamEvent.languageChanged'))
      ..add(DiagnosticsProperty('language', language));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LanguageChanged &&
            (identical(other.language, language) ||
                const DeepCollectionEquality()
                    .equals(other.language, language)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(language);

  @override
  _$LanguageChangedCopyWith<_LanguageChanged> get copyWith =>
      __$LanguageChangedCopyWithImpl<_LanguageChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult settingsFetched(StreamSettings settings),
    @required TResult seasonChanged(int season),
    @required TResult episodeChanged(int episode),
    @required TResult languageChanged(Language language),
    @required TResult qualityChanged(Quality quality),
    @required TResult fetchRelatedRequested(),
    @required TResult startPositionChanged(Duration position),
    @required TResult onPositionTick(Duration position),
  }) {
    assert(settingsFetched != null);
    assert(seasonChanged != null);
    assert(episodeChanged != null);
    assert(languageChanged != null);
    assert(qualityChanged != null);
    assert(fetchRelatedRequested != null);
    assert(startPositionChanged != null);
    assert(onPositionTick != null);
    return languageChanged(language);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult settingsFetched(StreamSettings settings),
    TResult seasonChanged(int season),
    TResult episodeChanged(int episode),
    TResult languageChanged(Language language),
    TResult qualityChanged(Quality quality),
    TResult fetchRelatedRequested(),
    TResult startPositionChanged(Duration position),
    TResult onPositionTick(Duration position),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (languageChanged != null) {
      return languageChanged(language);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult settingsFetched(_SettingsFetched value),
    @required TResult seasonChanged(_SeasonChanged value),
    @required TResult episodeChanged(_EpisodeChanged value),
    @required TResult languageChanged(_LanguageChanged value),
    @required TResult qualityChanged(_QualityChanged value),
    @required TResult fetchRelatedRequested(_FetchRelatedRequested value),
    @required TResult startPositionChanged(_StartPositionChanged value),
    @required TResult onPositionTick(_OnPositionTick value),
  }) {
    assert(settingsFetched != null);
    assert(seasonChanged != null);
    assert(episodeChanged != null);
    assert(languageChanged != null);
    assert(qualityChanged != null);
    assert(fetchRelatedRequested != null);
    assert(startPositionChanged != null);
    assert(onPositionTick != null);
    return languageChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult settingsFetched(_SettingsFetched value),
    TResult seasonChanged(_SeasonChanged value),
    TResult episodeChanged(_EpisodeChanged value),
    TResult languageChanged(_LanguageChanged value),
    TResult qualityChanged(_QualityChanged value),
    TResult fetchRelatedRequested(_FetchRelatedRequested value),
    TResult startPositionChanged(_StartPositionChanged value),
    TResult onPositionTick(_OnPositionTick value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (languageChanged != null) {
      return languageChanged(this);
    }
    return orElse();
  }
}

abstract class _LanguageChanged implements StreamEvent {
  const factory _LanguageChanged(Language language) = _$_LanguageChanged;

  Language get language;
  _$LanguageChangedCopyWith<_LanguageChanged> get copyWith;
}

/// @nodoc
abstract class _$QualityChangedCopyWith<$Res> {
  factory _$QualityChangedCopyWith(
          _QualityChanged value, $Res Function(_QualityChanged) then) =
      __$QualityChangedCopyWithImpl<$Res>;
  $Res call({Quality quality});
}

/// @nodoc
class __$QualityChangedCopyWithImpl<$Res>
    extends _$StreamEventCopyWithImpl<$Res>
    implements _$QualityChangedCopyWith<$Res> {
  __$QualityChangedCopyWithImpl(
      _QualityChanged _value, $Res Function(_QualityChanged) _then)
      : super(_value, (v) => _then(v as _QualityChanged));

  @override
  _QualityChanged get _value => super._value as _QualityChanged;

  @override
  $Res call({
    Object quality = freezed,
  }) {
    return _then(_QualityChanged(
      quality == freezed ? _value.quality : quality as Quality,
    ));
  }
}

/// @nodoc
class _$_QualityChanged
    with DiagnosticableTreeMixin
    implements _QualityChanged {
  const _$_QualityChanged(this.quality) : assert(quality != null);

  @override
  final Quality quality;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StreamEvent.qualityChanged(quality: $quality)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StreamEvent.qualityChanged'))
      ..add(DiagnosticsProperty('quality', quality));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _QualityChanged &&
            (identical(other.quality, quality) ||
                const DeepCollectionEquality().equals(other.quality, quality)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(quality);

  @override
  _$QualityChangedCopyWith<_QualityChanged> get copyWith =>
      __$QualityChangedCopyWithImpl<_QualityChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult settingsFetched(StreamSettings settings),
    @required TResult seasonChanged(int season),
    @required TResult episodeChanged(int episode),
    @required TResult languageChanged(Language language),
    @required TResult qualityChanged(Quality quality),
    @required TResult fetchRelatedRequested(),
    @required TResult startPositionChanged(Duration position),
    @required TResult onPositionTick(Duration position),
  }) {
    assert(settingsFetched != null);
    assert(seasonChanged != null);
    assert(episodeChanged != null);
    assert(languageChanged != null);
    assert(qualityChanged != null);
    assert(fetchRelatedRequested != null);
    assert(startPositionChanged != null);
    assert(onPositionTick != null);
    return qualityChanged(quality);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult settingsFetched(StreamSettings settings),
    TResult seasonChanged(int season),
    TResult episodeChanged(int episode),
    TResult languageChanged(Language language),
    TResult qualityChanged(Quality quality),
    TResult fetchRelatedRequested(),
    TResult startPositionChanged(Duration position),
    TResult onPositionTick(Duration position),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (qualityChanged != null) {
      return qualityChanged(quality);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult settingsFetched(_SettingsFetched value),
    @required TResult seasonChanged(_SeasonChanged value),
    @required TResult episodeChanged(_EpisodeChanged value),
    @required TResult languageChanged(_LanguageChanged value),
    @required TResult qualityChanged(_QualityChanged value),
    @required TResult fetchRelatedRequested(_FetchRelatedRequested value),
    @required TResult startPositionChanged(_StartPositionChanged value),
    @required TResult onPositionTick(_OnPositionTick value),
  }) {
    assert(settingsFetched != null);
    assert(seasonChanged != null);
    assert(episodeChanged != null);
    assert(languageChanged != null);
    assert(qualityChanged != null);
    assert(fetchRelatedRequested != null);
    assert(startPositionChanged != null);
    assert(onPositionTick != null);
    return qualityChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult settingsFetched(_SettingsFetched value),
    TResult seasonChanged(_SeasonChanged value),
    TResult episodeChanged(_EpisodeChanged value),
    TResult languageChanged(_LanguageChanged value),
    TResult qualityChanged(_QualityChanged value),
    TResult fetchRelatedRequested(_FetchRelatedRequested value),
    TResult startPositionChanged(_StartPositionChanged value),
    TResult onPositionTick(_OnPositionTick value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (qualityChanged != null) {
      return qualityChanged(this);
    }
    return orElse();
  }
}

abstract class _QualityChanged implements StreamEvent {
  const factory _QualityChanged(Quality quality) = _$_QualityChanged;

  Quality get quality;
  _$QualityChangedCopyWith<_QualityChanged> get copyWith;
}

/// @nodoc
abstract class _$FetchRelatedRequestedCopyWith<$Res> {
  factory _$FetchRelatedRequestedCopyWith(_FetchRelatedRequested value,
          $Res Function(_FetchRelatedRequested) then) =
      __$FetchRelatedRequestedCopyWithImpl<$Res>;
}

/// @nodoc
class __$FetchRelatedRequestedCopyWithImpl<$Res>
    extends _$StreamEventCopyWithImpl<$Res>
    implements _$FetchRelatedRequestedCopyWith<$Res> {
  __$FetchRelatedRequestedCopyWithImpl(_FetchRelatedRequested _value,
      $Res Function(_FetchRelatedRequested) _then)
      : super(_value, (v) => _then(v as _FetchRelatedRequested));

  @override
  _FetchRelatedRequested get _value => super._value as _FetchRelatedRequested;
}

/// @nodoc
class _$_FetchRelatedRequested
    with DiagnosticableTreeMixin
    implements _FetchRelatedRequested {
  const _$_FetchRelatedRequested();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StreamEvent.fetchRelatedRequested()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StreamEvent.fetchRelatedRequested'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _FetchRelatedRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult settingsFetched(StreamSettings settings),
    @required TResult seasonChanged(int season),
    @required TResult episodeChanged(int episode),
    @required TResult languageChanged(Language language),
    @required TResult qualityChanged(Quality quality),
    @required TResult fetchRelatedRequested(),
    @required TResult startPositionChanged(Duration position),
    @required TResult onPositionTick(Duration position),
  }) {
    assert(settingsFetched != null);
    assert(seasonChanged != null);
    assert(episodeChanged != null);
    assert(languageChanged != null);
    assert(qualityChanged != null);
    assert(fetchRelatedRequested != null);
    assert(startPositionChanged != null);
    assert(onPositionTick != null);
    return fetchRelatedRequested();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult settingsFetched(StreamSettings settings),
    TResult seasonChanged(int season),
    TResult episodeChanged(int episode),
    TResult languageChanged(Language language),
    TResult qualityChanged(Quality quality),
    TResult fetchRelatedRequested(),
    TResult startPositionChanged(Duration position),
    TResult onPositionTick(Duration position),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (fetchRelatedRequested != null) {
      return fetchRelatedRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult settingsFetched(_SettingsFetched value),
    @required TResult seasonChanged(_SeasonChanged value),
    @required TResult episodeChanged(_EpisodeChanged value),
    @required TResult languageChanged(_LanguageChanged value),
    @required TResult qualityChanged(_QualityChanged value),
    @required TResult fetchRelatedRequested(_FetchRelatedRequested value),
    @required TResult startPositionChanged(_StartPositionChanged value),
    @required TResult onPositionTick(_OnPositionTick value),
  }) {
    assert(settingsFetched != null);
    assert(seasonChanged != null);
    assert(episodeChanged != null);
    assert(languageChanged != null);
    assert(qualityChanged != null);
    assert(fetchRelatedRequested != null);
    assert(startPositionChanged != null);
    assert(onPositionTick != null);
    return fetchRelatedRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult settingsFetched(_SettingsFetched value),
    TResult seasonChanged(_SeasonChanged value),
    TResult episodeChanged(_EpisodeChanged value),
    TResult languageChanged(_LanguageChanged value),
    TResult qualityChanged(_QualityChanged value),
    TResult fetchRelatedRequested(_FetchRelatedRequested value),
    TResult startPositionChanged(_StartPositionChanged value),
    TResult onPositionTick(_OnPositionTick value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (fetchRelatedRequested != null) {
      return fetchRelatedRequested(this);
    }
    return orElse();
  }
}

abstract class _FetchRelatedRequested implements StreamEvent {
  const factory _FetchRelatedRequested() = _$_FetchRelatedRequested;
}

/// @nodoc
abstract class _$StartPositionChangedCopyWith<$Res> {
  factory _$StartPositionChangedCopyWith(_StartPositionChanged value,
          $Res Function(_StartPositionChanged) then) =
      __$StartPositionChangedCopyWithImpl<$Res>;
  $Res call({Duration position});
}

/// @nodoc
class __$StartPositionChangedCopyWithImpl<$Res>
    extends _$StreamEventCopyWithImpl<$Res>
    implements _$StartPositionChangedCopyWith<$Res> {
  __$StartPositionChangedCopyWithImpl(
      _StartPositionChanged _value, $Res Function(_StartPositionChanged) _then)
      : super(_value, (v) => _then(v as _StartPositionChanged));

  @override
  _StartPositionChanged get _value => super._value as _StartPositionChanged;

  @override
  $Res call({
    Object position = freezed,
  }) {
    return _then(_StartPositionChanged(
      position == freezed ? _value.position : position as Duration,
    ));
  }
}

/// @nodoc
class _$_StartPositionChanged
    with DiagnosticableTreeMixin
    implements _StartPositionChanged {
  const _$_StartPositionChanged(this.position) : assert(position != null);

  @override
  final Duration position;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StreamEvent.startPositionChanged(position: $position)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StreamEvent.startPositionChanged'))
      ..add(DiagnosticsProperty('position', position));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _StartPositionChanged &&
            (identical(other.position, position) ||
                const DeepCollectionEquality()
                    .equals(other.position, position)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(position);

  @override
  _$StartPositionChangedCopyWith<_StartPositionChanged> get copyWith =>
      __$StartPositionChangedCopyWithImpl<_StartPositionChanged>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult settingsFetched(StreamSettings settings),
    @required TResult seasonChanged(int season),
    @required TResult episodeChanged(int episode),
    @required TResult languageChanged(Language language),
    @required TResult qualityChanged(Quality quality),
    @required TResult fetchRelatedRequested(),
    @required TResult startPositionChanged(Duration position),
    @required TResult onPositionTick(Duration position),
  }) {
    assert(settingsFetched != null);
    assert(seasonChanged != null);
    assert(episodeChanged != null);
    assert(languageChanged != null);
    assert(qualityChanged != null);
    assert(fetchRelatedRequested != null);
    assert(startPositionChanged != null);
    assert(onPositionTick != null);
    return startPositionChanged(position);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult settingsFetched(StreamSettings settings),
    TResult seasonChanged(int season),
    TResult episodeChanged(int episode),
    TResult languageChanged(Language language),
    TResult qualityChanged(Quality quality),
    TResult fetchRelatedRequested(),
    TResult startPositionChanged(Duration position),
    TResult onPositionTick(Duration position),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (startPositionChanged != null) {
      return startPositionChanged(position);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult settingsFetched(_SettingsFetched value),
    @required TResult seasonChanged(_SeasonChanged value),
    @required TResult episodeChanged(_EpisodeChanged value),
    @required TResult languageChanged(_LanguageChanged value),
    @required TResult qualityChanged(_QualityChanged value),
    @required TResult fetchRelatedRequested(_FetchRelatedRequested value),
    @required TResult startPositionChanged(_StartPositionChanged value),
    @required TResult onPositionTick(_OnPositionTick value),
  }) {
    assert(settingsFetched != null);
    assert(seasonChanged != null);
    assert(episodeChanged != null);
    assert(languageChanged != null);
    assert(qualityChanged != null);
    assert(fetchRelatedRequested != null);
    assert(startPositionChanged != null);
    assert(onPositionTick != null);
    return startPositionChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult settingsFetched(_SettingsFetched value),
    TResult seasonChanged(_SeasonChanged value),
    TResult episodeChanged(_EpisodeChanged value),
    TResult languageChanged(_LanguageChanged value),
    TResult qualityChanged(_QualityChanged value),
    TResult fetchRelatedRequested(_FetchRelatedRequested value),
    TResult startPositionChanged(_StartPositionChanged value),
    TResult onPositionTick(_OnPositionTick value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (startPositionChanged != null) {
      return startPositionChanged(this);
    }
    return orElse();
  }
}

abstract class _StartPositionChanged implements StreamEvent {
  const factory _StartPositionChanged(Duration position) =
      _$_StartPositionChanged;

  Duration get position;
  _$StartPositionChangedCopyWith<_StartPositionChanged> get copyWith;
}

/// @nodoc
abstract class _$OnPositionTickCopyWith<$Res> {
  factory _$OnPositionTickCopyWith(
          _OnPositionTick value, $Res Function(_OnPositionTick) then) =
      __$OnPositionTickCopyWithImpl<$Res>;
  $Res call({Duration position});
}

/// @nodoc
class __$OnPositionTickCopyWithImpl<$Res>
    extends _$StreamEventCopyWithImpl<$Res>
    implements _$OnPositionTickCopyWith<$Res> {
  __$OnPositionTickCopyWithImpl(
      _OnPositionTick _value, $Res Function(_OnPositionTick) _then)
      : super(_value, (v) => _then(v as _OnPositionTick));

  @override
  _OnPositionTick get _value => super._value as _OnPositionTick;

  @override
  $Res call({
    Object position = freezed,
  }) {
    return _then(_OnPositionTick(
      position == freezed ? _value.position : position as Duration,
    ));
  }
}

/// @nodoc
class _$_OnPositionTick
    with DiagnosticableTreeMixin
    implements _OnPositionTick {
  const _$_OnPositionTick(this.position) : assert(position != null);

  @override
  final Duration position;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StreamEvent.onPositionTick(position: $position)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StreamEvent.onPositionTick'))
      ..add(DiagnosticsProperty('position', position));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _OnPositionTick &&
            (identical(other.position, position) ||
                const DeepCollectionEquality()
                    .equals(other.position, position)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(position);

  @override
  _$OnPositionTickCopyWith<_OnPositionTick> get copyWith =>
      __$OnPositionTickCopyWithImpl<_OnPositionTick>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult settingsFetched(StreamSettings settings),
    @required TResult seasonChanged(int season),
    @required TResult episodeChanged(int episode),
    @required TResult languageChanged(Language language),
    @required TResult qualityChanged(Quality quality),
    @required TResult fetchRelatedRequested(),
    @required TResult startPositionChanged(Duration position),
    @required TResult onPositionTick(Duration position),
  }) {
    assert(settingsFetched != null);
    assert(seasonChanged != null);
    assert(episodeChanged != null);
    assert(languageChanged != null);
    assert(qualityChanged != null);
    assert(fetchRelatedRequested != null);
    assert(startPositionChanged != null);
    assert(onPositionTick != null);
    return onPositionTick(position);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult settingsFetched(StreamSettings settings),
    TResult seasonChanged(int season),
    TResult episodeChanged(int episode),
    TResult languageChanged(Language language),
    TResult qualityChanged(Quality quality),
    TResult fetchRelatedRequested(),
    TResult startPositionChanged(Duration position),
    TResult onPositionTick(Duration position),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (onPositionTick != null) {
      return onPositionTick(position);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult settingsFetched(_SettingsFetched value),
    @required TResult seasonChanged(_SeasonChanged value),
    @required TResult episodeChanged(_EpisodeChanged value),
    @required TResult languageChanged(_LanguageChanged value),
    @required TResult qualityChanged(_QualityChanged value),
    @required TResult fetchRelatedRequested(_FetchRelatedRequested value),
    @required TResult startPositionChanged(_StartPositionChanged value),
    @required TResult onPositionTick(_OnPositionTick value),
  }) {
    assert(settingsFetched != null);
    assert(seasonChanged != null);
    assert(episodeChanged != null);
    assert(languageChanged != null);
    assert(qualityChanged != null);
    assert(fetchRelatedRequested != null);
    assert(startPositionChanged != null);
    assert(onPositionTick != null);
    return onPositionTick(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult settingsFetched(_SettingsFetched value),
    TResult seasonChanged(_SeasonChanged value),
    TResult episodeChanged(_EpisodeChanged value),
    TResult languageChanged(_LanguageChanged value),
    TResult qualityChanged(_QualityChanged value),
    TResult fetchRelatedRequested(_FetchRelatedRequested value),
    TResult startPositionChanged(_StartPositionChanged value),
    TResult onPositionTick(_OnPositionTick value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (onPositionTick != null) {
      return onPositionTick(this);
    }
    return orElse();
  }
}

abstract class _OnPositionTick implements StreamEvent {
  const factory _OnPositionTick(Duration position) = _$_OnPositionTick;

  Duration get position;
  _$OnPositionTickCopyWith<_OnPositionTick> get copyWith;
}

/// @nodoc
class _$StreamStateTearOff {
  const _$StreamStateTearOff();

// ignore: unused_element
  _StreamState call(
      StreamSettings settings,
      Option<SeasonFiles> seasonFilesOption,
      Option<Movies> relatedOption,
      Option<String> videoSrcOption,
      Duration startPosition,
      int season,
      int episode,
      int episodeSeason,
      Quality quality,
      Language language,
      List<Language> availableLanguages,
      List<Quality> availableQualities) {
    return _StreamState(
      settings,
      seasonFilesOption,
      relatedOption,
      videoSrcOption,
      startPosition,
      season,
      episode,
      episodeSeason,
      quality,
      language,
      availableLanguages,
      availableQualities,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $StreamState = _$StreamStateTearOff();

/// @nodoc
mixin _$StreamState {
  StreamSettings get settings;
  Option<SeasonFiles> get seasonFilesOption;
  Option<Movies> get relatedOption;
  Option<String> get videoSrcOption;
  Duration get startPosition;
  int get season;
  int get episode;
  int get episodeSeason;
  Quality get quality;
  Language get language;
  List<Language> get availableLanguages;
  List<Quality> get availableQualities;

  $StreamStateCopyWith<StreamState> get copyWith;
}

/// @nodoc
abstract class $StreamStateCopyWith<$Res> {
  factory $StreamStateCopyWith(
          StreamState value, $Res Function(StreamState) then) =
      _$StreamStateCopyWithImpl<$Res>;
  $Res call(
      {StreamSettings settings,
      Option<SeasonFiles> seasonFilesOption,
      Option<Movies> relatedOption,
      Option<String> videoSrcOption,
      Duration startPosition,
      int season,
      int episode,
      int episodeSeason,
      Quality quality,
      Language language,
      List<Language> availableLanguages,
      List<Quality> availableQualities});
}

/// @nodoc
class _$StreamStateCopyWithImpl<$Res> implements $StreamStateCopyWith<$Res> {
  _$StreamStateCopyWithImpl(this._value, this._then);

  final StreamState _value;
  // ignore: unused_field
  final $Res Function(StreamState) _then;

  @override
  $Res call({
    Object settings = freezed,
    Object seasonFilesOption = freezed,
    Object relatedOption = freezed,
    Object videoSrcOption = freezed,
    Object startPosition = freezed,
    Object season = freezed,
    Object episode = freezed,
    Object episodeSeason = freezed,
    Object quality = freezed,
    Object language = freezed,
    Object availableLanguages = freezed,
    Object availableQualities = freezed,
  }) {
    return _then(_value.copyWith(
      settings:
          settings == freezed ? _value.settings : settings as StreamSettings,
      seasonFilesOption: seasonFilesOption == freezed
          ? _value.seasonFilesOption
          : seasonFilesOption as Option<SeasonFiles>,
      relatedOption: relatedOption == freezed
          ? _value.relatedOption
          : relatedOption as Option<Movies>,
      videoSrcOption: videoSrcOption == freezed
          ? _value.videoSrcOption
          : videoSrcOption as Option<String>,
      startPosition: startPosition == freezed
          ? _value.startPosition
          : startPosition as Duration,
      season: season == freezed ? _value.season : season as int,
      episode: episode == freezed ? _value.episode : episode as int,
      episodeSeason: episodeSeason == freezed
          ? _value.episodeSeason
          : episodeSeason as int,
      quality: quality == freezed ? _value.quality : quality as Quality,
      language: language == freezed ? _value.language : language as Language,
      availableLanguages: availableLanguages == freezed
          ? _value.availableLanguages
          : availableLanguages as List<Language>,
      availableQualities: availableQualities == freezed
          ? _value.availableQualities
          : availableQualities as List<Quality>,
    ));
  }
}

/// @nodoc
abstract class _$StreamStateCopyWith<$Res>
    implements $StreamStateCopyWith<$Res> {
  factory _$StreamStateCopyWith(
          _StreamState value, $Res Function(_StreamState) then) =
      __$StreamStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {StreamSettings settings,
      Option<SeasonFiles> seasonFilesOption,
      Option<Movies> relatedOption,
      Option<String> videoSrcOption,
      Duration startPosition,
      int season,
      int episode,
      int episodeSeason,
      Quality quality,
      Language language,
      List<Language> availableLanguages,
      List<Quality> availableQualities});
}

/// @nodoc
class __$StreamStateCopyWithImpl<$Res> extends _$StreamStateCopyWithImpl<$Res>
    implements _$StreamStateCopyWith<$Res> {
  __$StreamStateCopyWithImpl(
      _StreamState _value, $Res Function(_StreamState) _then)
      : super(_value, (v) => _then(v as _StreamState));

  @override
  _StreamState get _value => super._value as _StreamState;

  @override
  $Res call({
    Object settings = freezed,
    Object seasonFilesOption = freezed,
    Object relatedOption = freezed,
    Object videoSrcOption = freezed,
    Object startPosition = freezed,
    Object season = freezed,
    Object episode = freezed,
    Object episodeSeason = freezed,
    Object quality = freezed,
    Object language = freezed,
    Object availableLanguages = freezed,
    Object availableQualities = freezed,
  }) {
    return _then(_StreamState(
      settings == freezed ? _value.settings : settings as StreamSettings,
      seasonFilesOption == freezed
          ? _value.seasonFilesOption
          : seasonFilesOption as Option<SeasonFiles>,
      relatedOption == freezed
          ? _value.relatedOption
          : relatedOption as Option<Movies>,
      videoSrcOption == freezed
          ? _value.videoSrcOption
          : videoSrcOption as Option<String>,
      startPosition == freezed
          ? _value.startPosition
          : startPosition as Duration,
      season == freezed ? _value.season : season as int,
      episode == freezed ? _value.episode : episode as int,
      episodeSeason == freezed ? _value.episodeSeason : episodeSeason as int,
      quality == freezed ? _value.quality : quality as Quality,
      language == freezed ? _value.language : language as Language,
      availableLanguages == freezed
          ? _value.availableLanguages
          : availableLanguages as List<Language>,
      availableQualities == freezed
          ? _value.availableQualities
          : availableQualities as List<Quality>,
    ));
  }
}

/// @nodoc
class _$_StreamState with DiagnosticableTreeMixin implements _StreamState {
  const _$_StreamState(
      this.settings,
      this.seasonFilesOption,
      this.relatedOption,
      this.videoSrcOption,
      this.startPosition,
      this.season,
      this.episode,
      this.episodeSeason,
      this.quality,
      this.language,
      this.availableLanguages,
      this.availableQualities)
      : assert(settings != null),
        assert(seasonFilesOption != null),
        assert(relatedOption != null),
        assert(videoSrcOption != null),
        assert(startPosition != null),
        assert(season != null),
        assert(episode != null),
        assert(episodeSeason != null),
        assert(quality != null),
        assert(language != null),
        assert(availableLanguages != null),
        assert(availableQualities != null);

  @override
  final StreamSettings settings;
  @override
  final Option<SeasonFiles> seasonFilesOption;
  @override
  final Option<Movies> relatedOption;
  @override
  final Option<String> videoSrcOption;
  @override
  final Duration startPosition;
  @override
  final int season;
  @override
  final int episode;
  @override
  final int episodeSeason;
  @override
  final Quality quality;
  @override
  final Language language;
  @override
  final List<Language> availableLanguages;
  @override
  final List<Quality> availableQualities;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StreamState(settings: $settings, seasonFilesOption: $seasonFilesOption, relatedOption: $relatedOption, videoSrcOption: $videoSrcOption, startPosition: $startPosition, season: $season, episode: $episode, episodeSeason: $episodeSeason, quality: $quality, language: $language, availableLanguages: $availableLanguages, availableQualities: $availableQualities)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StreamState'))
      ..add(DiagnosticsProperty('settings', settings))
      ..add(DiagnosticsProperty('seasonFilesOption', seasonFilesOption))
      ..add(DiagnosticsProperty('relatedOption', relatedOption))
      ..add(DiagnosticsProperty('videoSrcOption', videoSrcOption))
      ..add(DiagnosticsProperty('startPosition', startPosition))
      ..add(DiagnosticsProperty('season', season))
      ..add(DiagnosticsProperty('episode', episode))
      ..add(DiagnosticsProperty('episodeSeason', episodeSeason))
      ..add(DiagnosticsProperty('quality', quality))
      ..add(DiagnosticsProperty('language', language))
      ..add(DiagnosticsProperty('availableLanguages', availableLanguages))
      ..add(DiagnosticsProperty('availableQualities', availableQualities));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _StreamState &&
            (identical(other.settings, settings) ||
                const DeepCollectionEquality()
                    .equals(other.settings, settings)) &&
            (identical(other.seasonFilesOption, seasonFilesOption) ||
                const DeepCollectionEquality()
                    .equals(other.seasonFilesOption, seasonFilesOption)) &&
            (identical(other.relatedOption, relatedOption) ||
                const DeepCollectionEquality()
                    .equals(other.relatedOption, relatedOption)) &&
            (identical(other.videoSrcOption, videoSrcOption) ||
                const DeepCollectionEquality()
                    .equals(other.videoSrcOption, videoSrcOption)) &&
            (identical(other.startPosition, startPosition) ||
                const DeepCollectionEquality()
                    .equals(other.startPosition, startPosition)) &&
            (identical(other.season, season) ||
                const DeepCollectionEquality().equals(other.season, season)) &&
            (identical(other.episode, episode) ||
                const DeepCollectionEquality()
                    .equals(other.episode, episode)) &&
            (identical(other.episodeSeason, episodeSeason) ||
                const DeepCollectionEquality()
                    .equals(other.episodeSeason, episodeSeason)) &&
            (identical(other.quality, quality) ||
                const DeepCollectionEquality()
                    .equals(other.quality, quality)) &&
            (identical(other.language, language) ||
                const DeepCollectionEquality()
                    .equals(other.language, language)) &&
            (identical(other.availableLanguages, availableLanguages) ||
                const DeepCollectionEquality()
                    .equals(other.availableLanguages, availableLanguages)) &&
            (identical(other.availableQualities, availableQualities) ||
                const DeepCollectionEquality()
                    .equals(other.availableQualities, availableQualities)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(settings) ^
      const DeepCollectionEquality().hash(seasonFilesOption) ^
      const DeepCollectionEquality().hash(relatedOption) ^
      const DeepCollectionEquality().hash(videoSrcOption) ^
      const DeepCollectionEquality().hash(startPosition) ^
      const DeepCollectionEquality().hash(season) ^
      const DeepCollectionEquality().hash(episode) ^
      const DeepCollectionEquality().hash(episodeSeason) ^
      const DeepCollectionEquality().hash(quality) ^
      const DeepCollectionEquality().hash(language) ^
      const DeepCollectionEquality().hash(availableLanguages) ^
      const DeepCollectionEquality().hash(availableQualities);

  @override
  _$StreamStateCopyWith<_StreamState> get copyWith =>
      __$StreamStateCopyWithImpl<_StreamState>(this, _$identity);
}

abstract class _StreamState implements StreamState {
  const factory _StreamState(
      StreamSettings settings,
      Option<SeasonFiles> seasonFilesOption,
      Option<Movies> relatedOption,
      Option<String> videoSrcOption,
      Duration startPosition,
      int season,
      int episode,
      int episodeSeason,
      Quality quality,
      Language language,
      List<Language> availableLanguages,
      List<Quality> availableQualities) = _$_StreamState;

  @override
  StreamSettings get settings;
  @override
  Option<SeasonFiles> get seasonFilesOption;
  @override
  Option<Movies> get relatedOption;
  @override
  Option<String> get videoSrcOption;
  @override
  Duration get startPosition;
  @override
  int get season;
  @override
  int get episode;
  @override
  int get episodeSeason;
  @override
  Quality get quality;
  @override
  Language get language;
  @override
  List<Language> get availableLanguages;
  @override
  List<Quality> get availableQualities;
  @override
  _$StreamStateCopyWith<_StreamState> get copyWith;
}
