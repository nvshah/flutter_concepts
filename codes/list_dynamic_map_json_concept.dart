void main() {
  List<dynamic> d = [
    {'1': 1},
    {'1': 2},
    {'1': 3}
  ];

  //f(d); // Compile time Error List<dynammic> is not subtype of List<Map<String, dynamic>>

  var lj = d.cast<Map<String, dynamic>>().toList();

  f(lj);
}

void f(List<Map<String, dynamic>> l) {
  print(l);
}
