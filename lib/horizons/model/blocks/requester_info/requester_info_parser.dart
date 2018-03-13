import 'package:intl/intl.dart';
import 'package:project_lazer/horizons/horizons_block_parser.dart';
import 'package:project_lazer/horizons/model/blocks/requester_info/requester_info_block.dart';

class RequesterInfoParser extends HorizonsBlockParser {
  // Ephemeris / WWW_USER Wed Mar  7 19:56:26 2018 Pasadena, USA      / Horizons
  final RegExp regExp = new RegExp(r'(\w*)\s\/\s(\w*)\s(\w* .*:\w*\s\w*)\s(\w*, \w*)\s*/\s(\w*)');
  final DateFormat dateFormat = new DateFormat('EEE MMM  dd hh:mm:ss yyyy');

  @override
  bool parserApplies(String firstLine) {
    return regExp.hasMatch(firstLine);
  }

  @override
  RequesterInfoBlock parse(String blockText) {
    final RequesterInfoBlock requesterInfoBlock = new RequesterInfoBlock();
    final Match match = regExp.firstMatch(blockText);

    requesterInfoBlock.dataType = match.group(1);
    requesterInfoBlock.requesterType = match.group(2);
    requesterInfoBlock.requestedTime = dateFormat.parse(match.group(3));
    requesterInfoBlock.serverLocation = match.group(4);
    requesterInfoBlock.systemName = match.group(5);

    return requesterInfoBlock;
  }
}
