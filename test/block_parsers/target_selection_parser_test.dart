import 'package:project_lazer/horizons/model/blocks/target_selection/target_selection_block.dart';
import 'package:project_lazer/horizons/model/blocks/target_selection/target_selection_parser.dart';
import 'package:project_lazer/horizons/model/horizons_site.dart';
import 'package:test/test.dart';

void main() {
  final TargetSelectionParserTest targetSelectionParserTest = new TargetSelectionParserTest();

  targetSelectionParserTest.parserAppliesTest();
  targetSelectionParserTest.parseTest();
}

class TargetSelectionParserTest {
  static const String BLOCK_TEXT = '''
    Target body name: Moon (301)                      {source: DE431mx}
    Center body name: Earth (399)                     {source: DE431mx}
    Center-site name: (user defined site below)
    ''';

  static const String FIRST_LINE = BLOCK_TEXT;

  void parserAppliesTest() {
    test('targetSelectionParser parserApplies() Test', () {
      final TargetSelectionParser requesterInfoParser = new TargetSelectionParser();

      expect(requesterInfoParser.parserApplies(FIRST_LINE), true);
      expect(requesterInfoParser.parserApplies('No good'), false);
    });
  }

  void parseTest() {
    test('targetSelectionParser parse(String blockText) Test', () {
      final TargetSelectionParser targetInfoParser = new TargetSelectionParser();
      final TargetSelectionBlock actualTargetInfo = targetInfoParser.parse(BLOCK_TEXT);
      final TargetSelectionBlock expectedTargetInfo = createTargetInfoBlock();

      expect(actualTargetInfo, expectedTargetInfo);
    });
  }

  static TargetSelectionBlock createTargetInfoBlock() {
    final TargetSelectionBlock targetSelectionBlock = new TargetSelectionBlock();

    targetSelectionBlock.targetBody = new HorizonsSite('Moon', 301);
    targetSelectionBlock.centerBody = new HorizonsSite('Earth', 399);

    return targetSelectionBlock;
  }
}
