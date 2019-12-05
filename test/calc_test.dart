import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app/calc.dart';



void main() {
  test('Testing simple additions', () {
    final counter = Calculator("2+3")

    num result = counter.calculate();

    expect(result, 5);
  });
}