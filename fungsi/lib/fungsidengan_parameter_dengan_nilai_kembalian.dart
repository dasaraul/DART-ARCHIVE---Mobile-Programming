void main() {
  int num1 = 7;
  int num2 = 5;
  int num3 = 9;
  int num4 = 2;
  int result = hasil(num1, num2, num3, num4);
  print('Hasil Nilai Akhir: $result');
}

int hasil(int nilai1, int nilai2, int nilai3, int nilai4) {
  int aritmatika =
      (((nilai1 * nilai2) - nilai3 + nilai4) ~/ 2) + (nilai1 ~/ (nilai4 + 1));
  return aritmatika;
}
