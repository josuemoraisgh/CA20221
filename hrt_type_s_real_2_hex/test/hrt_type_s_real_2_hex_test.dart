import 'package:hrt_type_s_real_2_hex/hrt_type_s_real_2_hex.dart';
import 'package:test/test.dart';

void main() {
  test('Deve calcular para 3.14 o valor 0x40400000', () {
    const double valorReal = 3.14;
    expect(hrtTypeSReal2Hex(valorReal), "40400000");
  });

  test('Deve dar erro quando o valor do double (real) for menor em modulo que 0.0000000000000001', (){
  const double valorReal = 0.0000000000000001;
  expect(() => hrtTypeSReal2Hex(valorReal), throwsA(TypeMatcher<ArgumentError>()));
  });
}
