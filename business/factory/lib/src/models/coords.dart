import 'package:equatable/equatable.dart';

class Coords with EquatableMixin {
  final int x;
  final int y;

  const Coords(this.x, this.y);

  bool contains(Coords coords) {
    return coords.x >= 0 && coords.x < x && coords.y >= 0 && coords.y < y;
  }

  @override
  List<Object?> get props => [x, y];
}
