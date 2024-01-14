import 'package:flutter/material.dart';
import 'pegawai.dart';

class HasilPegawai extends StatelessWidget {
  final Pegawai pegawai;

  HasilPegawai({required this.pegawai});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hasil Pegawai'),
      ),
      body: Center(
        // Tambahkan widget Center
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Pusatkan vertikal
          crossAxisAlignment: CrossAxisAlignment.start, // Mulai dari kiri
          children: <Widget>[
            Text('NIP: ${pegawai.nip}'),
            Text('Nama: ${pegawai.nama}'),
            Text('Alamat: ${pegawai.alamat}'),
            Text('Golongan: ${pegawai.golongan}'),
            Text('Tanggal: ${pegawai.tanggal.toString()}'),
            Text('Gaji Pokok: ${pegawai.gajiPokok.toString()}'),
            Text('Tunjangan Istri: ${pegawai.tunjanganIstri.toString()}'),
            Text('Tunjangan Anak: ${pegawai.tunjanganAnak.toString()}'),
            Text('Gaji Bersih: ${pegawai.gajiBersih.toString()}'),
          ],
        ),
      ),
    );
  }
}