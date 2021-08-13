import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
    widget.work.timeList.sort((a, b) => b.compareTo(a));
    return Dialog(
      child: Container(
          width: 250,
          height: 250,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Center(
                  child: Text('History ' +
                      widget.work.title +
                      ' ' +
                      '(${widget.work.type})'),
                ),
              ),
              // Text(widget.work.timeList[0].toString()),
              Expanded(
                child: ListView.builder(
                    itemCount: timeLength,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(5),
                        child: ListTile(
                          title: Text('${index + 1}' +
                              '. ' +
                              '${DateFormat('dd/MM/yyyy : HH:mm:ss').format(widget.work.timeList[index])}'),
                        ),
                      );
                    }),
              ),
            ],
          )),
    );
  }
}
