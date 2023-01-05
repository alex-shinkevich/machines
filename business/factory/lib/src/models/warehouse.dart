import 'package:factory/src/interfaces/conveyor_item.dart';
import 'package:stuffs/production.dart';

class Warehouse implements ConveyorItem {
  final double size;

  final _collection = StuffBatchCollection.empty();

  Warehouse({
    required this.size,
  });

  @override
  void load(StuffBatchCollection collection) {
    if (_collection.totalSize + collection.totalSize > size) {
      throw CannotLoadException();
    }

    _collection.add(collection.batches);
  }

  @override
  void unload(StuffBatchCollection collection) {
    if (!_collection.has(collection.batches)) {
      throw CannotUnloadException();
    }

    _collection.remove(collection.batches);
  }
}
