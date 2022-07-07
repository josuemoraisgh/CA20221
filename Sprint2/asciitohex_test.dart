import 'package:test/test.dart';

import '../Sprint1/asciitohex.dart';

void main() {
  test('Deve dar erro quando valor em ascii for vazio', () {
    const String valorascii = '';
    expect(() => asciiToHex(valorascii), throwsA(TypeMatcher<ArgumentError>()));
  });

  test('Deve dar erro quando valor em ascii for maior que 2 caracteres', () {
    const String valorascii = '000';
    expect(() => asciiToHex(valorascii), throwsA(TypeMatcher<ArgumentError>()));
  });

  test('Deve dar erro quando valor em ascii receber caracteres que não são hex', () {
    const String valorascii = 'ÿþýüûúùø÷öõôóòñðïîíìëêéèçæåäãâáàßÞÝÜÛÚÙØ×ÖÕÔÓÒÑÐÐÏÎÍÌËÊÉÈÇÆÅÄÃÂÁÀ¿¡¢£¤¥¦§¨©ª«¬­®¯°±²³´µ¶·¸¹º»¼½¾';
    expect(() => asciiToHex(valorascii), throwsA(TypeMatcher<ArgumentError>()));
  });
  
}