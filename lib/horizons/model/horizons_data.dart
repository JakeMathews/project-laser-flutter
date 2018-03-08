import 'package:project_lazer/horizons/model/horizons_data_entry.dart';

class HorizonsData {
  DateTime requestedTime;

  // Target
  String targetBodyName;
  int targetBodyCode;

  // Time
  DateTime startTime;
  DateTime stopTime;
  String stepSize;

  // Data
  List<String> columnNames;
  List<HorizonsDataEntry> dataEntries;
}
