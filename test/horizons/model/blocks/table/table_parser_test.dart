import 'package:project_lazer/horizons/horizons_block_parser.dart';
import 'package:project_lazer/horizons/model/blocks/table/table_block.dart';
import 'package:project_lazer/horizons/model/blocks/table/table_entry.dart';
import 'package:project_lazer/horizons/model/blocks/table/table_parser.dart';

import '../block_parser_test_helper.dart';

void main() {
  new TableParserTest(new TableParser());
}

class TableParserTest extends BlockParserTest {
  TableParserTest(HorizonsBlockParser blockParser) : super(blockParser);

  @override
  Object createExpectedBlock() {
    final TableBlock tableBlock = new TableBlock();

    final DateTime dateTime = new DateTime.utc(2018, 03, 18, 18, 25);
    final SolarPresence solarPresence = SolarPresence.astronomicalTwilight;
    final LunarPresence lunarPresence = LunarPresence.belowApparentHorizon;
    final double azimuth = 333.1149;
    final double elevation = -64.7770;
    final TableEntry tableEntry = new TableEntry(dateTime, solarPresence, lunarPresence, azimuth, elevation);
    tableBlock.addEntry(tableEntry);

    return tableBlock;
  }

  @override
  String getBlockText() {
    return r'''
$$SOE
 2018-Mar-18 18:25,A, ,333.1149,-64.7770,
$$EOE
''';
  }
}
