import 'package:flutter/material.dart';

void main() {
  runApp(MyUtsTest());
}

var nobp = "";
var nama = "";
var MTK = 0;
var Bing = 0;
var Java = 0;
var rata = 0.0;

class MyUtsTest extends StatefulWidget {
  @override
  State<MyUtsTest> createState() => _MyUtsTestState();
}

class _MyUtsTestState extends State<MyUtsTest> {
  final TextEditingController nobpController = TextEditingController();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController MTKController = TextEditingController();
  final TextEditingController BingController = TextEditingController();
  final TextEditingController JavaController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("UTS Latihan"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                autocorrect: true,
                decoration: InputDecoration(
                  labelText: "No BP",
                  hintText: "No Bp",
                  border: OutlineInputBorder(),
                ),
                // autofocus: true,
                onChanged: (value) {
                  setState(() {
                    nobp = value;
                    // Calculate the rata variable.
                    rata = (MTK + Bing + Java) / 3.0;
                  });
                  print(nobp);
                },
                controller: nobpController,
              ),
              TextField(
                autocorrect: true,
                decoration: InputDecoration(
                  labelText: "Nama",
                  hintText: "Nama",
                  border: OutlineInputBorder(),
                ),
                // autofocus: true,
                onChanged: (value) {
                  setState(() {
                    nama = value;
                    // Calculate the rata variable.
                    rata = (MTK + Bing + Java) / 3.0;
                  });
                  print(nama);
                },
                controller: namaController,
              ),
              TextField(
                autocorrect: true,
                decoration: InputDecoration(
                  labelText: "MTK",
                  hintText: "MTK",
                  border: OutlineInputBorder(),
                ),
                // autofocus: true,
                onChanged: (value) {
                  setState(() {
                    MTK = int.parse(value);
                    // Calculate the rata variable.
                    rata = (MTK + Bing + Java) / 3.0;
                  });
                  print(MTK);
                },
                controller: MTKController,
              ),
              TextField(
                autocorrect: true,
                decoration: InputDecoration(
                  labelText: "B. Ing",
                  hintText: "B. Ing",
                  border: OutlineInputBorder(),
                ),
                // autofocus: true,
                onChanged: (value) {
                  setState(() {
                    Bing = int.parse(value);
                    // Calculate the rata variable.
                    rata = (MTK + Bing + Java) / 3.0;
                  });
                  print(Bing);
                },
                controller: BingController,
              ),
              TextField(
                autocorrect: true,
                decoration: InputDecoration(
                  labelText: "Java",
                  hintText: "Java",
                  border: OutlineInputBorder(),
                ),
                // autofocus: true,
                onChanged: (value) {
                  setState(
                    () {
                      Java = int.parse(value);
                      // Calculate the rata variable.
                      rata = (MTK + Bing + Java) / 3.0;
                    },
                  );
                  print(Java);
                },
                controller: JavaController,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Builder(
                    builder: (context) {
                      return ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MyHasil(),
                              ),
                            );
                          },
                          child: Text("Ok"));
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        nobpController.clear();
                        namaController.clear();
                        MTKController.clear();
                        BingController.clear();
                        JavaController.clear();
                        nobp = "";
                        nama = "";
                        MTK = 0;
                        Bing = 0;
                        Java = 0;
                        rata = 0.0;
                      });
                    },
                    child: Text("Reset"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyHasil extends StatelessWidget {
  const MyHasil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Hasil"),
          leading: BackButton(
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: ScaffoldMessenger(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Hasil"),
              SizedBox(
                height: 20,
              ),
              Text("No BP: $nobp"),
              SizedBox(
                height: 20,
              ),
              Text("Nama: $nama"),
              SizedBox(
                height: 20,
              ),
              Text("MTK: $MTK"),
              SizedBox(
                height: 20,
              ),
              Text("B. Inggris: $Bing"),
              SizedBox(
                height: 20,
              ),
              Text("Java: $Java"),
              SizedBox(
                height: 20,
              ),
              Text("Rata: $rata"),
            ],
          ),
        ),
      ),
    );
  }
}