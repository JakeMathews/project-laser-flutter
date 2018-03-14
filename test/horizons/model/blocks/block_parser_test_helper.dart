import 'package:project_lazer/horizons/horizons_block_parser.dart';
import 'package:flutter_test/flutter_test.dart';

abstract class BlockParserTest {
  final HorizonsBlockParser blockParser;

  BlockParserTest(this.blockParser) {
    _parserAppliesTest();
    _parseTest();
  }

  Object createExpectedBlock();
  String getBlockText();

  void _parserAppliesTest() {
    test('${blockParser.runtimeType} parserApplies(String firstLine) Test', () {
      expect(blockParser.parserApplies(_getFirstLine()), true);
      expect(blockParser.parserApplies('No good'), false);
    });
  }

  void _parseTest() {
    test('${blockParser.runtimeType} parse(String blockText) Test', () {
      final Object actualHorizonsBlock = blockParser.parse(getBlockText());
      expect(actualHorizonsBlock, createExpectedBlock());
    });
  }

  String _getFirstLine() {
    final String blockText = getBlockText();
    String firstLine = blockText;
    if (blockText.contains('\n')) {
      firstLine = blockText.substring(0, blockText.indexOf('\n'));
    }

    return firstLine;
  }
}
