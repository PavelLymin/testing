import 'package:unit_testing/unit_testing.dart';
import 'package:test/test.dart';

void main() {
  late Calculator calculator;

  // аналог TestInitialize
  setUp(() => calculator = const Calculator());

  // аналог TestCleanUp
  tearDown(() {
    // очистка после каждого теста
  });

  // аналог TestClass
  group('Calculator tests', () {
    // аналог TestMethod и Assert.AreEqual
    test(
      'add should return correct sum',
      () => expect(calculator.add(2, 3), equals(5)),
    );

    // аналог Assert.IsTrue
    test(
      'result should be positive',
      () => expect(calculator.multiply(3, 4) > 0, isTrue),
    );

    // аналог Assert.IsNull
    test('null value should really be null', () {
      String? value;
      expect(value, isNull);
    });

    // аналог Assert.AreSame
    test('two variables should reference the same object', () {
      final object = <String>[];
      final anotherReference = object;

      expect(identical(object, anotherReference), isTrue);
    });

    // аналог Assert.InstanceOfType
    test('result should have correct type', () {
      final result = calculator.getName();

      expect(result, isA<String>());
    });

    // аналог Assert.ThrowsException<T>
    test(
      'divide by zero should throw ArgumentError',
      () =>
          expect(() => calculator.divide(10, 0), throwsA(isA<ArgumentError>())),
    );

    // аналог DataTestMethod и DataRow
    group('addition with different data', () {
      final testData = <List<int>>[
        [1, 2, 3],
        [5, 5, 10],
        [-2, 2, 0],
        [10, 20, 30],
      ];

      for (final row in testData) {
        test('add(${row[0]}, ${row[1]}) should return ${row[2]}', () {
          expect(calculator.add(row[0], row[1]), equals(row[2]));
        });
      }
    });
  });
}
