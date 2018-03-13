class TimeSpanBlock {
  DateTime startTime;
  DateTime stopTime;
  Duration stepSize;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimeSpanBlock &&
          runtimeType == other.runtimeType &&
          startTime == other.startTime &&
          stopTime == other.stopTime &&
          stepSize == other.stepSize;

  @override
  int get hashCode => startTime.hashCode ^ stopTime.hashCode ^ stepSize.hashCode;
}
