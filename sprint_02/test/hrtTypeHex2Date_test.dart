import 'package:test/test.dart';
import '../hrtTypeHex2Date.dart';

void main() {
  test('Deve sair o seguinte valor na saida', () {
    const String valorHex = '';
    expect(
        () => hrtTypeHex2Date(valorHex), throwsA(TypeMatcher<ArgumentError>()));
  });
  test('Deve sair o seguinte valor na saida', () {
    const String valorHex = '000000';
    expect(
        () => hrtTypeHex2Date(valorHex), throwsA(TypeMatcher<ArgumentError>()));
  });
  test('Deve sair o seguinte valor na saida', () {
    const String valorHex = '0100f0';
    expect(
        () => hrtTypeHex2Date(valorHex), throwsA(TypeMatcher<ArgumentError>()));
  });
  test('Deve sair o seguinte valor na saida', () {
    const String valorHex = '';
    expect(
        () => hrtTypeHex2Date(valorHex), throwsA(TypeMatcher<ArgumentError>()));
  });
  test('Deve sair o seguinte valor na saida', () {
    const String valorHex = '000100';
    expect(
        () => hrtTypeHex2Date(valorHex), throwsA(TypeMatcher<ArgumentError>()));
  });
  test('Deve sair o seguinte valor na saida', () {
    const String valorHex = 'ffffff';
    expect(
        () => hrtTypeHex2Date(valorHex), throwsA(TypeMatcher<ArgumentError>()));
  });

  test('Deve calcular para 00FF09 o valor 255', () {
    const String valorHex = '010c09';
    expect(hrtTypeHex2Date(valorHex), '01/12/1909');
  });
}
