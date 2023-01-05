abstract class FactoryException implements Exception {}

class CannotSetMachine implements FactoryException {}

class CannotSetManipulator implements FactoryException {}

class OutOfAreaException implements FactoryException {}

class CannotLoadException implements FactoryException {}

class CannotUnloadException implements FactoryException {}