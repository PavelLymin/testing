import 'package:practice_2/classes.dart';
import 'package:test/test.dart';

void main() {
  group('ClassUnderTest.protectedMethod', () {
    test('returns Val when arg is not zero', () {
      final affectingClass = AffectingClass();
      affectingClass.val = 10;

      final sut = ClassUnderTest(affectingClass);

      expect(sut.protectedMethod(5), equals(10));
    });

    test('throws ArgumentError when arg is zero', () {
      final affectingClass = AffectingClass();
      affectingClass.val = 10;

      final sut = ClassUnderTest(affectingClass);

      expect(() => sut.protectedMethod(0), throwsA(isA<ArgumentError>()));
    });
  });
}
