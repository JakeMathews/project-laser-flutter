import 'package:project_lazer/horizons/horizons_block_parser.dart';
import 'package:project_lazer/horizons/model/blocks/target_selection/target_selection_block.dart';
import 'package:project_lazer/horizons/model/blocks/target_selection/target_selection_parser.dart';
import 'package:project_lazer/horizons/model/horizons_site.dart';

import 'block_parser_test_helper.dart';

void main() {
  new TargetSelectionParserTest(new TargetSelectionParser());
}

class TargetSelectionParserTest extends BlockParserTest {
  TargetSelectionParserTest(HorizonsBlockParser blockParser) : super(blockParser);

  @override
  Object createExpectedBlock() {
    final TargetSelectionBlock targetSelectionBlock = new TargetSelectionBlock();
    targetSelectionBlock.targetBody = new HorizonsSite('Moon', 301);
    targetSelectionBlock.centerBody = new HorizonsSite('Earth', 399);
    return targetSelectionBlock;
  }

  @override
  String getBlockText() {
    return r'''
Target body name: Moon (301)                      {source: DE431mx}
Center body name: Earth (399)                     {source: DE431mx}
Center-site name: (user defined site below)
''';
  }
}
