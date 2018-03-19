import 'package:project_lazer/horizons/model/blocks/requester_info/requester_info_block.dart';
import 'package:project_lazer/horizons/model/blocks/table/table_block.dart';
import 'package:project_lazer/horizons/model/blocks/target_selection/target_selection_block.dart';
import 'package:project_lazer/horizons/model/blocks/time_span/time_span_block.dart';

class HorizonsData {
  RequesterInfoBlock requesterInfoBlock;
  TargetSelectionBlock targetSelectionBlock;
  TimeSpanBlock timeSpanBlock;
  TableBlock tableBlock;

  bool addDataBlock(final Object dataBlock) {
    final Type dataBlockType = dataBlock.runtimeType;
    switch (dataBlockType) {
      case RequesterInfoBlock:
        this.requesterInfoBlock = dataBlock;
        break;
      case TargetSelectionBlock:
        this.targetSelectionBlock = dataBlock;
        break;
      case TimeSpanBlock:
        this.timeSpanBlock = dataBlock;
        break;
      case TableBlock:
        this.tableBlock = dataBlock;
        break;
      default:
        print('Object of type $dataBlockType does not belong to HorizonsData');
        return false;
    }

    return true;
  }
}
