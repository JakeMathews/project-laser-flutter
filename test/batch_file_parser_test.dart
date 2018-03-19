import 'package:project_lazer/horizons/batch_file/batch_file.dart';
import 'package:project_lazer/horizons/batch_file/batch_file_parser.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:project_lazer/horizons/batch_file/coordinates.dart';

const String BATCH_FILE = r'''
!$$SOF
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
!$$EOF
''';

void main() {
  test('Test parsing of batch file', () {
    BatchFileParser batchFileParser = new BatchFileParser();
    BatchFile batchFile = batchFileParser.parseFromString(BATCH_FILE);
    expect(batchFile.toString(), createParametersMap().toString());
  });

  test('Test changing common parameters', () {
    BatchFileParser batchFileParser = new BatchFileParser();
    BatchFile batchFile = batchFileParser.parseFromString(BATCH_FILE);

    batchFile.setLocalSiteCoordinates(new Coordinates(-50.0123, 40.123, elevation: 1.0));
    batchFile.setStartTime(new DateTime(2018, 3, 4));
    batchFile.setStopTime(new DateTime(2018, 3, 5));

    expect(batchFile.toString(), createChangedMap().toString());
  });
}

Map<String, String> createChangedMap() {
  Map<String, String> newMap = createParametersMap();

  newMap['SITE_COORD'] = '\'-50.0123,+40.123,+1.0\'';
  newMap['START_TIME'] = '\'2018-03-04 00:00\'';
  newMap['STOP_TIME'] = '\'2018-03-05 00:00\'';

  return newMap;
}

Map<String, String> createParametersMap() {
  return {
    'COMMAND': '\'301\'',
    'CENTER': '\'coord\'',
    'COORD_TYPE': '\'GEODETIC\'',
    'SITE_COORD': '\'-71.05690,+42.35670,0\'',
    'MAKE_EPHEM': '\'YES\'',
    'TABLE_TYPE': '\'OBSERVER\'',
    'START_TIME': '\'2018-02-21\'',
    'STOP_TIME': '\'2018-02-22\'',
    'STEP_SIZE': '\'1 m\'',
    'CAL_FORMAT': '\'CAL\'',
    'TIME_DIGITS': '\'MINUTES\'',
    'ANG_FORMAT': '\'HMS\'',
    'OUT_UNITS': '\'KM-S\'',
    'RANGE_UNITS': '\'AU\'',
    'APPARENT': '\'REFRACTED\'',
    'SUPPRESS_RANGE_RATE': '\'NO\'',
    'SKIP_DAYLT': '\'NO\'',
    'EXTRA_PREC': '\'NO\'',
    'R_T_S_ONLY': '\'NO\'',
    'REF_SYSTEM': '\'J2000\'',
    'CSV_FORMAT': '\'YES\'',
    'OBJ_DATA': '\'YES\'',
    'QUANTITIES': '\'4\'',
    'batch': '\'1\'',
  };
}
