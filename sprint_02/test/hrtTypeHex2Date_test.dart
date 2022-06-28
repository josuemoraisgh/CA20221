import 'package:test/test.dart';
import '../hrtTypeHex2Date.dart';

void main() {
  test('Deve sair o seguinte valor na saida', () {
    const String valorHex = '';
    expect(
        () => hrtTypeHex2Date(valorHex), throwsA(TypeMatcher<ArgumentError>()));
  });

  test('Deve calcular para 00FF09 o valor 255', () {
    const String valorHex = '00ff';
    expect(hrtTypeHex2Date(valorHex), 255);
  });
}
