import 'package:flutter/material.dart';
import 'package:first_project/pages/defaulters/defaulters.dart';

void main() {
  runApp(Dafaulter());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Defailter List',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Defailter List'),
        ),
        body: Row(),
      ),
    );
  }
}
