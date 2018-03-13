import 'package:project_lazer/horizons/horizons_block_parser.dart';
import 'package:project_lazer/horizons/model/blocks/requester_info/requester_info_block.dart';
import 'package:project_lazer/horizons/model/blocks/requester_info/requester_info_parser.dart';

import 'block_parser_test_helper.dart';

void main() {
  new RequesterInfoParserTest(new RequesterInfoParser());
}

class RequesterInfoParserTest extends BlockParserTest {
  RequesterInfoParserTest(HorizonsBlockParser blockParser) : super(blockParser);

  @override
  Object createExpectedBlock() {
    final RequesterInfoBlock requesterInfoBlock = new RequesterInfoBlock();
    requesterInfoBlock.dataType = 'Ephemeris';
    requesterInfoBlock.requesterType = 'WWW_USER';
    requesterInfoBlock.requestedTime = new DateTime(2018, 03, 07, 19, 56, 26);
    requesterInfoBlock.serverLocation = 'Pasadena, USA';
    requesterInfoBlock.systemName = 'Horizons';
    return requesterInfoBlock;
  }

  @override
  String getBlockText() {
    return r'''
Ephemeris / WWW_USER Wed Mar  7 19:56:26 2018 Pasadena, USA      / Horizons
''';
  }
}
