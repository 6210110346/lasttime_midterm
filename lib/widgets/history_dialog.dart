import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:midterm/objects/work.dart';

class HistoryDialog extends StatefulWidget {
  final Work work;
  HistoryDialog(this.work);
  @override
  State<StatefulWidget> createState() => _HistoryDialog();
}

class _HistoryDialog extends State<HistoryDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Container(
          width: 100,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Center(
                  child: Text('History'),
                ),
              ),
              ListTile(
                title: Text(widget.work.title),
                trailing: Text(widget.work.type),
              )
              // TODO add listview builder of history
            ],
          )),
    );
  }
}
