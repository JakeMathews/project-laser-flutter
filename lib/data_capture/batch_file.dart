import 'package:intl/intl.dart';
import 'package:project_lazer/data_capture/batch_file_model/coordinates.dart';

class BatchFile {
  static const String SITE_COORD = 'SITE_COORD';
  static const String START_TIME = 'START_TIME';
  static const String END_TIME = 'END_TIME';
  static const String STEP_SIZE = 'STEP_SIZE';
  static const String QUANTITIES = 'QUANTITIES';

  final Map<String, String> parameters;
  final DateFormat dateFormat = new DateFormat('yyyy-MM-dd');

  BatchFile(this.parameters);

  void setSiteCoordinates(final Coordinates coordinates) {
    parameters[SITE_COORD] = coordinates.toString();
  }

  void setStartTime(final DateTime dateTime) {
    _setTime(START_TIME, dateTime);
  }

  void setEndTime(final DateTime dateTime) {
    _setTime(END_TIME, dateTime);
  }

  void _setTime(final String parameterKey, final DateTime dateTime) {
    parameters[parameterKey] = dateFormat.format(dateTime);
  }

  void setStepSize(final int size) {
    parameters[STEP_SIZE] = size.toString();
  }

  void setQuantities(final int quantities) {
    parameters[QUANTITIES] = quantities.toString();
  }

  @override
  String toString() {
    return parameters.toString();
  }
}