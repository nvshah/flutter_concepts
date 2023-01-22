void main() {
  final l = [const Sample(3), const Sample(3)];
  print(identical(l[0], l[1]));

  const l2 = [Sample(4), Sample(4)];
  print(identical(l2[0], l2[1]));

  var l3 = const [Sample(4), Sample(4)];
  print(identical(l3[0], l3[1]));

  var l4 = [Sample(4), Sample(4)];
  print(identical(l4[0], l4[1]));
}

class Sample {
  final int i;
  const Sample(this.i);
}
