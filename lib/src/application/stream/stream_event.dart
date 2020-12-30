part of 'stream_bloc.dart';

@freezed
abstract class StreamEvent with _$StreamEvent {
  const factory StreamEvent.settingsFetched(StreamSettings settings) = _SettingsFetched;

  const factory StreamEvent.movieChanged(MovieData movie) = _MovieChanged;

  const factory StreamEvent.seasonChanged(int season) = _SeasonChanged;
  const factory StreamEvent.episodeChanged(int episode) = _EpisodeChanged;

  const factory StreamEvent.languageChanged(Language language) = _LanguageChanged;
  const factory StreamEvent.qualityChanged(Quality quality) = _QualityChanged;

  const factory StreamEvent.fetchRelatedRequested() = _FetchRelatedRequested;

  const factory StreamEvent.startPositionChanged(Duration position) = _StartPositionChanged;
  const factory StreamEvent.onPositionTick(Duration position) = _OnPositionTick;
}
