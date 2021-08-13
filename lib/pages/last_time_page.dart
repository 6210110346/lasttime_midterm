// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:midterm/objects/work.dart';
// import 'package:midterm/widgets/history_dialog.dart';

// class LastTimePage extends StatefulWidget {
//   final List<Work> workList;
//   Function callback;
//   LastTimePage(this.workList, this.callback);
//   @override
//   State<StatefulWidget> createState() => _LastTimePage(workList);
// }

// class _LastTimePage extends State<LastTimePage> {
//   final TextEditingController filterController = TextEditingController();
//   List<Work> works = [];
//   late List<Work> worksForFilter = works;

//   _LastTimePage(this.works);
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             Container(
//               width: 150,
//               margin: EdgeInsets.fromLTRB(10, 10, 0, 10),
//               child: TextFormField(
//                 controller: filterController,
//                 decoration: InputDecoration(
//                   labelText: 'Filter by type',
//                   border: OutlineInputBorder(borderSide: BorderSide(width: 1)),
//                 ),
//               ),
//             ),
//             MaterialButton(
//               onPressed: () {
//                 filter(filterController.text);
//               },
//               color: Colors.blue,
//               textColor: Colors.white,
//               child: Icon(
//                 Icons.search_rounded,
//                 size: 24,
//               ),
//               padding: EdgeInsets.all(16),
//               shape: CircleBorder(),
//             )
//           ],
//         ),
//         Expanded(
//           child: ListView.builder(
//               itemCount: works.length,
//               itemBuilder: (context, index) {
//                 return Column(
//                   children: [
//                     Container(
//                       margin: EdgeInsets.all(5),
//                       child: ListTile(
//                         title: Text(works[index].title),
//                         subtitle: Text(works[index].type),
//                         trailing: Text(DateFormat('dd/MM/yyyy : HH:mm:ss')
//                             .format(works[index].timeList.last)),
//                         onLongPress: () {
//                           showHistory(works[index]);
//                         },
//                         onTap: () {
//                           showHandleAddTime(works[index]);
//                         },
//                       ),
//                     ),
//                     const Divider(
//                       height: 20,
//                       thickness: 5,
//                       indent: 20,
//                       endIndent: 20,
//                     ),
//                   ],
//                 );
//               }),
//         )
//       ],
//     );
//   }

//   void showHistory(Work work) {
//     showDialog(context: context, builder: (_) => HistoryDialog(work));
//   }

//   void showHandleAddTime(Work work) {
//     showDialog(
//         context: context,
//         builder: (_) => AlertDialog(
//               title: Text('Confirm to work'),
//               actions: [
//                 Container(
//                   height: 30,
//                   margin: EdgeInsets.all(10),
//                   child: OutlinedButton(
//                       onPressed: () => Navigator.pop(context),
//                       child: Text('No')),
//                 ),
//                 Container(
//                   height: 30,
//                   margin: EdgeInsets.all(10),
//                   child: OutlinedButton(
//                       onPressed: () {
//                         work.timeList.add(DateTime.now());
//                         work.save();

//                         Navigator.pop(context);
//                       },
//                       child: Text('Yes')),
//                 )
//               ],
//             ));
//   }

//   void filter(String text) {
//     setState(() {
//       works = worksForFilter
//           .where((work) => work.type
//               .toUpperCase()
//               .contains(filterController.text.toUpperCase()))
//           .toList();
//     });
//   }
// }
