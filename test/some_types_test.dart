import 'package:flutter_test/flutter_test.dart';
import 'package:weather_today/utils/same_types.dart';

void main() {
  test('Сравнение типов', () {
    bool checkInt<T>(T value) => sameTypes<T, int>();
    // bool checkNull<T>(T value) => sameTypes<T, Object?>();
    bool checkBool<T>(T value) => sameTypes<T, bool>();
    bool checkDynamic<T>(T value) => sameTypes<T, dynamic>();

    expect(checkInt(5), true);
    // expect(checkNull(null), true);
    expect(checkBool(true), true);
    const dynamic _dynamic = 5;
    expect(checkDynamic(_dynamic), true);
    expect(checkInt(_dynamic), false);
  });
}
