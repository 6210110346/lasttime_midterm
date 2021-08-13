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
    var timeLength = widget.work.timeList.length;
    return Dialog(
      child: Container(
          width: 250,
          height: 250,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Center(
                  child: Text('History'),
                ),
              ),
              Container(
                child: ListTile(
                  title: Text(widget.work.title),
                  trailing: Text(widget.work.type),
                ),
              ),
              // Text(widget.work.timeList[0].toString())
              // ListView.builder(
              //     itemCount: timeLength,
              //     itemBuilder: (context, index) {
              //       return Container(
              //         margin: EdgeInsets.all(5),
              //         child: ListTile(
              //           title: Text(''),
              //         ),
              //       );
              //     }),
              Expanded(
                child: ListView.builder(itemBuilder: (context, index) {
                  return ListTile();
                }),
              )
            ],
          )),
    );
  }
}
