import "package:flutter/material.dart";
import 'dart:math' as math;

void main() {
  runApp(MyAppBar());
}

class MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("My App Bar"),
          centerTitle: true,
          leading: Container(
            color: Colors.black,
            child: Center(
              child: Text("Leading"),
            ),
          ),
          leadingWidth: 150,
          actions: [
            Containeritems(i: 0),
            Containeritems(i: 0),
          ],
          bottom: PreferredSize(
            preferredSize: Size(
              10000,
              60,
            ),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
              child: Center(
                child: Text(
                  'Bottom',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              height: 50,
              color: Colors.black38,
            ),
          ),
          flexibleSpace: Container(
            color: Colors.lightBlueAccent,
          ),
        ),
      ),
    );
  }
}

class Containeritems extends StatelessWidget {
  int i;
  List<Color> listColor = List.generate(
    2,
    (index) => Color.fromRGBO(
      math.Random().nextInt(255),
      math.Random().nextInt(255),
      math.Random().nextInt(255),
      math.Random().nextDouble(),
    ),
  );
  Containeritems({required this.i});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('Action')),
      width: 60,
      color: listColor[i],
    );
  }
}
