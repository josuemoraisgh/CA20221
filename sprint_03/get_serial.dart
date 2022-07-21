import 'dart:typed_data';
import 'dart:convert' show Utf8Decoder;
import 'package:libserialport/libserialport.dart';
import 'dart:ffi' as ffi;
import 'dart:io';

//convert uint8list to ascii char code string with spaces
String uint8ListToStringWithSpaces(Uint8List list) {
  StringBuffer sb = new StringBuffer();
  for (int i = 0; i < list.length; i++) {
    sb.write(list[i]);
    sb.write(' ');
  }
  return sb.toString();
}

void main() {
  final name = SerialPort.availablePorts.first;
  final port = SerialPort(name); //name

  final config = SerialPortConfig();
  config.baudRate = 9600;
  config.bits = 8;

  //port.config.baudRate = 9600;
  if (!port.openReadWrite()) {
    print(SerialPort.lastError);
    exit(-1);
  }
  //port.write('Hello World!\n');

  final reader = SerialPortReader(port);
  reader.stream.listen((data) {
    //print((data));
    print(uint8ListToStringWithSpaces(data));
    /*const Utf8Decoder(allowMalformed: true).convert(data).forEach((line) {
      print(line);
    });*/

    //print('received: $data');
  });
}

void avail_ports() {
  print('Available ports:');
  var i = 0;
  for (final name in SerialPort.availablePorts) {
    final sp = SerialPort(name);
    print('${++i}) $name');
    print('\tDescription: ${sp.description}');
    print('\tManufacturer: ${sp.manufacturer}');
    print('\tSerial Number: ${sp.serialNumber}');
    print('\tProduct ID: 0x${sp.productId!.toRadixString(16)}');
    print('\tVendor ID: 0x${sp.vendorId!.toRadixString(16)}');
    sp.dispose();
  }
}
