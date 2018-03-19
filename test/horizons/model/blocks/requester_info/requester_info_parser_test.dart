import 'package:project_lazer/horizons/horizons_block_parser.dart';
import 'package:project_lazer/horizons/model/blocks/requester_info/requester_info_block.dart';
import 'package:project_lazer/horizons/model/blocks/requester_info/requester_info_parser.dart';

import '../block_parser_test_helper.dart';

void main() {
  new RequesterInfoParserTest1(new RequesterInfoParser());
  new RequesterInfoParserTest2(new RequesterInfoParser());
}

class RequesterInfoParserTest1 extends BlockParserTest {
  RequesterInfoParserTest1(HorizonsBlockParser blockParser) : super(blockParser);

  @override
  Object createExpectedBlock() {
    final String dataType = 'Ephemeris';
    final String requesterType = 'WWW_USER';
    final DateTime requestedTime = new DateTime(2018, 03, 07, 19, 56, 26);
    final String serverLocation = 'Pasadena, USA';
    final String systemName = 'Horizons';
    return new RequesterInfoBlock(dataType, requesterType, requestedTime, serverLocation, systemName);
  }

  @override
  String getBlockText() {
    return r'''
Ephemeris / WWW_USER Wed Mar  7 19:56:26 2018 Pasadena, USA      / Horizons
''';
  }
}

class RequesterInfoParserTest2 extends BlockParserTest {
  RequesterInfoParserTest2(HorizonsBlockParser blockParser) : super(blockParser);

  @override
  Object createExpectedBlock() {
    final String dataType = 'Ephemeris';
    final String requesterType = 'WWW_USER';
    final DateTime requestedTime = new DateTime(2018, 03, 18, 17, 44, 37);
    final String serverLocation = 'Pasadena, USA';
    final String systemName = 'Horizons';
    return new RequesterInfoBlock(dataType, requesterType, requestedTime, serverLocation, systemName);
  }

  @override
  String getBlockText() {
    return r'''
Ephemeris / WWW_USER Sun Mar 18 17:44:37 2018 Pasadena, USA      / Horizons
''';
  }
}