import 'dart:convert';
import 'dart:io';

import 'package:dart3/dart3.dart' as dart3;

void main(List<String> arguments) {
  var numbers = [];

  getInputStream().listen(
    (line) {
      if (line == 'exit') exit(0);

      if (dart3.isNumber(line)) {
        numbers.add(line);
        print('Длинна массива: ${numbers.length}');
      } else {
        print('Это не число');
      }
    },
  );
}

Stream<String> getInputStream() =>
    stdin.transform(utf8.decoder).transform(LineSplitter());
