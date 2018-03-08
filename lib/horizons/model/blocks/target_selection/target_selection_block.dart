import 'package:project_lazer/horizons/model/horizons_block.dart';
import 'package:project_lazer/horizons/model/horizons_site.dart';

class TargetSelectionBlock extends HorizonsBlock {
  HorizonsSite targetBody;
  HorizonsSite centerBody;

  @override
  String getName() {
    return 'Target Selection Block';
  }

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
