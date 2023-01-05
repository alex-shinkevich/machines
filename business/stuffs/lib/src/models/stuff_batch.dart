import 'package:production/src/exceptions/exceptions.dart';
import 'package:production/src/interfaces/stuff.dart';

class StuffBatch {
  final Stuff stuff;
  final double amount;

  const StuffBatch({
    required this.stuff,
    required this.amount,
  }) : assert(amount >= 0);

  double get totalSize => stuff.size * amount;

  operator +(double amount) {
    if (this.amount + amount < 0) {
      throw StuffBatchCannotBeNegative();
    }

    return StuffBatch(stuff: stuff, amount: this.amount + amount);
  }

  operator -(double amount) {
    if (this.amount - amount < 0) {
      throw StuffBatchCannotBeNegative();
    }

    return StuffBatch(stuff: stuff, amount: this.amount - amount);
  }
}
