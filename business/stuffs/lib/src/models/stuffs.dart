import 'package:production/src/interfaces/stuff.dart';

class Metal implements Stuff {
  @override
  double get size => 4;

  @override
  String get title => 'Metal';
}

class Gear implements Stuff {
  @override
  double get size => .1;

  @override
  String get title => 'Gear';
}

class MetalTube implements Stuff {
  @override
  double get size => .3;

  @override
  String get title => 'Metal tube';
}
