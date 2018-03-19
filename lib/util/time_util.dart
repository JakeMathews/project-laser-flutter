/*
  Rounds time to the nearest duration since epoch.
   */
DateTime roundTime(final DateTime dateTime, final Duration rounding) {
  final num dateTimeMicroseconds = dateTime.microsecondsSinceEpoch;
  final num roundingMicroseconds = rounding.inMicroseconds;
  final num roundedMicroseconds = (dateTimeMicroseconds / roundingMicroseconds).round() * roundingMicroseconds;

  return new DateTime.fromMicrosecondsSinceEpoch(roundedMicroseconds, isUtc: dateTime.isUtc);
}
