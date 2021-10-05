import 'dart:io';

import 'package:collection/collection.dart';
import 'package:file_picker/file_picker.dart';
import 'package:injectable/injectable.dart';

import '../../controllers/stream/subtitle_controller.dart';
import '../../core/helpers/subtitle_decoder.dart';
import '../model/models/subtitles/subtitles.dart';

abstract class SubtitleLocalLoader {
  Future<Subtitles?> loadSubtitles();
}

@LazySingleton(as: SubtitleLocalLoader)
class SubtitleLocalLoaderImpl implements SubtitleLocalLoader {
  SubtitleLocalLoaderImpl(
    this._subtitleDecoder,
  );

  final SubtitleDecoder _subtitleDecoder;

  @override
  Future<Subtitles?> loadSubtitles() async {
    final FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: <String>['vtt', 'srt'],
    );

    final PlatformFile? pickedFile = result?.files.firstOrNull;
    if (pickedFile != null && pickedFile.path != null) {
      final File file = File(pickedFile.path!);
      final String subtitles = await file.readAsString();

      final String? extension = pickedFile.extension;
      SubtitleType? subtitleType;
      switch (extension) {
        case 'vtt':
          subtitleType = SubtitleType.webvtt;
          break;
        case 'srt':
          subtitleType = SubtitleType.srt;
          break;
      }

      if (subtitleType != null) {
        return _subtitleDecoder.decodeSubtitles(subtitles, subtitleType);
      }
    }
  }
}
