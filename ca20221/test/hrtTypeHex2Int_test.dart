import 'package:test/test.dart';
import '../bin/hrtTypeHex2Int.dart';

void main() {
  test('Deve dar erro quando valor em hex for vazio', () {
    const String valorHex = '';
    expect(
        () => hrtTypeHex2Int(valorHex), throwsA(TypeMatcher<ArgumentError>()));
  });
  test('Deve dar erro quando valor em hex conter caracteres inválidos', () {
    const String valorHex = 'ff ff fg';
    expect(
        () => hrtTypeHex2Int(valorHex), throwsA(TypeMatcher<ArgumentError>()));
  });
  test('Deve calcular para 15 o valor "f"', () {
    const String valorHex = 'f';
    expect(hrtTypeHex2Int(valorHex), 15);
  });
  test('Deve calcular para 16777215 o valor "ff ff ff"', () {
    const String valorHex = 'ff ff ff';
    expect(hrtTypeHex2Int(valorHex), 16777215);
  });
  test('Deve calcular para 16777215 o valor "ffffff"', () {
    const String valorHex = 'ffffff';
    expect(hrtTypeHex2Int(valorHex), 16777215);
  });
}
