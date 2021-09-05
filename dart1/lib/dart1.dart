import 'dart:math';

List<int> getEven() {
  var random = Random();
  var array = List.generate(10, (index) => random.nextInt(1000));

  return array.where((number) => number % 2 == 0).toList();
}