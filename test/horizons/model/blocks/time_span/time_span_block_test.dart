import 'package:project_lazer/horizons/model/blocks/time_span/time_span_block.dart';

import '../../../../equals_hash_test_helper.dart';

// Needed to improve coverage
void main() {
  final DateTime time = new DateTime.now();
  final Duration duration = new Duration(days: 1);
  final TimeSpanBlock timeSpanBlock = new TimeSpanBlock(time, time, duration);
  final EqualsHashTest equalsHashTest =
      new EqualsHashTest('${timeSpanBlock.runtimeType} hash() and equals() test', timeSpanBlock);
  equalsHashTest.runTest();
}
