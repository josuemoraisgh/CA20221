asciiToHex(String form)
{
  if (form == '')
    throw ArgumentError("Função asciiToHex recebeu string vazia");
  if (form.length > 3)
    throw ArgumentError(
        "Função asciiToHex recebeu asciiToHex com mais de dois termos");
  if(form.split('').where((element) => int.parse(element, radix: 95) > 1).isNotEmpty)
    throw ArgumentError(
        "Função hrtTypeHex2UInt recebeu hexString com caracteres que não são hex");

  var symbols = "!\"#\$%&'()*+,-./0123456789:;<=>?@";
  var loAZ = "abcdefghijklmnopqrstuvwxyz";
  symbols += loAZ.toUpperCase();
  symbols += "[\\]^_'";
  symbols += loAZ;
  symbols += "{|}-";
  var valueStr = form;
  var hexChars = "0123456789abcdef";
  var text = "";
  for (var i=0 ; i<valueStr.length; i++ )
  {
    var oneChar = valueStr[i];
    int asciiValue = symbols.indexOf(oneChar) + 33;
    int index1 = asciiValue % 16;
    int index2 = (asciiValue - index1)~/16; // -/ => Divide, returning an integer result
    if (text != "") text +=" ";
    text += hexChars[index2];
    text += hexChars[index1];

  }
  return text;
}

void main(){
  print(asciiToHex('Gustavo'));
}