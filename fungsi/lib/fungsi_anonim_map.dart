void main() {
  List<int> angka = [2, 4, 6, 8, 10, 12];
  List<int> listAngkaKuadrat = angka.map((nilai) {
    return nilai * nilai;
  }).toList();

  print('Hasil Kuadrat: $listAngkaKuadrat');
}
