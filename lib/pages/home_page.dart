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
          works = box.values.toList().cast<Work>();
          works.sort((a, b) => b.timeList.last.compareTo(a.timeList.last));
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
                      filterType(filterController.text);
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
                              trailing: Text(DateFormat('dd/MM/yyyy : HH:mm:ss')
                                  .format(works[index].timeList.last)),
                              onLongPress: () {
                                showHistory(works[index]);
                              },
                              onTap: () {
                                showHandleAddTime(works[index]);
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
                  final box = Boxes.getWorks();
                  box.add(value);

                  // box.sort
                })),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  void showHistory(Work work) {
    showDialog(context: context, builder: (_) => HistoryDialog(work));
  }

  void showHandleAddTime(Work work) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text('Confirm to work'),
              actions: [
                Container(
                  height: 30,
                  margin: EdgeInsets.all(10),
                  child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('No')),
                ),
                Container(
                  height: 30,
                  margin: EdgeInsets.all(10),
                  child: OutlinedButton(
                      onPressed: () {
                        work.timeList.add(DateTime.now());
                        work.save();
                        Navigator.pop(context);
                      },
                      child: Text('Yes')),
                )
              ],
            ));
  }

  void filterType(String text) {
    works = works
        .where((work) => work.type.toUpperCase().contains(text.toUpperCase()))
        .toList();
  }
}
