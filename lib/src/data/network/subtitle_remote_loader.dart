import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:injectable/injectable.dart';

import '../../controllers/stream/subtitle_controller.dart';
import '../../core/helpers/subtitle_decoder.dart';
import '../../ui/stream/subtitles/models/subtitle.dart';

abstract class SubtitleRemoteLoader {
  Future<Subtitles> getSubtitles(
    String url,
    SubtitleType subtitleType,
    SubtitleEncoding subtitleEncoding,
  );
}

@LazySingleton(as: SubtitleRemoteLoader)
class SubtitleRemoteLoaderImpl implements SubtitleRemoteLoader {
  SubtitleRemoteLoaderImpl(
    this._subtitleDecoder,
  );

  final SubtitleDecoder _subtitleDecoder;

  @override
  Future<Subtitles> getSubtitles(
    String url,
    SubtitleType subtitleType,
    SubtitleEncoding subtitleEncoding,
  ) async {
    final String? subtitles = await loadRemoteSubtitleContent(
      subtitleUrl: url,
      subtitleEncoding: subtitleEncoding,
    );

    return _subtitleDecoder.decodeSubtitles(subtitles!, subtitleType);
  }

  // Gets the subtitle content type
  SubtitleEncoding requestContentType(Map<String, dynamic> headers) {
    // Extracts the subtitle content type from the headers
    final Encoding encoding = _encodingForHeaders(headers as Map<String, String>);
    if (encoding == latin1) {
      // If encoding type is latin1 return this type
      return SubtitleEncoding.latin1;
    } else {
      // If encoding type is utf8 return this type
      return SubtitleEncoding.utf8;
    }
  }

  // Extract the encoding type from the headers
  Encoding _encodingForHeaders(Map<String, String> headers) => encodingForCharset(
        _contentTypeForHeaders(headers).parameters['charset'],
      );

  // Gets the content type from the headers and returns it as a media type
  MediaType _contentTypeForHeaders(Map<String, String> headers) {
    String _contentType = headers['content-type']!;
    if (_hasSemiColonEnding(_contentType)) {
      _contentType = _fixSemiColonEnding(_contentType);
    }
    return MediaType.parse(_contentType);
  }

  // Check if the string is ending with a semicolon.
  bool _hasSemiColonEnding(String _string) {
    return _string.substring(_string.length - 1, _string.length) == ';';
  }

  // Remove ending semicolon from string.
  String _fixSemiColonEnding(String _string) {
    return _string.substring(0, _string.length - 1);
  }

  // Gets the encoding type for the charset string with a fall back to utf8
  Encoding encodingForCharset(String? charset, [Encoding fallback = utf8]) {
    // If the charset is empty we use the encoding fallback
    if (charset == null) return fallback;
    // If the charset is not empty we will return the encoding type for this charset
    return Encoding.getByName(charset) ?? fallback;
  }

  // Loads the remote subtitle content
  Future<String?> loadRemoteSubtitleContent({
    required String subtitleUrl,
    required SubtitleEncoding subtitleEncoding,
  }) async {
    String? subtitlesContent;
    // Try loading the subtitle content with http.get
    final http.Response response = await http.get(
      Uri.parse(subtitleUrl),
    );
    // Lets check if the request was successful
    if (response.statusCode == 200) {
      // If the subtitle decoder type is utf8 lets decode it with utf8
      if (subtitleEncoding == SubtitleEncoding.utf8) {
        subtitlesContent = utf8.decode(
          response.bodyBytes,
          allowMalformed: true,
        );
      }
      // If the subtitle decoder type is latin1 lets decode it with latin1
      else if (subtitleEncoding == SubtitleEncoding.latin1) {
        subtitlesContent = latin1.decode(
          response.bodyBytes,
          allowInvalid: true,
        );
      }
      // The  subtitle decoder was not defined so we will extract it from the response headers send from the server
      else {
        final SubtitleEncoding subtitleServerDecoder = requestContentType(
          response.headers,
        );
        // If the subtitle decoder type is utf8 lets decode it with utf8
        if (subtitleServerDecoder == SubtitleEncoding.utf8) {
          subtitlesContent = utf8.decode(
            response.bodyBytes,
            allowMalformed: true,
          );
        }
        // If the subtitle decoder type is latin1 lets decode it with latin1
        else if (subtitleServerDecoder == SubtitleEncoding.latin1) {
          subtitlesContent = latin1.decode(
            response.bodyBytes,
            allowInvalid: true,
          );
        }
      }
    }
    // Return the subtitle content
    return subtitlesContent;
  }
}
