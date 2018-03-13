class RequesterInfoBlock {
  String dataType;
  String requesterType;
  DateTime requestedTime;
  String serverLocation;
  String systemName;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is RequesterInfoBlock &&
              runtimeType == other.runtimeType &&
              dataType == other.dataType &&
              requesterType == other.requesterType &&
              requestedTime == other.requestedTime &&
              serverLocation == other.serverLocation &&
              systemName == other.systemName;

  @override
  int get hashCode =>
      dataType.hashCode ^
      requesterType.hashCode ^
      requestedTime.hashCode ^
      serverLocation.hashCode ^
      systemName.hashCode;
}
