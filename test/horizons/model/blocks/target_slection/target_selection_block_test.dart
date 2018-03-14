import 'package:project_lazer/horizons/model/blocks/target_selection/target_selection_block.dart';

import '../../../../equals_hash_test_helper.dart';

// Needed to improve coverage
void main() {
  final TargetSelectionBlock targetSelectionBlock = new TargetSelectionBlock();
  final EqualsHashTest equalsHashTest =
      new EqualsHashTest('${targetSelectionBlock.runtimeType} hash() and equals() test', targetSelectionBlock);
  equalsHashTest.runTest();
}
