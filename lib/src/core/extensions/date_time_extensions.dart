extension DateTimeX on DateTime {
  int get dayOfYear => difference(DateTime(year)).inDays;
}
