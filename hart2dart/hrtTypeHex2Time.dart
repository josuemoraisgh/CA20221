//Parâmetros
var ConverttoMs = 0.03125;
var ConverttoHours = 3600000;

//Global
String hx = '0xFFFFFFFF'; // String em hexadecimal - escala "Unsigned"
var hex = hx.substring(2); //Remove os dois primeiros caracteres da string
int strHex = int.parse(hex,
    radix: 16); //Valor converitdo com range de 0 a 4294967295, em decimal
var convertHex = (strHex *
    ConverttoMs /
    ConverttoHours); //Aplica conversões do valor decimal para obter as horas

void main() {
  print('$hx          (Valor Hexadecimal)'); //Valor Hexadecimal
  print(
      '$hex            (Valor Hexadecimal pronto para converter para decimal)'); // Valor Hexadecimal pronto para converter para decimal
  print(
      '$strHex          (Valor Convertido para decimal)'); //Valor Convertido para decimal
  print('\nValor em Horas é: $convertHex \n');
}
