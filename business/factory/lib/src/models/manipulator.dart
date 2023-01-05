import 'package:factory/src/enums/direction.dart';

class Manipulator {
  final Direction from;
  final Direction to;
  final Duration time;

  const Manipulator({
    required this.from,
    required this.to,
    required this.time,
  });
}
