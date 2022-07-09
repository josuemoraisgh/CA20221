String hrtTypeTime2Hex(String time) {
  if (time == '') {
    throw ArgumentError("A função recebeu uma string vazia");
  }
  else if (time.length > 12) {
    throw ArgumentError("A função recebeu uma string com tempo inválido");
  }
  final auxStringTime = time.split(':');
  String valor = (double.parse(auxStringTime[0]) * 112500000 +
          double.parse(auxStringTime[1]) * 1920000 +
          double.parse(auxStringTime[2]) * 320000 +
          double.parse(auxStringTime[3]) / 0.03125)
      .round()
      .toRadixString(2);
  valor = ('${int.parse(valor.substring(0, 7), radix: 2)
          .toRadixString(16)
          .toUpperCase()} ${int.parse(valor.substring(8, 15), radix: 2)
          .toRadixString(16)
          .toUpperCase()} ${int.parse(valor.substring(16, 23), radix: 2)
          .toRadixString(16)
          .toUpperCase()} ${int.parse(valor.substring(24, 31), radix: 2)
          .toRadixString(16)
          .toUpperCase()}');
  print(valor);
  return valor;
}