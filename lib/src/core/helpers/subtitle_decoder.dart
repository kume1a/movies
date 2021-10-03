import 'package:injectable/injectable.dart';

import '../../controllers/stream/subtitle_controller.dart';
import '../../ui/stream/subtitles/models/subtitle.dart';

abstract class SubtitleDecoder {
  Future<Subtitles> decodeSubtitles(
    String fileContent,
    SubtitleType subtitleType,
  );
}

@LazySingleton(as: SubtitleDecoder)
class SubtitleDecoderImpl implements SubtitleDecoder {
  @override
  Future<Subtitles> decodeSubtitles(
    String fileContent,
    SubtitleType subtitleType,
  ) async {
    RegExp regExp;
    if (subtitleType == SubtitleType.webvtt) {
      regExp = RegExp(
        r'((\d{2}):(\d{2}):(\d{2})\.(\d+)) +--> +((\d{2}):(\d{2}):(\d{2})\.(\d{3})).*[\r\n]+\s*((?:(?!\r?\n\r?).)*(\r\n|\r|\n)(?:.*))',
        caseSensitive: false,
        multiLine: true,
      );
    } else if (subtitleType == SubtitleType.srt) {
      regExp = RegExp(
        r'((\d{2}):(\d{2}):(\d{2})\,(\d+)) +--> +((\d{2}):(\d{2}):(\d{2})\,(\d{3})).*[\r\n]+\s*((?:(?!\r?\n\r?).)*(\r\n|\r|\n)(?:.*))',
        caseSensitive: false,
        multiLine: true,
      );
    } else {
      throw 'Incorrect subtitle type';
    }

    final List<RegExpMatch> matches = regExp.allMatches(fileContent).toList();
    final List<Subtitle> subtitleList = <Subtitle>[];

    for (final RegExpMatch regExpMatch in matches) {
      final int startTimeHours = int.parse(regExpMatch.group(2)!);
      final int startTimeMinutes = int.parse(regExpMatch.group(3)!);
      final int startTimeSeconds = int.parse(regExpMatch.group(4)!);
      final int startTimeMilliseconds = int.parse(regExpMatch.group(5)!);

      final int endTimeHours = int.parse(regExpMatch.group(7)!);
      final int endTimeMinutes = int.parse(regExpMatch.group(8)!);
      final int endTimeSeconds = int.parse(regExpMatch.group(9)!);
      final int endTimeMilliseconds = int.parse(regExpMatch.group(10)!);
      final String text = removeAllHtmlTags(regExpMatch.group(11)!);

      final Duration startTime = Duration(
        hours: startTimeHours,
        minutes: startTimeMinutes,
        seconds: startTimeSeconds,
        milliseconds: startTimeMilliseconds,
      );

      final Duration endTime = Duration(
        hours: endTimeHours,
        minutes: endTimeMinutes,
        seconds: endTimeSeconds,
        milliseconds: endTimeMilliseconds,
      );

      subtitleList.add(
        Subtitle(startTime: startTime, endTime: endTime, text: text.trim()),
      );
    }

    return Subtitles(subtitles: subtitleList);
  }

  String removeAllHtmlTags(String htmlText) {
    final RegExp exp = RegExp(
      '(<[^>]*>)',
      multiLine: true,
    );
    String newHtmlText = htmlText;
    exp.allMatches(htmlText).toList().forEach(
      (RegExpMatch regExpMatch) {
        if (regExpMatch.group(0) == '<br>') {
          newHtmlText = newHtmlText.replaceAll(regExpMatch.group(0)!, '\n');
        } else {
          newHtmlText = newHtmlText.replaceAll(regExpMatch.group(0)!, '');
        }
      },
    );
    return newHtmlText;
  }
}
