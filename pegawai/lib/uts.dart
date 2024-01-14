import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('tugas2_flutter'),
        ),
        body: BiayaAirForm(),
      ),
    );
  }
}

class BiayaAirForm extends StatefulWidget {
  @override
  _BiayaAirFormState createState() => _BiayaAirFormState();
}

class _BiayaAirFormState extends State<BiayaAirForm> {
  TextEditingController idPelangganController = TextEditingController();
  TextEditingController namaPelangganController = TextEditingController();
  TextEditingController meteranAwalController = TextEditingController();
  TextEditingController meteranAkhirController = TextEditingController();

  double biayaPerMeter = 5000;
  double pajakPersentase = 0.05;

  double totalBiaya = 0;
  double pajak = 0;
  double totalPembayaran = 0;

  void hitungBiayaAir() {
    double meteranAwal = double.parse(meteranAwalController.text);
    double meteranAkhir = double.parse(meteranAkhirController.text);

    double totalMeteran = meteranAkhir - meteranAwal;
    totalBiaya = totalMeteran * biayaPerMeter;
    pajak = totalBiaya * pajakPersentase;
    totalPembayaran = totalBiaya + pajak;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Image.asset('assets/Image/pdam.jpeg', height: 150, width: 150),
          TextFormField(
            controller: idPelangganController,
            decoration: InputDecoration(labelText: 'ID Pelanggan'),
            keyboardType: TextInputType.number,
          ),
          TextFormField(
            controller: namaPelangganController,
            decoration: InputDecoration(labelText: 'Nama Pelanggan'),
          ),
          TextFormField(
            controller: meteranAwalController,
            decoration: InputDecoration(labelText: 'Meteran Awal'),
            keyboardType: TextInputType.number,
          ),
          TextFormField(
            controller: meteranAkhirController,
            decoration: InputDecoration(labelText: 'Meteran Akhir'),
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              setState(() {
                hitungBiayaAir();
              });
            },
            child: Text('Hitung Biaya Air'),
          ),
          SizedBox(height: 20),
          Text('Total Meteran: ${totalBiaya.toStringAsFixed(2)}'),
          Text('Biaya: ${totalBiaya.toStringAsFixed(2)}'),
          Text('Pajak: ${pajak.toStringAsFixed(2)}'),
          Text('Total Pembayaran: ${totalPembayaran.toStringAsFixed(2)}'),
        ],
      ),
    );
  }
}