import 'package:flutter_test/flutter_test.dart';

// Needed for improving coverage on simple objects
class EqualsHashTest {
  final String description;
  final Object object;

  EqualsHashTest(this.description, this.object) {
    runTest();
  }

  void runTest() {
    test(this.description, () {
      expect(this.object, this.object);
      expect(this.object.hashCode, this.object.hashCode);
    });
  }
}
