import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    List<Color> myColor = [Colors.red, Colors.green, Colors.blue, Colors.brown];

    final List<Color> myRandomColor = List.generate(
      100,
      (index) => Color.fromRGBO(
        math.Random().nextInt(255),
        math.Random().nextInt(255),
        math.Random().nextInt(255),
        math.Random().nextDouble(),
      ),
    );

    List<String> myName = [
      "dhani",
      "erlian",
      "firdhani",
      "ani"
    ]; //Ini adalah variabel list yang berisi String

    final List<Text> myList = List.generate(
      100,
      (index) => Text(
        "Hallo World " + index.toString(),
      ),
    );

    final List<String> myListName =
        List.generate(100, (index) => "Hallo World ${index + 1}");

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "List View",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        body:
            // ListView(
            //   children: myList,
            // )
            ListView.separated(
          // scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) {
            return Divider()
                // Container(
                //   height: 10,
                // )
                ;
          },
          itemCount: myListName
              .length, //digunakan untuk mendefinisikan jumlah List yang akan digunakan
          itemBuilder: (context, index) {
            //perintah untuk membuat List
            return Container(
              height: 300,
              width: 300,
              color: myRandomColor[index],
              child: Center(
                child: Text(myListName[index],
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    )),
              ),
            );
          },
        ),
      ),
    );
  }
}
