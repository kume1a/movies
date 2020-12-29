import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

extension TextUtilsStringExtension on String {
  /// Returns true if string is:
  /// - null
  /// - empty
  /// - whitespace string.
  bool get isNullEmptyOrWhitespace => this == null || isEmpty || trim().isEmpty;
}

extension GeneralUtilsObjectExtension on Object {
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
              return listEquals(a as List, o as List); // ignore: always_specify_types
            } on TypeError {
              return a == o;
            }
          },
        );
      },
    );
  }
}
