void main() {
  List<int> nums = [1, 2, 3, 4, 5, 6];
  int jmlNum = nums.reduce((jml, nilai) {
    return jml + nilai;
  });

  print('Total nums: $jmlNum');
}
