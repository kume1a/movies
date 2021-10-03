class Subtitles {
  Subtitles({
    required this.subtitles,
  });

  final List<Subtitle> subtitles;

  @override
  String toString() {
    return 'Subtitles{subtitles: $subtitles}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Subtitles && runtimeType == other.runtimeType && subtitles == other.subtitles;

  @override
  int get hashCode => subtitles.hashCode;
}

class Subtitle {
  const Subtitle({
    required this.startTime,
    required this.endTime,
    required this.text,
  });

  final Duration startTime;
  final Duration endTime;
  final String text;

  @override
  String toString() {
    return 'Subtitle{startTime: $startTime, endTime: $endTime, text: $text}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Subtitle &&
          runtimeType == other.runtimeType &&
          startTime == other.startTime &&
          endTime == other.endTime &&
          text == other.text;

  @override
  int get hashCode => startTime.hashCode ^ endTime.hashCode ^ text.hashCode;
}
