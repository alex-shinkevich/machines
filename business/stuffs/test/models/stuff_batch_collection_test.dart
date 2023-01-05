import 'package:production/src/exceptions/exceptions.dart';
import 'package:production/src/models/stuff_batch.dart';
import 'package:production/src/models/stuff_batch_collection.dart';
import 'package:production/src/models/stuffs.dart';
import 'package:test/test.dart';

void main() {
  group('StuffBatchCollection', () {
    test('can add', () {
      final collection = StuffBatchCollection.empty();
      collection.add([
        StuffBatch(stuff: Metal(), amount: 1),
      ]);

      expect(collection.batches.length, 1);
      expect(collection.batches.first.amount, 1);
      expect(collection.batches.first.stuff.runtimeType, Metal);

      collection.add([
        StuffBatch(stuff: Gear(), amount: 4),
      ]);

      expect(collection.batches.length, 2);
      expect(collection.batches.first.amount, 1);
      expect(collection.batches.first.stuff.runtimeType, Metal);
      expect(collection.batches[1].amount, 4);
      expect(collection.batches[1].stuff.runtimeType, Gear);
    });

    test('can add several batches', () {
      final collection = StuffBatchCollection.empty();

      collection.add([
        StuffBatch(stuff: Metal(), amount: 1),
        StuffBatch(stuff: Gear(), amount: 4),
      ]);

      expect(collection.batches.length, 2);
      expect(collection.batches.first.amount, 1);
      expect(collection.batches.first.stuff.runtimeType, Metal);
      expect(collection.batches[1].amount, 4);
      expect(collection.batches[1].stuff.runtimeType, Gear);

      collection.add([
        StuffBatch(stuff: Metal(), amount: 10),
        StuffBatch(stuff: Gear(), amount: 44),
      ]);

      expect(collection.batches.length, 2);
      expect(collection.batches.first.amount, 11);
      expect(collection.batches.first.stuff.runtimeType, Metal);
      expect(collection.batches[1].amount, 48);
      expect(collection.batches[1].stuff.runtimeType, Gear);
    });

    test('can remove', () {
      final collection = StuffBatchCollection.empty();
      collection.add([
        StuffBatch(stuff: Metal(), amount: 10),
      ]);

      collection.remove([
        StuffBatch(stuff: Metal(), amount: 5),
      ]);

      expect(collection.batches.length, 1);
      expect(collection.batches.first.amount, 5);
      expect(collection.batches.first.stuff.runtimeType, Metal);

      collection.remove([
        StuffBatch(stuff: Metal(), amount: 5),
      ]);

      expect(collection.batches.length, 0);
    });

    test('can remove several batches', () {
      final collection = StuffBatchCollection.empty();
      collection.add([
        StuffBatch(stuff: Metal(), amount: 10),
        StuffBatch(stuff: Gear(), amount: 44),
      ]);

      collection.remove([
        StuffBatch(stuff: Metal(), amount: 5),
        StuffBatch(stuff: Gear(), amount: 22),
      ]);

      expect(collection.batches.length, 2);
      expect(collection.batches.first.amount, 5);
      expect(collection.batches.first.stuff.runtimeType, Metal);
      expect(collection.batches[1].amount, 22);
      expect(collection.batches[1].stuff.runtimeType, Gear);

      collection.remove([
        StuffBatch(stuff: Metal(), amount: 5),
        StuffBatch(stuff: Gear(), amount: 22),
      ]);

      expect(collection.batches.length, 0);
    });

    test('throws an exception if some of batches becomes negative', () {
      final collection = StuffBatchCollection.empty();
      collection.add([
        StuffBatch(stuff: Metal(), amount: 10),
        StuffBatch(stuff: Gear(), amount: 44),
      ]);

      expect(() {
        collection.remove([
          StuffBatch(stuff: Metal(), amount: 11),
        ]);
      }, throwsA(TypeMatcher<StuffBatchCannotBeNegative>()));
    });

    test('can group batches', () {
      final collection = StuffBatchCollection.empty()
        ..add([
          StuffBatch(stuff: Metal(), amount: 9),
        ])
        ..add([
          StuffBatch(stuff: Gear(), amount: 4),
        ]);

      expect(collection.batches.length, 2);

      collection.add([
        StuffBatch(stuff: Gear(), amount: 4),
      ]);

      expect(collection.batches.length, 2);
    });

    test('calculates total size', () {
      final collection = StuffBatchCollection.empty()
        ..add([
          StuffBatch(stuff: Metal(), amount: 9),
        ])
        ..add([
          StuffBatch(stuff: Gear(), amount: 4),
        ]);

      expect(collection.totalSize, Metal().size * 9 + Gear().size * 4);

      collection.add([
        StuffBatch(stuff: Metal(), amount: 10),
      ]);

      expect(collection.totalSize, Metal().size * 19 + Gear().size * 4);
    });
  });
}
