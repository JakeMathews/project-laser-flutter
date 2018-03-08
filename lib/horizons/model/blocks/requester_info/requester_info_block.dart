import 'package:project_lazer/horizons/model/horizons_block.dart';

class RequesterInfoBlock implements HorizonsBlock {
  String dataType;
  String requesterType;
  DateTime requestedTime;
  String serverLocation;
  String systemName;

  @override
  String getName() {
    return 'Requester Info Block';
  }

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
