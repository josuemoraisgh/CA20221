//global
// function strTime=hrtTypeHex2Time(strHex)//'XX XX XX XX' -> 0.03125
// var auxVet = hex2dec(tokens(strHex, ' '));
// var valor =
//     auxVet(1) * 524288 + auxVet(2) * 2048 + auxVet(3) * 8 + auxVet(4) * 0.03125;
// var modulo = valor % 1000;

String hx = '0x7FFFFFFF';
var hex = hx.substring(2);
int strHex = int.parse(hex, radix: 16);
int strHex1 = int.parse('7F', radix: 16);
int strHex2 = int.parse('FF', radix: 16);
int strHex3 = int.parse('FF', radix: 16);
int strHex4 = int.parse('FF', radix: 16);

var convertHex = (strHex * 0.03125 / 3600000);

void main() {
  print('$hx          (Valor Hexadecimal)'); //Valor Hexadecimal
  print(
      '$hex            (Valor Hexadecimal pronto para converter para decimal)'); // Valor Hexadecimal pronto para converter para decimal
  print(
      '$strHex          (Valor Convertido para decimal)'); //Valor Convertido para decimal
  print('\nValor em Horas é : $convertHex \n');
  print(strHex1 * 524288 / 3600000);
}
