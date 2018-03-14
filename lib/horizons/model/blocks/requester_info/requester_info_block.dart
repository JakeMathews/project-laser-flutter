class RequesterInfoBlock {
  final String dataType;
  final String requesterType;
  final DateTime requestedTime;
  final String serverLocation;
  final String systemName;

  RequesterInfoBlock(this.dataType, this.requesterType, this.requestedTime, this.serverLocation, this.systemName);

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
