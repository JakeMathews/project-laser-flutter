import 'package:project_lazer/horizons/model/blocks/time_span/time_span_block.dart';
import 'package:project_lazer/horizons/model/blocks/time_span/time_span_parser.dart';
import 'package:test/test.dart';

void main() {
  final TimeSpanParserTest targetSelectionParserTest = new TimeSpanParserTest();

  targetSelectionParserTest.parserAppliesTest();
  targetSelectionParserTest.parseTest();
}

class TimeSpanParserTest {
  static const String BLOCK_TEXT = '''
Start time      : A.D. 2018-Mar-07 14:56:00.0000 UT      
Stop  time      : A.D. 2018-Mar-07 17:56 UT      
Step-size       : 5 minutes
''';

  static const String FIRST_LINE = BLOCK_TEXT;

  void parserAppliesTest() {
    test('targetSelectionParser parserApplies() Test', () {
      final TimeSpanParser timeSpanParser = new TimeSpanParser();

      expect(timeSpanParser.parserApplies(FIRST_LINE), true);
      expect(timeSpanParser.parserApplies('No good'), false);
    });
  }

  void parseTest() {
    test('targetSelectionParser parse(String blockText) Test', () {
      final TimeSpanParser targetInfoParser = new TimeSpanParser();
      final TimeSpanBlock actualTimeSpan = targetInfoParser.parse(BLOCK_TEXT);
      final TimeSpanBlock expectedTimeSpan = createTimeSpanBlock();

      expect(actualTimeSpan, expectedTimeSpan);
    });
  }

  static TimeSpanBlock createTimeSpanBlock() {
    final TimeSpanBlock targetSelectionBlock = new TimeSpanBlock();

    targetSelectionBlock.startTime = new DateTime(2018, 03, 07, 14, 56, 0);
    targetSelectionBlock.stopTime = new DateTime(2018, 03, 07, 17, 56, 0);
    targetSelectionBlock.stepSize = new Duration(minutes: 5);

    return targetSelectionBlock;
  }
}
