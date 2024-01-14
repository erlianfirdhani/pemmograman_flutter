import 'package:flutter/material.dart';
import 'package:flutter_application_crud/Mahasiswa.dart';
import 'package:flutter_application_crud/api.dart';
import 'edit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ApiService _apiService = ApiService();
  TextEditingController _namaController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _tgllahirController = TextEditingController();

  int idMahasiswa = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CRUD Example'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text("Id data : $idMahasiswa"),
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
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          // Example: Creating a new post
                          Mahasiswa newPost = Mahasiswa(
                            id: 0,
                            nama: _namaController.text,
                            email: _emailController.text,
                            tgllahir: _tgllahirController.text,
                          );
                          Mahasiswa createdPost =
                              await _apiService.createMahasiswa(newPost);

                          // Clear text fields
                          _namaController.clear();
                          _emailController.clear();
                          _tgllahirController.clear();

                          // Refresh the UI after creating a new post
                          setState(() {});
                        },
                        child: Text('Create Post'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Clear text fields
                          _namaController.clear();
                          _emailController.clear();
                          _tgllahirController.clear();
                          setState(() {
                            idMahasiswa = 0;
                          });
                        },
                        child: Text('Clear Post'),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          Mahasiswa editPost = Mahasiswa(
                            id: idMahasiswa,
                            nama: _namaController.text,
                            email: _emailController.text,
                            tgllahir: _tgllahirController.text,
                          );

                          print(_namaController.text);

                          // Cetak log untuk memeriksa apakah data yang diperbarui benar-benar dikirim ke server
                          // print("Updating post: ${editPost.id}");

                          // Cetak log untuk memeriksa apakah pembaruan berhasil
                          print("Post updated successfully");

                          setState(() {
                            idMahasiswa = 0;
                          });

                          _namaController.clear();
                          _emailController.clear();
                          _tgllahirController.clear();

                          Mahasiswa editedPost =
                              await _apiService.updateMahasiswa(editPost);

                          // Fetch updated data from the server
                          await _apiService.getMahasiswa();
                        },
                        child: Text('Edit Post'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            child: Container(
              margin: EdgeInsets.all(10),
              child: FutureBuilder<List<Mahasiswa>>(
                future: _apiService.getMahasiswa(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    List<Mahasiswa> posts = snapshot.data!;
                    return ListView.builder(
                      itemCount: posts.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(posts[index].nama),
                          subtitle: Text(posts[index].email),
                          trailing: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.red),
                            ),
                            onPressed: () async {
                              _apiService.deleteMahasiswa(posts[index].id);
                              _apiService.getMahasiswa();
                              setState(() {});
                            },
                            child: Text('Delete'),
                          ),
                          onTap: () async {
                            Mahasiswa selectedMahasiswa = await _apiService
                                .getMahasiswaById(posts[index].id);

                            // Set the controller values with the selected Mahasiswa's data
                            idMahasiswa = selectedMahasiswa.id;
                            _namaController.text = selectedMahasiswa.nama;
                            _emailController.text = selectedMahasiswa.email;
                            _tgllahirController.text =
                                selectedMahasiswa.tgllahir;

                            _apiService.getMahasiswa();

                            setState(() {
                              idMahasiswa = selectedMahasiswa.id;
                              print(idMahasiswa);
                            });

                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => Update(
                            //           selectedMahasiswa.id,
                            //           selectedMahasiswa.nama,
                            //           selectedMahasiswa.email,
                            //           selectedMahasiswa.tgllahir),
                            //     ));
                          },
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
