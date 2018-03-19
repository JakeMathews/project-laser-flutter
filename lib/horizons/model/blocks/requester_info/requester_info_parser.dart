import 'package:intl/intl.dart';
import 'package:project_lazer/horizons/horizons_block_parser.dart';
import 'package:project_lazer/horizons/model/blocks/requester_info/requester_info_block.dart';

class RequesterInfoParser extends HorizonsBlockParser {
  // Ephemeris / WWW_USER Wed Mar  7 19:56:26 2018 Pasadena, USA      / Horizons
  final RegExp regExp = new RegExp(r'(\w*)' // Data type
      r'\s\/\s(\w*)' // Requester type
      r'\s(\w* .*:\w*\s\w*)' // Date and time
      r'\s(\w*, \w*)' // Server location
      r'\s*/\s(\w*)' // System name
      );
  final DateFormat dateFormat = new DateFormat('EEE MMM dd hh:mm:ss yyyy');

  @override
  bool parserApplies(String firstLine) {
    return regExp.hasMatch(firstLine);
  }

  @override
  RequesterInfoBlock parse(String blockText) {
    final Match match = regExp.firstMatch(blockText);

    final String dataType = match.group(1);
    final String requesterType = match.group(2);
    final DateTime requestedTime = dateFormat.parseLoose(match.group(3));
    final String serverLocation = match.group(4);
    final String systemName = match.group(5);

    return new RequesterInfoBlock(dataType, requesterType, requestedTime, serverLocation, systemName);
  }
}
