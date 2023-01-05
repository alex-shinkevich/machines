import 'dart:async';

import 'package:factory/src/enums/direction.dart';
import 'package:factory/src/exceptions/exceptions.dart';
import 'package:factory/src/models/machine.dart';
import 'package:factory/src/models/manipulator.dart';

class Slot {
  final _streamController = StreamController<Slot>.broadcast();

  Machine? _machine;
  Machine? get machine => _machine;

  Stream<Slot> get onChange => _streamController.stream;

  Map<Direction, Manipulator> _manipulators = {};

  void setMachine(Machine machine) {
    if (_machine != null) {
      throw CannotSetMachine();
    }

    _machine = machine;
    _streamController.add(this);
  }

  void removeMachine() {
    _machine = null;
    _streamController.add(this);
  }

  void addManipulator({
    required Direction direction,
    required Manipulator manipulator,
  }) {
    if (_manipulators.containsKey(direction)) {
      throw CannotSetManipulator();
    }

    _manipulators[direction] = manipulator;
    _streamController.add(this);
  }

  void removeManipulator({
    required Direction direction,
  }) {
    _manipulators.remove(direction);
    _streamController.add(this);
  }
}
