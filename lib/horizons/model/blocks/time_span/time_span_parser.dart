import 'package:intl/intl.dart';
import 'package:project_lazer/horizons/horizons_block_parser.dart';
import 'package:project_lazer/horizons/model/blocks/time_span/time_span_block.dart';

class TimeSpanParser extends HorizonsBlockParser {
//  final RegExp startStopRegex = new RegExp(r'(\w*)\s*time\s*:\s*(.*)\s*');
  final RegExp startStopRegex = new RegExp(
      r'\s*([A|B].?[D|C].?)' // AD or BC
      r'\s*(\d{2,4}' // Year: YY or YYYY
      r'-?[\d|\w]{1,3})' // Month: M or MM or MMM
      r'-?(\d{1,2})' // Day: D or D
      r'\s*(\d{1,2})?' // Optional Hour: H or HH
      r'(:\d{1,2})?' // Optional Minute: M or MM
      r'(:?\d{1,2})?' // Optional Seconds: S or SS
      r'(.\d*)?' // Optional Milli/Micro seconds:
      r'\s*(UT|TT|TDB)?' // Optional Timezone
  );
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
      int year = 0, month = 0, day = 0;
      int hour = 0, minute = 0
      for (int i = 1; i <= match.groupCount; i++) {
        switch (i) {
          case 1:

        }
      }

      final DateTime time = new DateTime(0);
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
