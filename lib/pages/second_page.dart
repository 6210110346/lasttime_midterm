import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:midterm/main.dart';

class Second extends StatefulWidget {
  Second({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _SecondState createState() => _SecondState();
}

class _SecondState extends State<Second> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
    );
  }
}
