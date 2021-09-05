
import 'dart:io';

import 'package:task2/task2.dart' as task2;

void main(List<String> arguments) {
  final input = stdin.readLineSync();
  print(task2.checkIfNumber(input));
}