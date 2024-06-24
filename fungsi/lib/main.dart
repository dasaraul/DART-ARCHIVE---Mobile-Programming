import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daftar Fungsi Dart',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FunctionListPage(),
    );
  }
}

class FunctionListPage extends StatelessWidget {
  final List<Map<String, String>> functions = [
    {'name': 'fungsi_anonim_sort.dart', 'code': _fungsiAnonimSort},
    {'name': 'fungsi_anonim_reduce.dart', 'code': _fungsiAnonimReduce},
    {'name': 'fungsi_anonim_map.dart', 'code': _fungsiAnonimMap},
    {
      'name': 'fungsidengan_parameter_tanpa_nilai_kembalian.dart',
      'code': _fungsidenganParameterTanpaNilaiKembalian
    },
    {
      'name': 'fungsidengan_parameter_dengan_nilai_kembalian.dart',
      'code': _fungsidenganParameterDenganNilaiKembalian
    },
    {
      'name': 'fungsi_tanpa_parameter_tanpa_nilai_kembalian.dart',
      'code': _fungsiTanpaParameterTanpaNilaiKembalian
    },
    {
      'name': 'fungsi_tanpa_parameter_dengan_nilai_kembalian.dart',
      'code': _fungsiTanpaParameterDenganNilaiKembalian
    },
    {'name': 'fungsi_arrow_syntax.dart', 'code': _fungsiArrowSyntax},
    {'name': 'fungsi_anonim_where.dart', 'code': _fungsiAnonimWhere},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Fungsi Dart'),
      ),
      body: ListView.builder(
        itemCount: functions.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(functions[index]['name']!),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FunctionDetailPage(
                    functionName: functions[index]['name']!,
                    functionCode: functions[index]['code']!,
                    functionIndex: index,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class FunctionDetailPage extends StatefulWidget {
  final String functionName;
  final String functionCode;
  final int functionIndex;

  FunctionDetailPage(
      {required this.functionName,
      required this.functionCode,
      required this.functionIndex});

  @override
  _FunctionDetailPageState createState() => _FunctionDetailPageState();
}

class _FunctionDetailPageState extends State<FunctionDetailPage> {
  String _output = '';

  void _runFunction(int index) {
    setState(() {
      _output = '';
    });

    switch (index) {
      case 0:
        _runAnonimSort();
        break;
      case 1:
        _runAnonimReduce();
        break;
      case 2:
        _runAnonimMap();
        break;
      case 3:
        _runParameterTanpaNilaiKembalian();
        break;
      case 4:
        _runParameterDenganNilaiKembalian();
        break;
      case 5:
        _runTanpaParameterTanpaNilaiKembalian();
        break;
      case 6:
        _runTanpaParameterDenganNilaiKembalian();
        break;
      case 7:
        _runArrowSyntax();
        break;
      case 8:
        _runAnonimWhere();
        break;
      default:
        _output = 'Fungsi tidak ditemukan';
    }
  }

  void _runAnonimSort() {
    List<int> nums = [1, 2, 3, 4, 5, 6];
    int jmlNum = nums.reduce((jml, nilai) {
      return jml + nilai;
    });
    setState(() {
      _output = 'Total nums: $jmlNum';
    });
  }

  void _runAnonimReduce() {
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

    setState(() {
      _output = 'List Buah: $buah';
    });
  }

  void _runAnonimMap() {
    List<int> angka = [2, 4, 6, 8, 10, 12];
    List<int> listAngkaKuadrat = angka.map((nilai) {
      return nilai * nilai;
    }).toList();

    setState(() {
      _output = 'Hasil Kuadrat: $listAngkaKuadrat';
    });
  }

  void _runParameterTanpaNilaiKembalian() {
    String nama = 'Muhammad Akbar';
    String npm = '237006516058';
    String prodi = 'Sistem Informasi';
    setState(() {
      // _output = 'Nama Lengkap : $nama $npm $prodi';
      _output = 'Nama Lengkap : $nama\n'
                'NPM          : $npm\n'
                'Program Studi: $prodi';
    });
  }

  void _runParameterDenganNilaiKembalian() {
    int num1 = 7;
    int num2 = 5;
    int num3 = 9;
    int num4 = 2;
    int result = hasil(num1, num2, num3, num4);
    setState(() {
      _output = 'Hasil Nilai Akhir: $result';
    });
  }

  int hasil(int nilai1, int nilai2, int nilai3, int nilai4) {
    int aritmatika =
        (((nilai1 * nilai2) - nilai3 + nilai4) ~/ 2) + (nilai1 ~/ (nilai4 + 1));
    return aritmatika;
  }

  void _runTanpaParameterTanpaNilaiKembalian() {
    String nick = 'Muhammad';
    String mid = 'Akbar';
    String full = 'Nama: $nick $mid';
    setState(() {
      _output = full;
    });
  }

  void _runTanpaParameterDenganNilaiKembalian() {
    double avgnilai = nilaiMinimal();
    setState(() {
      _output = 'Rata-rata nilai: $avgnilai';
    });
  }

  double nilaiMinimal() {
    double Tugas1 = 95.1;
    double Tugas2 = 82.7;
    return (Tugas1 + Tugas2) / 2;
  }

  void _runArrowSyntax() {
    double luasL(double r) => 3.14 * r * r;
    double kelL(double r) => 2 * 3.14 * r;
    double r = 5;
    String hasil =
        'Luas lingkaran dengan r $r adalah ${luasL(r)}\nKeliling lingkaran dengan r $r adalah ${kelL(r)}';
    setState(() {
      _output = hasil;
    });
  }

  void _runAnonimWhere() {
    List<int> num = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    Set<int> rndNum = num.toSet();
    rndNum.add(11);
    List<int> listnum = rndNum.toList();
    listnum.remove(5);
    setState(() {
      _output = 'Hasil: $listnum';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.functionName),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Kode:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                widget.functionCode,
                style: TextStyle(fontFamily: 'monospace'),
              ),
              SizedBox(height: 16),
              Text(
                'Output:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(_output, style: TextStyle(fontFamily: 'monospace')),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  _runFunction(widget.functionIndex);
                },
                child: Text('Run Function'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

const String _fungsiAnonimSort = '''
void main() {
  List<int> nums = [1, 2, 3, 4, 5, 6];
  int jmlNum = nums.reduce((jml, nilai) {
    return jml + nilai;
  });

  print('Total nums: \$jmlNum');
}
''';

const String _fungsiAnonimReduce = '''
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

  print('List Buah: \$buah');
}
''';

const String _fungsiAnonimMap = '''
void main() {
  List<int> angka = [2, 4, 6, 8, 10, 12];
  List<int> listAngkaKuadrat = angka.map((nilai) {
    return nilai * nilai;
  }).toList();

  print('Hasil Kuadrat: \$listAngkaKuadrat');
}
''';

const String _fungsidenganParameterTanpaNilaiKembalian = '''
void main() {
  dataMhs();
}

void dataMhs() {
  String nama = 'Muhammad Akbar';
  String npm = '237006516058';
  String prodi = 'Sistem Informasi';

  print('Nama Lengkap : \$nama');
  print('NPM          : \$npm');
  print('Program Studi: \$prodi');
}
''';

const String _fungsidenganParameterDenganNilaiKembalian = '''
void main() {
  int num1 = 7;
  int num2 = 5;
  int num3 = 9;
  int num4 = 2;
  int result = hasil(num1, num2, num3, num4);
  print('Hasil Nilai Akhir: \$result');
}

int hasil(int nilai1, int nilai2, int nilai3, int nilai4) {
  int aritmatika =
      (((nilai1 * nilai2) - nilai3 + nilai4) ~/ 2) + (nilai1 ~/ (nilai4 + 1));
  return aritmatika;
}
''';

const String _fungsiTanpaParameterTanpaNilaiKembalian = '''
void main() {
  String nick = 'Muhammad';
  String mid = 'Akbar';
  BioMhs(nick, mid);
}

void BioMhs(String nick, String mid) {
  String full = 'Nama: \$nick \$mid';
  print(full);
}
''';

const String _fungsiTanpaParameterDenganNilaiKembalian = '''
void main() {
  double avgnilai = nilaiMinimal();
  print('Rata-rata nilai: \$avgnilai');
}

double nilaiMinimal() {
  double Tugas1 = 95.1;
  double Tugas2 = 82.7;

  return (Tugas1 + Tugas2) / 2;
}
''';

const String _fungsiArrowSyntax = '''
void main() {
  double luasL(double r) => 3.14 * r * r;

  double kelL(double r) => 2 * 3.14 * r;

  void hasil(double r) {
    print('Luas lingkaran dengan r \$r adalah \${luasL(r)}');
    print('Keliling lingkaran dengan r \$r adalah \${kelL(r)}');
  }

  hasil(5);
}
''';

const String _fungsiAnonimWhere = '''
void main() {
  List<int> num = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  Set<int> rndNum = num.toSet();
  rndNum.add(11);
  List<int> listnum = rndNum.toList();
  listnum.remove(5);

  //print out
  print('Hasil: \$listnum');
}
''';
