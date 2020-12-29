extension StringListX on List<String> {
  String get firstValid => firstWhere((String element) => element != null && element.isNotEmpty);
}

T getPreferredOrElse<T>(List<T> ts, T preferred) {
  if (ts == null) return null;

  return ts.firstWhere(
        (T t) => t == preferred,
    orElse: () => ts.isEmpty ? null : ts.first,
  );
}

// ignore: always_specify_types
List<E> getPreferredListOrElse<T, E>(Map<T, List<E>> map, T preferred) {
  if (map.isEmpty) return List<E>.empty();

  if (map.containsKey(preferred)) {
    return map[preferred];
  }

  return map.values.toList()[0];
}

