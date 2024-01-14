class Pegawai {
  String nip;
  String nama;
  String alamat;
  String golongan;
  DateTime tanggal;
  double gajiPokok;
  double tunjanganIstri;
  double tunjanganAnak;
  double gajiBersih;

  Pegawai({
    required this.nip,
    required this.nama,
    required this.alamat,
    required this.golongan,
    required this.tanggal,
    required this.gajiPokok,
    required this.tunjanganIstri,
    required this.tunjanganAnak,
    required this.gajiBersih,
  });

  void prosesGaji() {
    if (golongan == 'IIIA') {
      gajiPokok = 1000000;
    } else if (golongan == 'IIIB') {
      gajiPokok = 2000000;
    } else if (golongan == 'IIIC') {
      gajiPokok = 3000000;
    }

    tunjanganIstri = 0.05 * gajiPokok;
    tunjanganAnak = 0.05 * gajiPokok;
    gajiBersih = gajiPokok + tunjanganIstri + tunjanganAnak;
  }
}
