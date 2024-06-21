void main() {
  List<String> buah = [
    'Apel',
    'Pisang',
    'Anggur',
    'Melon',
    'Semangka',
    'Stroberi',
    'Leci'
  ];

  buah.sort((awal, akhir) {
    return akhir.compareTo(awal);
  });

  print('List Buah: $buah');
}
