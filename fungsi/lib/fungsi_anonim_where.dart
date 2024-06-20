void main() {
  List<int> num = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  Set<int> rndNum = num.toSet();
  rndNum.add(11);
  List<int> listnum = rndNum.toList();
  listnum.remove(5);

  //print out
  print('Hasil: $listnum');
}
