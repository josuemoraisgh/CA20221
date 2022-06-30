import 'dart:ffi';

int hrtTypeHex2Int(String hex) {
  List<String> validCharacters = [
    '0',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    'a',
    'b',
    'c',
    'd',
    'e',
    'f'
  ];
  if (hex == '') {
    throw ArgumentError("Função hrtTypeHex2Int recebeu string vazia");
  }

  hex = hex.replaceAll(' ', '');
  hex.runes.forEach((element) {
    var ch = new String.fromCharCode(element);
    if (!validCharacters.contains(ch)) {
      throw ArgumentError("Função hrtTypeHex2Int recebeu string inválida.");
    }
  });

  return int.parse(hex, radix: 16);
}
