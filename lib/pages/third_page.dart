import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:midterm/main.dart';

class Third extends StatefulWidget {
  Third({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _ThirdState createState() => _ThirdState();
}

class _ThirdState extends State<Third> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('bank'),
      ),
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
