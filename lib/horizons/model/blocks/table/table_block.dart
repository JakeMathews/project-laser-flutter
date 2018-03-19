import 'package:collection/collection.dart';
import 'package:project_lazer/horizons/model/blocks/table/table_entry.dart';
import 'package:project_lazer/util/time_util.dart' as TimeUtil;
import 'package:project_lazer/config.dart' as Config;

class TableBlock {
  final Map<DateTime, TableEntry> _table = {};

  void addEntry(final TableEntry tableEntry) {
    _table[tableEntry.dateTime] = tableEntry;
  }

  TableEntry getEntry(final DateTime dateTime) {
    return _table[dateTime];
  }

  TableEntry getRoundedEntry(final DateTime dateTime) {
    final DateTime roundedTime = TimeUtil.roundTime(dateTime, Config.stepSize);
    return getEntry(roundedTime);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is TableBlock &&
              runtimeType == other.runtimeType &&
              const MapEquality().equals(_table, other._table);


  @override
  int get hashCode => _table.hashCode;
}
