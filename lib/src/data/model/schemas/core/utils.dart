extension StringListX on List<String?> {
  String? get firstValid => firstWhere(
        (String? element) => element != null && element.isNotEmpty,
        orElse: () => '',
      );
}

T? getPreferredOrElse<T>(List<T>? ts, T preferred) {
  if (ts == null || ts.isEmpty) return null;

  return ts.firstWhere(
    (T t) => t == preferred,
    orElse: () => ts.first,
  );
}

List<E>? getPreferredListOrElse<T, E>(Map<T, List<E>> map, T preferred) {
  if (map.isEmpty) return List<E>.empty();

  if (map.containsKey(preferred)) {
    return map[preferred];
  }

  return map.values.toList().first;
}
