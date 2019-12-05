import 'package:flutter_test/flutter_test.dart';
import 'package:Calcuchat/calc.dart';



void main() {
  test('Testing simple additions', () {
    final counter = Calculator("2+33");

    String result = counter.calculate();

    expect(result, 5);
  });
}