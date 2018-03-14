import 'package:project_lazer/horizons/model/blocks/requester_info/requester_info_block.dart';

import '../../../../equals_hash_test_helper.dart';

// Needed to improve coverage
void main() {
  final String dataType = 'Ephemeris';
  final String requesterType = 'WWW_USER';
  final DateTime requestedTime = new DateTime(2018, 03, 07, 19, 56, 26);
  final String serverLocation = 'Pasadena, USA';
  final String systemName = 'Horizons';
  final RequesterInfoBlock requesterInfoBlock =
      new RequesterInfoBlock(dataType, requesterType, requestedTime, serverLocation, systemName);
  final EqualsHashTest equalsHashTest =
      new EqualsHashTest('${requesterInfoBlock.runtimeType} hash() and equals() test', requesterInfoBlock);
  equalsHashTest.runTest();
}
