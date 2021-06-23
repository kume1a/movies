part of 'stream_bloc.dart';

@freezed
class StreamState with _$StreamState {
  const factory StreamState(
      StreamSettings settings,
      Option<MovieData> movie,
      Option<SeasonFiles> seasonFilesOption,
      Option<Movies> relatedOption,
      Option<String> videoSrcOption,
      Duration startPosition,
      Duration currentPosition,
      int season,
      int episode,
      int episodeSeason,
      Quality quality,
      Language language,
      List<Language> availableLanguages,
      List<Quality> availableQualities,
      {required bool shouldShowPermissionDeniedMessage,
      required bool shouldShowDownloadStartedMessage}) = _StreamState;

  factory StreamState.initial() => StreamState(
        StreamSettings.initial(),
        none(),
        none(),
        none(),
        none(),
        const Duration(),
        const Duration(),
        1,
        1,
        1,
        Quality.high,
        Language.eng,
        <Language>[],
        <Quality>[],
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
