import 'package:mocktail/mocktail.dart';
import 'package:practice_2/classes.dart';
import 'package:test/test.dart';

class MockIAffectingClass extends Mock implements IAffectingClass {}

void main() {
  late MockIAffectingClass mockAffectingClass;
  late ClassUnderTest sut;

  setUp(() {
    mockAffectingClass = MockIAffectingClass();

    when(() => mockAffectingClass.val).thenReturn(10);

    sut = ClassUnderTest(mockAffectingClass);
  });

  group('ClassUnderTest.PublicMethod', () {
    test('Val property was called', () {
      sut.publicMethod(5);

      verify(() => mockAffectingClass.val).called(2);
    });

    final testCases = [(10, 5, 10), (5, 10, 10), (7, 7, 7), (0, 3, 3)];

    for (final (val, arg, expected) in testCases) {
      test('PublicMethod($arg), Val=$val => $expected', () {
        final affectingClass = AffectingClass();
        affectingClass.val = val;

        final sut = ClassUnderTest(affectingClass);

        expect(sut.publicMethod(arg), equals(expected));
      });
    }

    test('PublicMethod returns value from mocked dependency', () {
      final result = sut.publicMethod(5);

      expect(result, equals(10));
    });
  });

  group('ClassUnderTest2.CallAffectingMethod', () {
    test('returns result of AffectingClass.Method()', () {
      final affectingClass = AffectingClass();

      final sut = ClassUnderTest2(affectingClass);

      expect(sut.callAffectingMethod(), equals(1));
    });
  });
}
