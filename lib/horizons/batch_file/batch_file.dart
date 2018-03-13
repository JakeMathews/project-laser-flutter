import 'dart:async';

import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:project_lazer/horizons/batch_file/batch_file_parser.dart';
import 'package:project_lazer/horizons/batch_file/coordinates.dart';

class BatchFile {
  final Map<String, String> parameters;
  final DateFormat dateFormat = new DateFormat('yyyy-MM-dd HH:mm');

  BatchFile(this.parameters) {
    setParameter('batch', '1');
  }

  static Future<BatchFile> fromDefault() async {
    final String batchFileText = await rootBundle.loadString('assets/batch_files/target_batch_1.txt');

    return new Future<BatchFile>(() {
      final BatchFileParser batchFileParser = new BatchFileParser();
      return batchFileParser.parseFromString(batchFileText);
    });
  }

  void setTarget(final int targetCode) {
    setParameter('COMMAND', targetCode.toString());
  }

  void setSiteCoordinates(final Coordinates coordinates) {
    setParameter('SITE_COORD', coordinates.toString());
  }

  void setStartTime(final DateTime dateTime) {
    _setTime('START_TIME', dateTime);
  }

  void setStopTime(final DateTime dateTime) {
    _setTime('STOP_TIME', dateTime);
  }

  void _setTime(final String parameterKey, final DateTime dateTime) {
    setParameter(parameterKey, dateFormat.format(dateTime));
  }

  void setParameter(String parameterName, String value) {
    print('key: $parameterName | value: $value');
    parameters[parameterName] = '\'${value.replaceAll('\'', '')}\'';
  }

  Uri toHorizonsUri() {
    return new Uri.http('ssd.jpl.nasa.gov', '/horizons_batch.cgi', parameters);
  }

  @override
  String toString() {
    return parameters.toString();
  }
}
