import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:midterm/objects/work.dart';
import 'package:midterm/pages/last_time_page.dart';
import 'package:midterm/widgets/boxes.dart';
import 'package:midterm/widgets/history_dialog.dart';
import 'package:midterm/widgets/work_dialog.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<Work> works = [];

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
          print('helppppp');
          works = box.values.toList().cast<Work>();
          works.sort((a, b) => b.timeList.last.compareTo(a.timeList.last));
          return LastTimePage(works);
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

  void filterType(String text) {}
}
