import 'package:intl/intl.dart';
import 'package:project_lazer/data_capture/horizons_model/coordinates.dart';

class BatchFile {
  static const String COMMAND = 'COMMAND';
  static const String SITE_COORD = 'SITE_COORD';
  static const String START_TIME = 'START_TIME';
  static const String STOP_TIME = 'STOP_TIME';

  final Map<String, String> parameters;
  final DateFormat dateFormat = new DateFormat('yyyy-MM-dd');

  BatchFile(this.parameters) {
    setParameter('batch', '1');
  }

  void setTarget(final int targetCode) {
    setParameter(COMMAND, targetCode.toString());
  }

  void setSiteCoordinates(final Coordinates coordinates) {
    setParameter(SITE_COORD, coordinates.toString());
  }

  void setStartTime(final DateTime dateTime) {
    _setTime(START_TIME, dateTime);
  }

  void setStopTime(final DateTime dateTime) {
    _setTime(STOP_TIME, dateTime);
  }

  void _setTime(final String parameterKey, final DateTime dateTime) {
    parameters[parameterKey] = dateFormat.format(dateTime);
  }

  void setParameter(String parameterName, String value) {
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