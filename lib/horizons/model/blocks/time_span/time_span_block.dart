class TimeSpanBlock {
  final DateTime startTime;
  final DateTime stopTime;
  final Duration stepSize;

  TimeSpanBlock(this.startTime, this.stopTime, this.stepSize);

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
