import 'package:intl/intl.dart';
import 'package:project_lazer/horizons/horizons_block_parser.dart';
import 'package:project_lazer/horizons/model/blocks/time_span/time_span_block.dart';

class TimeSpanParser extends HorizonsBlockParser {
  final RegExp startStopRegex = new RegExp(r'(\w*)\s*time\s*:\s*(.*)\s*');
  final DateFormat dateFormat = new DateFormat('G yyyy-MMM-dd hh:mm:ss.SSSS');

  final RegExp stepSizeRegex = new RegExp(r'Step-size\s*:\s(\d*)\s(\w*)');
  final Map<String, int> steps = {
    'days': 0,
    'hours': 0,
    'minutes': 0,
  };

  @override
  bool parserApplies(String firstLine) {
    return startStopRegex.hasMatch(firstLine);
  }

  @override
  TimeSpanBlock parse(String blockText) {
    final TimeSpanBlock timeRangeBlock = new TimeSpanBlock();

    startStopRegex.allMatches(blockText).forEach((Match match) {
      final String cleanDate =
          match.group(2).replaceAll('UT', '').replaceAll('A.D.', 'AD').replaceAll('B.C.', 'BC').trim();
      final DateTime time = dateFormat.parseLoose(cleanDate);
      if (match.group(1).trim() == 'Start') {
        timeRangeBlock.startTime = time;
      } else if (match.group(1).trim() == 'Stop') {
        timeRangeBlock.stopTime = time;
      }
    });

    final Match stepSizeMatch = stepSizeRegex.firstMatch(blockText);
    final int stepValue = int.parse(stepSizeMatch.group(1));
    final String stepSizeName = stepSizeMatch.group(2).trim().toLowerCase();
    steps[stepSizeName] = stepValue;
    final Duration stepSize = new Duration(days: steps['days'], hours: steps['hours'], minutes: steps['minutes']);
    timeRangeBlock.stepSize = stepSize;

    return timeRangeBlock;
  }
}
