ascii_to_hex(form)
{
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
  print(ascii_to_hex('Gustavo'));
}