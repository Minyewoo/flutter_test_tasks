bool isNumber(String? line) {
  var result = int.tryParse(line!);
  return result != null && result > 0;
}
