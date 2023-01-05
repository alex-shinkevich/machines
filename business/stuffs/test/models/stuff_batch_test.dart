import 'package:production/src/exceptions/exceptions.dart';
import 'package:production/src/models/stuff_batch.dart';
import 'package:production/src/models/stuffs.dart';
import 'package:test/test.dart';

void main() {
  group('StuffBatch', () {
    test('total size', () {
      expect(StuffBatch(stuff: Metal(), amount: 1).totalSize, Metal().size * 1);
      expect(StuffBatch(stuff: Metal(), amount: 4).totalSize, Metal().size * 4);
      expect(StuffBatch(stuff: Gear(), amount: 9).totalSize, Gear().size * 9);
    });

    test('can add', () {
      expect((StuffBatch(stuff: Metal(), amount: 1) + 4).totalSize, Metal().size * 5);
      expect((StuffBatch(stuff: Gear(), amount: 94) + 212).totalSize, Gear().size * (94 + 212));
    });

    test('throws an exception if adding makes total size negative', () {
      final batch = StuffBatch(stuff: Metal(), amount: 1);
      expect(() => batch + -2, throwsA(TypeMatcher<StuffBatchCannotBeNegative>()));
    });

    test('can remove', () {
      expect((StuffBatch(stuff: Metal(), amount: 10) - 4).totalSize, Metal().size * 6);
      expect((StuffBatch(stuff: Gear(), amount: 212) - 94).totalSize, Gear().size * (212 - 94));
      expect((StuffBatch(stuff: Gear(), amount: 5) - 5).totalSize, 0);
    });

    test('throws an exception if removing makes total size negative', () {
      final batch = StuffBatch(stuff: Metal(), amount: 1);
      expect(() => batch - 2, throwsA(TypeMatcher<StuffBatchCannotBeNegative>()));
    });
  });
}