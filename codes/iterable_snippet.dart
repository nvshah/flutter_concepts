Iterable<int> range({int start = 0, int end, int step = 1}) sync* {
  for (int i = start; i < end; i = i + step) {
    yield i;
  }
}

Iterable<int> numberAndCumulative(
    {int start = 0, int end, int step = 1}) sync* {
  for (int i = start; i < end; i = i + step) {
    yield i;
    yield* range(start: start, end: i);
  }
}

void main() {
  for (int i in range(end: 5)) {
    print(i);
  }

  for (int i in numberAndCumulative(start: 1, end: 3)) {
    print(i);
  }
}
