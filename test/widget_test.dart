import 'package:flutter_test/flutter_test.dart';
import 'package:string_calculator_tdd_flutter/string_calculator.dart';

void main() {
  late StringCalculator calculator;

  setUp(() {
    calculator = StringCalculator();
  });

  test('returns 0 for empty string', () {
    expect(calculator.add(''), 0);
  });

  test('returns number itself for single number', () {
    expect(calculator.add('1'), 1);
  });

  test('returns sum of two numbers', () {
    expect(calculator.add('1,2'), 3);
  });

  test('returns sum of multiple comma-separated numbers', () {
    expect(calculator.add('1,2,3'), 6);
  });

  test('handles newline as delimiter', () {
    expect(calculator.add('1\n2,3'), 6);
  });

  test('supports single-character custom delimiter', () {
    expect(calculator.add('//;\n1;2'), 3);
  });

  test('throws for negative number', () {
    expect(() => calculator.add('1,-2,3'),
        throwsA(predicate((e) => e.toString().contains('negative numbers not allowed -2'))));
  });

  test('throws for multiple negative numbers', () {
    expect(() => calculator.add('-1,-2,3'),
        throwsA(predicate((e) => e.toString().contains('negative numbers not allowed -1,-2'))));
  });

  test('supports multi-character custom delimiter', () {
    expect(calculator.add('//[***]\n1***2***3'), 6);
  });

  test('supports multiple custom delimiters', () {
    expect(calculator.add('//[*][%]\n1*2%3'), 6);
  });

  test('supports multiple delimiters with multiple characters', () {
    expect(calculator.add('//[**][%%]\n1**2%%3'), 6);
  });
}
