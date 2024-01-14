import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hutang App'),
        ),
        body: HutangScreen(),
      ),
    );
  }
}

class Hutang {
  int id;
  int idNasabah;
  double jumlahHutang;
  int lama;
  double _bunga;

  double get bunga => _bunga;

  set bunga(double value) {
    _bunga = value;
  }
  double total;

  Hutang({
    required this.id,
    required this.idNasabah,
    required this.jumlahHutang,
    required this.lama,
  }) {
    this.bunga = jumlahHutang * 0.12 * (lama / 12); // Adjusted interest calculation
    this.total = jumlahHutang + bunga;
  }
}


class HutangScreen extends StatefulWidget {
  @override
  _HutangScreenState createState() => _HutangScreenState();
}

class _HutangScreenState extends State<HutangScreen> {
  late Hutang hutang;

  @override
  void initState() {
    super.initState();

    // Contoh penggunaan kelas Hutang
    hutang = Hutang(
      id: 1,
      idNasabah: 101,
      jumlahHutang: 1000.0,
      lama: 12,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('ID: ${hutang.id}'),
          Text('ID Nasabah: ${hutang.idNasabah}'),
          Text('Jumlah Hutang: ${hutang.jumlahHutang}'),
          Text('Lama: ${hutang.lama} bulan'),
          Text('Bunga per bulan: ${hutang.bunga}'),
          Text('Total hutang: ${hutang.total}'),
        ],
      ),
    );
  }
}
