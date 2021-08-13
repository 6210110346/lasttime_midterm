import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:midterm/pages/home_page.dart';
import 'package:midterm/pages/second_page.dart';
import 'package:midterm/pages/third_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (settings) {
        return PageRouteBuilder(
            settings: settings,
            pageBuilder: (_, __, ___) {
              return _getPageWidget(settings);
            });
      },
    );
  }

  Widget _getPageWidget(RouteSettings settings) {
    final uri = Uri.parse(settings.name ?? '');
    print(uri.path);
    if (uri.path == '/')
      return MyHomePage();
    else if (uri.path == '/2')
      return Second(
        title: ' page',
      );
    else if (uri.path == '/3')
      return Third(
        title: 'page',
      );
    else
      return Container(
        child: Text('URI is error !!!'),
      );
  }
}

// class BottomBar extends StatefulWidget {
//   final Widget body;
//   final int index;
//   BottomBar({
//     required this.index,
//     required this.body,
//   });
//   @override
//   State<StatefulWidget> createState() => _BottomBar();
// }

// class _BottomBar extends State<BottomBar> {
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: widget.body,
//       bottomNavigationBar: BottomNavigationBar(
//         onTap: onTabTapped,
//         currentIndex: widget.index,
//         items: [
//           BottomNavigationBarItem(
//             icon: new Icon(Icons.home),
//             title: new Text('Home'),
//           ),
//           BottomNavigationBarItem(
//             icon: new Icon(Icons.mail),
//             title: new Text('Messages'),
//           ),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.person), title: Text('Profile'))
//         ],
//       ),
//     );
//   }

//   void onTabTapped(int index) {
//     if (index == 0) {
//       Navigator.pushReplacementNamed(context, '/');
//     }
//     if (index == 1) {
//       Navigator.pushReplacementNamed(context, '/2');
//     }
//     if (index == 2) {
//       Navigator.pushReplacementNamed(context, '/3');
//     }
//   }
// }
