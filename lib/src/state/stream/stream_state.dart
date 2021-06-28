part of 'stream_bloc.dart';

@freezed
class StreamState with _$StreamState {
  const factory StreamState({
    required StreamSettings settings,
    MovieData? movie,
    SeasonFiles? seasonFiles,
    Movies? related,
    String? videoSrc,
    required Duration startPosition,
    required Duration currentPosition,
    required int season,
    required int episode,
    required int episodeSeason,
    required Quality quality,
    required Language language,
    required List<Language> availableLanguages,
    required List<Quality> availableQualities,
    required bool shouldShowPermissionDeniedMessage,
    required bool shouldShowDownloadStartedMessage,
  }) = _StreamState;

  factory StreamState.initial() => StreamState(
        settings: StreamSettings.initial(),
        startPosition: const Duration(),
        currentPosition: const Duration(),
        season: 1,
        episode: 1,
        episodeSeason: 1,
        quality: Quality.high,
        language: Language.eng,
        availableLanguages: <Language>[],
        availableQualities: <Quality>[],
        shouldShowPermissionDeniedMessage: false,
        shouldShowDownloadStartedMessage: false,
      );
}

class StreamSettings {
  const StreamSettings({
    required this.autoPlayEnabled,
    required this.recordWatchHistoryEnabled,
    required this.doubleTapToSeekValue,
  });

  factory StreamSettings.initial() => const StreamSettings(
        autoPlayEnabled: DefaultSettings.isAutoPlayEnabled,
        recordWatchHistoryEnabled: DefaultSettings.recordWatchHistoryEnabled,
        doubleTapToSeekValue: DefaultSettings.doubleTapToSeekValue,
      );

  final bool autoPlayEnabled;
  final bool recordWatchHistoryEnabled;
  final int doubleTapToSeekValue;

  @override
  String toString() {
    return 'StreamSettings{autoPlayEnabled: $autoPlayEnabled, recordWatchHistoryEnabled: $recordWatchHistoryEnabled, doubleTapToSeekValue: $doubleTapToSeekValue}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StreamSettings &&
          runtimeType == other.runtimeType &&
          autoPlayEnabled == other.autoPlayEnabled &&
          recordWatchHistoryEnabled == other.recordWatchHistoryEnabled &&
          doubleTapToSeekValue == other.doubleTapToSeekValue;

  @override
  int get hashCode => autoPlayEnabled.hashCode ^ recordWatchHistoryEnabled.hashCode ^ doubleTapToSeekValue.hashCode;
}
