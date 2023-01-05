class ProductionException implements Exception {
  final String? message;

  ProductionException([this.message]);
}

class CannotLoadException extends ProductionException {}

class CannotUnloadException extends ProductionException {}

class StuffBatchCannotBeNegative extends ProductionException {}