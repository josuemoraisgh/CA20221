import 'package:sprint_2/hrtTypeTime2Hex.dart';
import 'package:test/test.dart';

void main() {
  test('Deve retornar erro quando a entrada for nula ', () {
    const string_teste = '';
    expect(() => hrtTypeTime2Hex(''), throwsA(TypeMatcher<ArgumentError>()));
  });

  test('Deve retornar erro quando a entrada de tempo for invalida', () {
    const string_teste = '';
    expect(() => hrtTypeTime2Hex(''), throwsA(TypeMatcher<ArgumentError>()));
  });

  test('Deve calcular o valor 44 1A 39 10 quando a entrada for 20:10:50:125 ',
      () {
    const String string_teste = '20:10:50:125';
    expect(hrtTypeTime2Hex(string_teste), '44 1A 39 10');
  });
}
