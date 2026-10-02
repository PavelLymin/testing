class Calculator {
  const Calculator();

  int add(int a, int b) => a + b;

  int multiply(int a, int b) => a * b;

  String getName() => 'Calculator';

  Object getObject() => Object();

  void throwError() => throw ArgumentError('Invalid argument');

  int divide(int a, int b) {
    if (b == 0) throw ArgumentError('Division by zero');

    return a ~/ b;
  }
}
