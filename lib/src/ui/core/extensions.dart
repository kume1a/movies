import 'package:flutter/foundation.dart';

import '../../data/model/core/option.dart';

extension TextUtilsStringExtension on String? {
  /// Returns true if string is:
  /// - null
  /// - empty
  /// - whitespace string.
  bool get isNullEmptyOrWhitespace => this == null || this?.isEmpty == true || this?.trim().isEmpty == true;
}

extension GeneralUtilsObjectExtension on Object? {
  /// Returns true if object is:
  /// - null `Object`
  bool get isNull => this == null;

  /// Returns true if object is NOT:
  /// - null `Object`
  bool get isNotNull => this != null;
}

extension OptionX<T> on Option<T> {
  bool equals(Option<T> other) {
    return fold(
      () {
        return other.fold(
          () => true,
          (_) => false,
        );
      },
      (T a) {
        return other.fold(
          () => false,
          (T o) {
            try {
              // ignore: always_specify_types
              return listEquals(a as List, o as List);
            // ignore: avoid_catching_errors
            } on TypeError {
              return a == o;
            }
          },
        );
      },
    );
  }
}
