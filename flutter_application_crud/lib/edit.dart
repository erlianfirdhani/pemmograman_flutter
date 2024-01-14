import 'package:flutter/material.dart' show AppBar, BuildContext, Column, CrossAxisAlignment, EdgeInsets, ElevatedButton, InputDecoration, Padding, Scaffold, SingleChildScrollView, State, StatefulWidget, Text, TextEditingController, TextFormField, Widget;
import 'package:flutter_application_crud/Mahasiswa.dart';
import 'package:flutter_application_crud/api.dart';

class Update extends StatefulWidget {
  final int id;
  final String nama;
  final String email;
  final String tgllahir;

  Update(this.id, this.nama, this.email, this.tgllahir);

  @override
  State<Update> createState() => _UpdateState();
}

final ApiService _apiService = ApiService();
TextEditingController _namaController = TextEditingController();
TextEditingController _emailController = TextEditingController();
TextEditingController _tgllahirController = TextEditingController();

class _UpdateState extends State<Update> {
  void initState() {
    super.initState();
    // Set initial values for controllers based on widget parameters
    _namaController.text = widget.nama;
    _emailController.text = widget.email;
    _tgllahirController.text = widget.tgllahir;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _namaController,
                decoration: InputDecoration(labelText: 'Nama'),
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              TextFormField(
                controller: _tgllahirController,
                decoration: InputDecoration(labelText: 'Tgl Lahir'),
              ),
              ElevatedButton(
                  onPressed: () async {
                    Mahasiswa editPost = Mahasiswa(
                      id: widget.id,
                      nama: _namaController.text,
                      email: _emailController.text,
                      tgllahir: _tgllahirController.text,
                    );

                    print(_namaController.text);

                    // Cetak log untuk memeriksa apakah data yang diperbarui benar-benar dikirim ke server
                    // print("Updating post: ${editPost.id}");

                    Mahasiswa editedPost =
                        await _apiService.updateMahasiswa(editPost);
                  },
                  child: Text('Update'))
            ],
          ),
        ),
      ),
    );
  }
}
