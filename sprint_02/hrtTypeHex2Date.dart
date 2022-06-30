//This program convert a hexadecimal string to date under the Hart Protocol
//Author: Eliel Prado
//The date is represented as: DDMMYY-1900

import 'dart:core';

dynamic hrtTypeHex2Date(String valorhex) {
  String hex2date = initialCheck(valorhex.toString());
  return hex2date;
}

initialCheck(String strHex) {
  strHex = strHex.toUpperCase(); //to avoid case sensitive errors
  //removing all non-hex characters and spaces
  strHex = strHex.replaceAll(RegExp(r'[^\w\s]+'), '');
  strHex = strHex.replaceAll(RegExp(' '), '');
  strHex = strHex.replaceAll(RegExp(r'([g-zG-Z!@#$%^&*ç~´`])'), '');
  print(strHex);
  checkLength(strHex); //checking if the string is correct length

  if (checkRange(strHex)) {
    if (checkNumber(strHex)) {
      return (doHrtTypeHex2Date(strHex.substring(0, 6)));
    } else {
      throw ArgumentError("Function checkNumber() reported invalid string");
    }
  } else {
    throw ArgumentError("Function checkRange() reported invalid range");
  }
}

String doHrtTypeHex2Date(String strHex) {
  List<String> auxVet = [];

  for (int i = 0; i <= strHex.length - 2; i += 2) {
    final hex = strHex.substring(i, i + 2);
    final toInt = int.parse(hex, radix: 16);
    if (toInt < 10) {
      String aux = '0' + toInt.toString();
      auxVet.add(aux);
    } else {
      auxVet.add(toInt.toString());
    }
  }

  auxVet[2] = (int.parse(auxVet[2]) + 1900).toString();

  String data = auxVet.join('/');
  return data;
}

void checkLength(String strHex) {
  if (strHex.length < 6 || strHex.isEmpty) {
    throw ArgumentError('Function checkLength() reported invalid length');
  }
  if (strHex.length > 6) {
    throw ArgumentError('Function checkLength() reported invalid length');
  }
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
    if (i == 0 && (aux <= 0 || aux > 31)) {
      print('Invalid day! ' +
          (strHex.substring(i, i + 2)) +
          ' value is out of range (01 - 31)');
      return false;
    }

    if (i == 2 && (aux <= 0 || aux > 12)) {
      print('Invalid month: ' +
          strHex.substring(i, i + 2) +
          ' value is out of range (01 - 12)');
      return false;
    }

    if (i == 4 && (aux < 0 || aux > 255)) {
      print('Invalid year: ' +
          strHex.substring(i, i + 2) +
          ' value is out of range (00 - 255)');
      return false;
    }
  }
  return true;
}
