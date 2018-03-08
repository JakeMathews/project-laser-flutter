import 'package:project_lazer/horizons/model/blocks/requester_info/requester_info_block.dart';
import 'package:project_lazer/horizons/model/blocks/requester_info/requester_info_parser.dart';
import 'package:test/test.dart';

void main() {
  final RequesterInfoParserTest requesterInfoParserTest = new RequesterInfoParserTest();

  requesterInfoParserTest.parserAppliesTest();
  requesterInfoParserTest.parseTest();
}

class RequesterInfoParserTest {
  static const String BLOCK_TEXT = '''
    Ephemeris / WWW_USER Wed Mar  7 19:56:26 2018 Pasadena, USA      / Horizons
    ''';

  static const String FIRST_LINE = BLOCK_TEXT;

  void parserAppliesTest() {
    test('RequesterInfoParser parserApplies() Test', () {
      final RequesterInfoParser requesterInfoParser = new RequesterInfoParser();

      expect(requesterInfoParser.parserApplies(FIRST_LINE), true);
      expect(requesterInfoParser.parserApplies('No good'), false);
    });
  }

  void parseTest() {
    test('RequesterInfoParser parse(String blockText) Test', () {
      final RequesterInfoParser requesterInfoParser = new RequesterInfoParser();
      final RequesterInfoBlock actualRequesterInfo = requesterInfoParser.parse(BLOCK_TEXT);
      final RequesterInfoBlock expectedRequesterInfo = createRequesterInfoBlock();

      expect(actualRequesterInfo, expectedRequesterInfo);
    });
  }

  static RequesterInfoBlock createRequesterInfoBlock() {
    final RequesterInfoBlock requesterInfoBlock = new RequesterInfoBlock();

    requesterInfoBlock.dataType = 'Ephemeris';
    requesterInfoBlock.requesterType = 'WWW_USER';
    requesterInfoBlock.requestedTime = new DateTime(2018, 03, 07, 19, 56, 26);
    requesterInfoBlock.serverLocation = 'Pasadena, USA';
    requesterInfoBlock.systemName = 'Horizons';

    return requesterInfoBlock;
  }
}
