import 'package:factory/src/enums/direction.dart';
import 'package:factory/src/exceptions/exceptions.dart';
import 'package:factory/src/interfaces/conveyor_item.dart';
import 'package:stuffs/src/models/stuff_batch_collection.dart';

class Conveyor implements ConveyorItem {
  final Direction inputDirection;
  final Direction outputDirection;

  StuffBatchCollection? _collection;

  Conveyor({
    this.inputDirection = Direction.left,
    this.outputDirection = Direction.right,
  });

  @override
  void load(StuffBatchCollection collection) {
    if (_collection != null) {
      throw CannotLoadException();
    }

    _collection = collection;
  }

  @override
  void unload(StuffBatchCollection collection) {
    if (_collection == null) {
      throw CannotUnloadException();
    }

    _collection = null;
  }
}
