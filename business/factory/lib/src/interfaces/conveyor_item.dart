import 'package:stuffs/production.dart';

abstract class ConveyorItem {
  void load(StuffBatchCollection collection);
  void unload(StuffBatchCollection collection);
}