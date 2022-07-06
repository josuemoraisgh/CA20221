import 'package:test/test.dart';
import '../../sprint_02/hrtTypeHex2Date.dart';

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

  test('Exceção devido ao valor do mes', () {
    const String valorHex = '0100f0';
    expect(
        () => hrtTypeHex2Date(valorHex), throwsA(TypeMatcher<ArgumentError>()));
  });

  test('Exceção devido a string nula', () {
    const String valorHex = '';
    expect(
        () => hrtTypeHex2Date(valorHex), throwsA(TypeMatcher<ArgumentError>()));
  });

  test('Deve haver exceção devido ao valor do dia', () {
    const String valorHex = '000100';
    expect(
        () => hrtTypeHex2Date(valorHex), throwsA(TypeMatcher<ArgumentError>()));
  });

  test('Exceção Valores de dia e mes fora do range', () {
    const String valorHex = 'ffffff';
    expect(
        () => hrtTypeHex2Date(valorHex), throwsA(TypeMatcher<ArgumentError>()));
  });

  test('Deve calcular a data em hexa 010c09 para 01/12/1909', () {
    const String valorHex = '010c09';
    expect(hrtTypeHex2Date(valorHex), '01/12/1909');
  });

  test('Deve corrigir a string (removendo caracteres não hexa)', () {
    const String valorHex = '01@0~1g00';
    expect(hrtTypeHex2Date(valorHex), '01/01/1900');
  });

  test('Deve remover todos os espaços', () {
    const String valorHex = '0 1 0 1 0 0';
    expect(hrtTypeHex2Date(valorHex), '01/01/1900');
  });

//leap year test
  test('Deve retornar uma data válida', () {
    const String valorHex = '1e097c';
    expect(hrtTypeHex2Date(valorHex), '30/09/2024');
  });

  test('Data invalida ano não bissexto', () {
    const String valorHex = '1d027b';
    expect(
        () => hrtTypeHex2Date(valorHex), throwsA(TypeMatcher<ArgumentError>()));
  });
  test('Deve retornar uma data válida num ano não bissexto', () {
    const String valorHex = '1c027b';
    expect(hrtTypeHex2Date(valorHex), '28/02/2023');
  });
  test('Deve retornar uma data válida num ano bissexto', () {
    const String valorHex = '1d027c';
    expect(hrtTypeHex2Date(valorHex), '29/02/2024');
  });

  test('Data invalida mes abril', () {
    const String valorHex = '1f047b';
    expect(
        () => hrtTypeHex2Date(valorHex), throwsA(TypeMatcher<ArgumentError>()));
  });
  test('Data invalida mes jun', () {
    const String valorHex = '1f067b';
    expect(
        () => hrtTypeHex2Date(valorHex), throwsA(TypeMatcher<ArgumentError>()));
  });
  test('Data invalida mes set', () {
    const String valorHex = '1f097b';
    expect(
        () => hrtTypeHex2Date(valorHex), throwsA(TypeMatcher<ArgumentError>()));
  });

  test('Data invalida mes nov', () {
    const String valorHex = '1f0b7b';
    expect(
        () => hrtTypeHex2Date(valorHex), throwsA(TypeMatcher<ArgumentError>()));
  });
}
