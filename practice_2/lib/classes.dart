abstract class IAffectingClass {
  int get val;
  set val(int value);

  int method();

  static int staticDependency() => 2;
}

class AffectingClass implements IAffectingClass {
  @override
  int val = 0;

  @override
  int method() => 1;
}

class ClassUnderTest {
  final IAffectingClass _iAff;

  ClassUnderTest(IAffectingClass pAff) : _iAff = pAff;

  int publicMethod(int arg) => _privateMethod(arg);

  int protectedMethod(int arg) {
    if (arg != 0) {
      return _iAff.val;
    } else {
      throw ArgumentError('arg is equal to zero', 'arg');
    }
  }

  int _privateMethod(int arg) => _iAff.val > arg ? _iAff.val : arg;

  int callStatic() => IAffectingClass.staticDependency();
}

class ClassUnderTest2 {
  final AffectingClass _affInstance;

  ClassUnderTest2(AffectingClass pAffInstance) : _affInstance = pAffInstance;

  int callAffectingMethod() => _affInstance.method();
}
