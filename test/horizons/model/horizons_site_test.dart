import 'package:flutter_test/flutter_test.dart';
import 'package:project_lazer/horizons/model/blocks/target_selection/horizons_site.dart';

// Needed to improve coverage
void main() {
  test('Testing HorizonsSite equals and hash', () {
    final String targetName = 'mars';
    final int targetCode = 499;
    final HorizonsSite horizonsSite = new HorizonsSite(targetName, targetCode);
    expect(horizonsSite == horizonsSite, true);
    expect(horizonsSite.hashCode, targetName.hashCode ^ targetCode.hashCode);
  });
}