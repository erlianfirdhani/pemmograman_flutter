class Mahasiswa {
  int id;
  String nama;
  String email;
  String tgllahir;

  Mahasiswa(
      {required this.id,
      required this.nama,
      required this.email,
      required this.tgllahir});

  factory Mahasiswa.fromJson(Map<String, dynamic> json) {
    return Mahasiswa(
      id: json['id'],
      nama: json['nama'],
      email: json['email'],
      tgllahir: json['tgllahir'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama': nama,
      'email': email,
      'tgllahir': tgllahir,
    };
  }
}
