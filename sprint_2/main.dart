//Programa para converter Hexadecimal para Data - Protocolo Hart
//Autor: Eliel Prado
//A data é representada por: DDMMYY-1900

void main() {
  String hex = '88 35 72 00';
  hrtTypeHex2Date(hex);
}

hrtTypeHex2Date(String strHex) {
  if (strHex.length < 6) {
    print("String Invalida");
    return -1;
  }
  //copy strHex to a vector of chars
  var strHexVector = strHex.split(' ');
  int day = int.parse(strHexVector.elementAt(0), radix: 16);
  int month = int.parse(strHexVector.elementAt(1), radix: 16);
  int year = 1900 + (int.parse(strHexVector.elementAt(2), radix: 16));
  //print date in format dd/mm/yyyy
  print(day.toString() + '/' + month.toString() + '/' + year.toString());
}
