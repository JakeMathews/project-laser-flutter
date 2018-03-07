import 'package:project_lazer/data_capture/horizons_model/batch_file.dart';
import 'package:project_lazer/data_capture/batch_file_parser.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:project_lazer/data_capture/horizons_model/coordinates.dart';

final String BATCH_FILE = '''
!\$\$SOF
COMMAND= '301'
CENTER= 'coord'
COORD_TYPE= 'GEODETIC'
SITE_COORD= '-71.05690,+42.35670,0'
MAKE_EPHEM= 'YES'
TABLE_TYPE= 'OBSERVER'
START_TIME= '2018-02-21'
STOP_TIME= '2018-02-22'
STEP_SIZE= '1 m'
CAL_FORMAT= 'CAL'
TIME_DIGITS= 'MINUTES'
ANG_FORMAT= 'HMS'
OUT_UNITS= 'KM-S'
RANGE_UNITS= 'AU'
APPARENT= 'REFRACTED'
SUPPRESS_RANGE_RATE= 'NO'
SKIP_DAYLT= 'NO'
EXTRA_PREC= 'NO'
R_T_S_ONLY= 'NO'
REF_SYSTEM= 'J2000'
CSV_FORMAT= 'YES'
OBJ_DATA= 'YES'
QUANTITIES= '4'
!\$\$EOF
''';

final String INITIAL_MAP = "{COMMAND: 301, CENTER: coord, COORD_TYPE: GEODETIC, SITE_COORD: -71.05690,+42.35670,0, MAKE_EPHEM: YES, TABLE_TYPE: OBSERVER, START_TIME: 2018-02-21, STOP_TIME: 2018-02-22, STEP_SIZE: 1 m, CAL_FORMAT: CAL, TIME_DIGITS: MINUTES, ANG_FORMAT: HMS, OUT_UNITS: KM-S, RANGE_UNITS: AU, APPARENT: REFRACTED, SUPPRESS_RANGE_RATE: NO, SKIP_DAYLT: NO, EXTRA_PREC: NO, R_T_S_ONLY: NO, REF_SYSTEM: J2000, CSV_FORMAT: YES, OBJ_DATA: YES, QUANTITIES: 4}";
final String FINAL_MAP = "{COMMAND: 301, CENTER: coord, COORD_TYPE: GEODETIC, SITE_COORD: -50.0123,+40.123,+1.0, MAKE_EPHEM: YES, TABLE_TYPE: OBSERVER, START_TIME: 2018-03-04, STOP_TIME: 2018-02-22, STEP_SIZE: 5, CAL_FORMAT: CAL, TIME_DIGITS: MINUTES, ANG_FORMAT: HMS, OUT_UNITS: KM-S, RANGE_UNITS: AU, APPARENT: REFRACTED, SUPPRESS_RANGE_RATE: NO, SKIP_DAYLT: NO, EXTRA_PREC: NO, R_T_S_ONLY: NO, REF_SYSTEM: J2000, CSV_FORMAT: YES, OBJ_DATA: YES, QUANTITIES: 10, END_TIME: 2018-03-05}";

void main() {
  test('Test parsing of batch file', () {
    BatchFileParser batchFileParser = new BatchFileParser();
    BatchFile batchFile = batchFileParser.parseFromString(BATCH_FILE);
    expect(batchFile.toString(), INITIAL_MAP);
  });

  test('Test changing common parameters', () {
    BatchFileParser batchFileParser = new BatchFileParser();
    BatchFile batchFile = batchFileParser.parseFromString(BATCH_FILE);

    batchFile.setSiteCoordinates(new Coordinates(-50.0123, 40.123, elevation: 1.0));
    batchFile.setStartTime(new DateTime(2018, 3, 4));
    batchFile.setStopTime(new DateTime(2018, 3, 5));

    expect(batchFile.toString(), FINAL_MAP);
  });
}
