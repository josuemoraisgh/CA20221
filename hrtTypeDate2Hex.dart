import 'dart:core';
import 'package:intl/intl.dart';

void main() {
  final DateTime  now = DateTime.now();
  final DateFormat df = DateFormat('yyyy-MM-dd');
  final String date = df.format(now);
  print(date);
  hrtTypeDate2Hex(date);
}

 hrtTypeDate2Hex(String strDate) {
  if (strDate.length < 8) {
    print("String Invalida");
    return -1;
  }
  //converte de data para hex
 String hrtTypeDate2Hex(date) { 
  var strDateVector = strDate.split('/');
  final hex = strDateVector.toRadixString(16);
  final size = 4 - hex.length; // Complementa os dígitos faltantes com zero
  print(hex);
}

// function strDate=hrtTypeHex2Date(strHex)
  //  auxVet = hex2dec(tokens(strHex,' '));
  //  strDate = msprintf("%02d/%02d/%04d",auxVet(1),auxVet(2),1900+auxVet(3));
// endfunction