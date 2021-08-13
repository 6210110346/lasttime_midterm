import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:midterm/objects/work.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  late List<Work> works = [];
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Last time'),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 150,
                margin: EdgeInsets.all(10),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Filter by type',
                    // filled: true,
                    border:
                        OutlineInputBorder(borderSide: BorderSide(width: 1)),
                  ),
                ),
              ),
              // ignore: deprecated_member_use
              MaterialButton(
                onPressed: () {},
                color: Colors.blue,
                textColor: Colors.white,
                child: Icon(
                  Icons.article_outlined,
                  size: 24,
                ),
                padding: EdgeInsets.all(16),
                shape: CircleBorder(),
              )
            ],
          ),
          ListView.builder(
              itemCount: works.length,
              itemBuilder: (context, index) {
                return Text('bank');
              })
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
