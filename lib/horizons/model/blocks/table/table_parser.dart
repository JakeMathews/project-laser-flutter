import 'package:intl/intl.dart';
import 'package:project_lazer/horizons/horizons_block_parser.dart';
import 'package:project_lazer/horizons/model/blocks/table/table_block.dart';
import 'package:project_lazer/horizons/model/blocks/table/table_entry.dart';

enum Columns { dateTime, solarPresence, lunarPresence, azimuth, elevation }

class TableParser extends HorizonsBlockParser {
  final DateFormat dateFormat = new DateFormat('yyyy-MMM-dd hh:mm');

  @override
  bool parserApplies(final String firstLine) {
    return firstLine.trim() == r'$$SOE';
  }

  @override
  Object parse(final String blockText) {
    final TableBlock tableBlock = new TableBlock();

    for (final String rawLine in blockText.split('\n')) {
      final String line = rawLine.trim();
      if (line.isEmpty || line == r'$$SOE' || line == r'$$EOE') {
        continue;
      }

      final TableEntry tableEntry = parseEntry(line.split(','));
      tableBlock.addEntry(tableEntry);
    }

    return tableBlock;
  }

  TableEntry parseEntry(List<String> values) {
    final String dateText = values[Columns.dateTime.index].trim();
    final DateTime dateTime = dateFormat.parseLoose(dateText, true);

    final String solarPresenceSymbol = values[Columns.solarPresence.index];
    final SolarPresence solarPresence = solarPresenceSymbolMap[solarPresenceSymbol];

    final String lunarPresenceSymbol = values[Columns.lunarPresence.index];
    final LunarPresence lunarPresence = lunarPresenceSymbolMap[lunarPresenceSymbol];

    double azimuth = double.parse(values[Columns.azimuth.index]);
    double elevation = double.parse(values[Columns.elevation.index]);

    return new TableEntry(dateTime, solarPresence, lunarPresence, azimuth, elevation);
  }
}
