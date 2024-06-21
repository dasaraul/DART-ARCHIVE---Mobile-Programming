void main() {
  double luasL(double r) => 3.14 * r * r;

  double kelL(double r) => 2 * 3.14 * r;

  void hasil(double r) {
    print('Luas lingkaran dengan radius $r adalah ${luasL(r)}');
    print('Keliling lingkaran dengan radius $r adalah ${kelL(r)}');
  }

  hasil(5);
}
