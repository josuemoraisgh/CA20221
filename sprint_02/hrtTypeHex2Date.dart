//This program convert a hexadecimal string to date under the Hart Protocol
//Author: Eliel Prado
//The date is represented as: DDMMYY-1900

import 'dart:async';
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
  //print(strHex);
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
  if (checkDate(auxVet[0], auxVet[1], auxVet[2])) {
    String data = auxVet.join('/');
    return data;
  } else {
    throw ArgumentError("Function checkDate() reported invalid date");
  }
}

bool checkDate(String day, String mon, String year) {
  //print(day);
  //print(mon);
  //print(year);
  //convert day into int
  int d = int.parse(day);
  int m = int.parse(mon);
  int y = int.parse(year);

  if (((y % 4 == 0) && (y % 100 != 0)) || (y % 400 == 0)) {
    //print("$y is a leap year");
    if (m == 2) {
      if (d <= 29) {
        return true;
      } else {
        return false;
      }
    } else {
      if (m == 1 ||
          m == 3 ||
          m == 5 ||
          m == 7 ||
          m == 8 ||
          m == 10 ||
          m == 12) {
        if (d <= 31) {
          return true;
        } else {
          return false;
        }
      } else {
        if (d <= 30) {
          return true;
        } else {
          return false;
        }
      }
    }
  } else {
    //print("$y is not a leap year");
    if (m == 2) {
      if (d <= 28) {
        return true;
      } else {
        return false;
      }
    } else {
      if (m == 1 ||
          m == 3 ||
          m == 5 ||
          m == 7 ||
          m == 8 ||
          m == 10 ||
          m == 12) {
        if (d <= 31) {
          return true;
        } else {
          return false;
        }
      } else {
        if (d <= 30) {
          return true;
        } else {
          return false;
        }
      }
    }
  }
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
