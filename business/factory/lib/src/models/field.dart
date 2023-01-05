import 'package:factory/src/exceptions/exceptions.dart';
import 'package:factory/src/models/coords.dart';
import 'package:factory/src/models/machine.dart';
import 'package:factory/src/models/slot.dart';
import 'package:factory/src/models/warehouse.dart';

class Field {
  final Coords size;
  final Map<Coords, Slot> _slots = {};

  final _inputWarehouse = Warehouse(size: 100);
  final _outputWarehouse = Warehouse(size: 100);

  Field({
    required this.size,
  }) {
    _initSlots();
  }

  void setMachine({
    required Coords coords,
    required Machine machine,
  }) {
    if (!size.contains(coords)) {
      throw OutOfAreaException();
    }

    (_slots[coords] as Slot).setMachine(machine);
  }

  void removeMachine({
    required Coords coords,
  }) {
    if (!size.contains(coords)) {
      throw OutOfAreaException();
    }

    (_slots[coords] as Slot).removeMachine();
  }

  void _initSlots() {
    for (int x = 0; x < size.x; x++) {
      for (int y = 0; y < size.y; y++) {
        final coords = Coords(x, y);

        if (!_slots.containsKey(coords)) {
          _slots.addAll({coords: Slot()});
        }
      }
    }
  }
}
