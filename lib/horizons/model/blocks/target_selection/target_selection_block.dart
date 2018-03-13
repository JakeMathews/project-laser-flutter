import 'package:project_lazer/horizons/model/horizons_site.dart';

class TargetSelectionBlock {
  HorizonsSite targetBody;
  HorizonsSite centerBody;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TargetSelectionBlock &&
          runtimeType == other.runtimeType &&
          targetBody == other.targetBody &&
          centerBody == other.centerBody;

  @override
  int get hashCode => targetBody.hashCode ^ centerBody.hashCode;
}
