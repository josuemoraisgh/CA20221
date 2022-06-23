import 'dart:math';
import 'dec_bin.dart';

//void main() => print(hrtTypeSReal2Hex(-13.39));

String hrtTypeSReal2Hex(double hartRealValue){
  int bitsArray = 0;

  if(hartRealValue < 0){
    bitsArray = bitsArray.setBits(31, 1, 1);
    hartRealValue = (-1) * hartRealValue;
  }
  
  final int e = 127 + (log(hartRealValue) / log(2)).floor();
  bitsArray = bitsArray.setBits(23, 8, e);

  final int f = (((hartRealValue/pow(2,e-127))-1)*8388608).floor();
  bitsArray = bitsArray.setBits(0, 23, f);

  return bitsArray.toRadixString(16);
}