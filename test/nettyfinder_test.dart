import 'package:nettyfinder/nettyfinder.dart';
import 'package:test/test.dart';

void main() {
  group('Test for number validation', () {
    final netFinder = NetworkTypeDetect('+2347012345678');

    setUp(() {
      // Additional setup goes here.
    });

    test('First Test', () {
      expect(netFinder() != null, isTrue);
    });
  });
}
