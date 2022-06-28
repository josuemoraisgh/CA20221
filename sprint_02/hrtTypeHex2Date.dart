//This program convert a hexadecimal string to date under the Hart Protocol
//Author: Eliel Prado
//The date is represented as: DDMMYY-1900

import 'dart:core';

void main(dynamic valorhex) {
  initialCheck(valorhex.toString());
}

initialCheck(String strHex) {
  strHex = strHex.toUpperCase(); //to avoid case sensitive errors
  //removing all non-hex characters and spaces
  strHex = strHex.replaceAll(RegExp(r'[^\w\s]+'), '');
  strHex = strHex.replaceAll(RegExp(' '), '');
  String newStr = checkLength(strHex);
  print("input string: $newStr");

  if (checkRange(strHex)) {
    if (checkNumber(strHex)) {
      print('A data referente a ' +
          strHex.substring(0, 6) +
          ' é: ' +
          hrtTypeHex2Date(strHex.substring(0, 6)));
    }
  }
}

String hrtTypeHex2Date(String strHex) {
  var auxVet = [];

  for (int i = 0; i <= strHex.length - 2; i += 2) {
    final hex = strHex.substring(i, i + 2);
    final toInt = int.parse(hex, radix: 16);
    if (toInt < 10) {
      String aux = '0' + toInt.toString();
      auxVet.add(aux);
    } else {
      auxVet.add(toInt);
    }
  }

  auxVet[2] = auxVet[2] + 1900;
  String data = auxVet.join('/');
  return data;
}

String checkLength(String strHex) {
  String myHex = "";
  if (strHex.length < 6 || strHex.isEmpty) {
    throw Exception('Invalid Length');
  }

  if (strHex.length > 6) {
    myHex = strHex.substring(0, 6);
  }
  return myHex;
}

bool checkRange(String strHex) {
  for (int i = 0; i <= 5; i++) {
    if ('F'.codeUnitAt(0) < strHex.substring(i, i + 1).codeUnitAt(0)) {
      print('Character(s) out of range (A - F). Letter not allowed: ' +
          strHex.substring(i, i + 1));
      return false;
    }
  }
  return true;
}

bool checkNumber(String strHex) {
  for (int i = 0; i <= 5; i += 2) {
    final twoChar = strHex.substring(i, i + 2); //takes two characters at a time
    final aux = int.parse(twoChar, radix: 16);
    if (i == 0 && aux > 31) {
      print('Invalid day: ' +
          (strHex.substring(i, i + 2)) +
          ' value is greater than 31');
      return false;
    }
    if (i == 2 && aux > 12) {
      print('Invalid month: ' +
          strHex.substring(i, i + 2) +
          ' value is greater than 12');
      return false;
    }
  }
  return true;
}
