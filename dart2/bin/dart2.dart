import 'dart:convert';
import 'dart:io';

import 'package:dart2/dart2.dart' as dart2;

void main(List<String> arguments) {
  getInputStream()
      .listen((line) => print(dart2.isNumber(line) ? line : 'Это не число'));
}

Stream<String> getInputStream() =>
    stdin.transform(utf8.decoder).transform(LineSplitter());
