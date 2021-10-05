import 'subtitle.dart';

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
