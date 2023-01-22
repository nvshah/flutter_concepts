void main() {
  final bb = B(4);
  print(bb.b);
  print(bb.a);
}

class A{
  final int a;
  
  A(this.a);
}

class B extends A{
  final int b;
  B(int b):this.b=b, super(b);
}
