import 'package:flutter/material.dart';
import 'package:midterm/objects/work.dart';

// ignore: must_be_immutable
class WorkDialog extends StatefulWidget {
  List<Work> worklist;
  WorkDialog(this.worklist);
  @override
  State<StatefulWidget> createState() => _WorkDialog();
}

class _WorkDialog extends State<WorkDialog> {
  String title = '';
  static final List<String> initialTypes = ['Home work', 'Car care'];
  String type = initialTypes.first;

  @override
  Widget build(BuildContext context) {
    return Dialog(
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
                  border: OutlineInputBorder(borderSide: BorderSide(width: 1)),
                ),
                onChanged: (value) {
                  title = value;
                },
              ),
            ),
            buildDropdownButton(),
            OutlinedButton(
                onPressed: () {
                  setState(() {
                    widget.worklist.add(
                        Work(type: type, title: title, time: DateTime.now()));
                  });
                  Navigator.pop(context);
                },
                child: Text('Create'))
          ],
        ),
      ),
    );
  }

  Widget buildDropdownButton() => DropdownButton<String>(
        value: type,
        items: initialTypes
            .map((item) => DropdownMenuItem(
                  child: Text(item),
                  value: item,
                ))
            .toList(),
        onChanged: (value) => setState(() {
          type = value!;
          print(type);
        }),
      );
}
