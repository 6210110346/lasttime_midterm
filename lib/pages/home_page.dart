import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:midterm/objects/work.dart';
import 'package:midterm/widgets/boxes.dart';
import 'package:midterm/widgets/history_dialog.dart';
import 'package:midterm/widgets/work_dialog.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<Work> works = [];

  final TextEditingController filterController = TextEditingController();
  @override
  void dispose() {
    Hive.box('works').close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Last time'),
      ),
      body: ValueListenableBuilder<Box<Work>>(
        valueListenable: Boxes.getWorks().listenable(),
        builder: (context, box, _) {
          final works = box.values.toList().cast<Work>();
          return Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 150,
                    margin: EdgeInsets.all(10),
                    child: TextFormField(
                      controller: filterController,
                      decoration: InputDecoration(
                        labelText: 'Filter by type',
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 1)),
                      ),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      sortData();
                    },
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
                              onTap: () {
                                showHistory(works[index]);
                              },
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
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
            context: context,
            builder: (_) => WorkDialog((value) {
                  // setState(() {
                  //   works.add(value);
                  // });
                  final box = Boxes.getWorks();
                  box.add(value);
                })),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  void sortData() {
    setState(() {
      works.sort((a, b) => a.time.compareTo(b.time));
    });
  }

  void showHistory(Work work) {
    showDialog(context: context, builder: (_) => HistoryDialog(work));
  }
}
