import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(dateFormat());
}

class dateFormat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('Extract Widget'),
          ),
        ),
        body: Center(
          child: Text(
            DateFormat.yMEd().add_jm().format(DateTime.now()),
            style: TextStyle(fontSize: 25),
          ),
        ),
      ),
    );
  }
}
