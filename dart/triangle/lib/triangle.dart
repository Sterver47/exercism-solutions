class Triangle {
  bool equilateral(double a, double b, double c) =>
      _isTriangle(a, b, c) && a == b && b == c;

  bool isosceles(double a, double b, double c) =>
      _isTriangle(a, b, c) && (a == b || b == c || a == c);

  bool scalene(double a, double b, double c) =>
      _isTriangle(a, b, c) && a != b && b != c && a != c;

  bool _isTriangle(double a, double b, double c) =>
      a + b > c && b + c > a && a + c > b;
}
