import 'package:production/src/models/stuff_batch.dart';

class StuffBatchCollection {
  final Map<Type, StuffBatch> _batches;

  StuffBatchCollection.empty() : _batches = {};

  StuffBatchCollection.from(List<StuffBatch> batches) : _batches = {} {
    for (final batch in batches) {
      final key = _key(batch);

      _batches[key] = batch;
    }
  }

  List<StuffBatch> get batches => _batches.values.toList(growable: false);

  double get totalSize => batches.map((batch) => batch.totalSize).fold(0, (a, b) => a + b);

  void add(List<StuffBatch> batches) {
    for (final batch in batches) {
      final key = _key(batch);

      if (_batches.containsKey(key)) {
        _batches.update(key, (value) => value + batch.amount);
      } else {
        _batches.addAll({key: batch});
      }
    }
  }

  void remove(List<StuffBatch> batches) {
    for (final batch in batches) {
      final key = _key(batch);

      _batches.update(key, (value) => value - batch.amount);

      if (_batches[key]?.amount == 0) {
        _batches.remove(key);
      }
    }
  }

  bool has(List<StuffBatch> batches) {
    for (final batch in batches) {
      final key = _key(batch);

      if (!_batches.containsKey(key) || _batches[key]!.amount < batch.amount) {
        return false;
      }
    }

    return true;
  }

  Type _key(StuffBatch batch) {
    return batch.stuff.runtimeType;
  }
}
