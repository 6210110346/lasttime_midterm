import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:midterm/objects/work.dart';
import 'package:midterm/widgets/work_dialog.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<Work> works = workList;

  late String title;

  static final List<String> initialTypes = ['Home work', 'Car care'];
  String type = initialTypes.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Last time'),
      ),
      body: Column(
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
                    border:
                        OutlineInputBorder(borderSide: BorderSide(width: 1)),
                  ),
                ),
              ),
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
          Expanded(
            child: ListView.builder(
                itemCount: works.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(5),
                        child: ListTile(
                          title: Text(works[index].title),
                          subtitle: Text(works[index].type),
                          trailing: Text(DateFormat('dd/MM/yyyy')
                              .format(works[index].time)),
                          onTap: () {},
                        ),
                      ),
                      const Divider(
                        height: 20,
                        thickness: 5,
                        indent: 20,
                        endIndent: 20,
                      ),
                    ],
                  );
                }),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
            context: context,
            builder: (_) => WorkDialog((value) {
                  setState(() {
                    works.add(value);
                  });
                })),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
