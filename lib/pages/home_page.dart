import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:midterm/objects/work.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<Work> works = workList;

  late String title;

  List<String> initialTypes = ['Home work', 'Car care'];
  late String type = initialTypes.first;
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
          Expanded(
            child: ListView.builder(
                itemCount: works.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        title: Text(works[index].title),
                        trailing: Text(
                            DateFormat('dd/MM/yyyy').format(works[index].time)),
                        onTap: () {},
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
            builder: (_) => Dialog(
                  child: Container(
                    height: 250,
                    width: 215,
                    child: Column(
                      children: [
                        Container(
                          width: 150,
                          alignment: Alignment.center,
                          margin: EdgeInsets.all(10),
                          child: Text(
                            'Creat Work',
                            textScaleFactor: 1.3,
                          ),
                        ),
                        Container(
                          width: 200,
                          margin: EdgeInsets.all(10),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Title',
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 1)),
                            ),
                            onChanged: (value) {
                              this.title = value;
                            },
                          ),
                        ),
                        // Container(
                        //   width: 200,
                        //   margin: EdgeInsets.all(10),
                        //   child: TextFormField(
                        //     decoration: InputDecoration(
                        //       labelText: 'Type',
                        //       border: OutlineInputBorder(
                        //           borderSide: BorderSide(width: 1)),
                        //     ),
                        //   ),
                        // ),
                        DropdownButton<String>(
                          items: initialTypes
                              .map<DropdownMenuItem<String>>((String item) {
                            return DropdownMenuItem(
                              child: Text(item),
                              value: item,
                            );
                          }).toList(),
                          value: type,
                          onChanged: (String? value) {
                            setState(() {
                              this.type = value!;
                              // print(type);
                            });
                          },
                        ),
                        OutlinedButton(
                            onPressed: () {
                              setState(() {
                                works.add(Work(
                                    type: type,
                                    title: title,
                                    time: DateTime.now()));
                              });
                              Navigator.pop(context);
                            },
                            child: Text('Create'))
                      ],
                    ),
                  ),
                )),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
