import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class Work extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String type;
  @HiveField(2)
  late DateTime time;
  Work({required this.type, required this.title, required this.time});
}

var workList = [
  Work(type: 'homework', title: 'กวาดบ้าน', time: DateTime.now())
];
