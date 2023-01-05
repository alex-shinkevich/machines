import 'package:factory/src/interfaces/conveyor_item.dart';
import 'package:factory/src/models/warehouse.dart';
import 'package:stuffs/production.dart';

class Machine implements ConveyorItem {
  final StuffBatchCollection input;
  final StuffBatchCollection output;
  final Duration productionTime;
  final Warehouse _warehouse;

  Machine({
    required this.input,
    required this.output,
    required this.productionTime,
  }) : _warehouse = Warehouse(size: input.totalSize + output.totalSize);

  @override
  void load(StuffBatchCollection collection) {
    _warehouse.load(collection);
  }

  @override
  void unload(StuffBatchCollection collection) {
    _warehouse.unload(collection);
  }
}
