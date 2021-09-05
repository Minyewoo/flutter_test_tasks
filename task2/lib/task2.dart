String? checkIfNumber(String? line) {
  var result = int.tryParse(line!);
  return result?.toString() ?? "Это не строка";
}
