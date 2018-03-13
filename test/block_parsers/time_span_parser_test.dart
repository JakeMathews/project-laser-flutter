import 'package:project_lazer/horizons/horizons_block_parser.dart';
import 'package:project_lazer/horizons/model/blocks/time_span/time_span_block.dart';
import 'package:project_lazer/horizons/model/blocks/time_span/time_span_parser.dart';

import 'block_parser_test_helper.dart';

void main() {
  new TimeSpanParserTest(new TimeSpanParser());
}

class TimeSpanParserTest extends BlockParserTest {
  TimeSpanParserTest(HorizonsBlockParser blockParser) : super(blockParser);

  @override
  Object createExpectedBlock() {
    final TimeSpanBlock targetSelectionBlock = new TimeSpanBlock();
    targetSelectionBlock.startTime = new DateTime(2018, 03, 07, 14, 56, 0);
    targetSelectionBlock.stopTime = new DateTime(2018, 03, 07, 17, 56, 0);
    targetSelectionBlock.stepSize = new Duration(minutes: 5);
    return targetSelectionBlock;
  }

  @override
  String getBlockText() {
    return r'''
Start time      : A.D. 2018-Mar-07 14:56:00.0000 UT      
Stop  time      : A.D. 2018-Mar-07 17:56:00.0000 UT      
Step-size       : 5 minutes
''';
  }
}
